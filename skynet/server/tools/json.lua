--[[

Copyright (c) 2011-2014 chukong-inc.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

]]

--------------------------------
-- @module json

--[[--

JSON 编码与解码

]]
local json = {}

local cjson
local function safeLoad()
    cjson = require("cjson")
end

if not pcall(safeLoad) then 
    cjson = nil
end

function json.encode(var)
    local status, result = pcall(cjson.encode, var)
    if status then return result end
    Log("Error: --------------- json.encode() - encoding failed: %s", tostring(result))
end

function json.decode(text)
    local status, result = pcall(cjson.decode, text)
    if status then return result end
    Log("Error: --------------- json.decode() - encoding failed: %s", tostring(result))
end

if cjson then
    json.null = cjson.null
else
    json = nil
end

return json
