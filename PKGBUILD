pkgname=easinote-bin
pkgver=5.2.2.4.13984
pkgrel=1
pkgdesc="Seewo EasiNote5 希沃白板 5"
arch=('x86_64')
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux' 'libappindicator-gtk3' 'libsecret')
makedepends=('asar' 'nodejs' 'npm')
options=('!strip' '!debug' '!emptydirs')
source=("https://imlizhi-store-https.seewo.com/EasiNote_UOS_amd64_5.2.2.4.13984(20260429093518).deb")
sha256sums=('c0dea82dfaf3edf4fd91ceaa1c3ad76a463bd5d67817d5a41ca2f30054b00598')

package() {
  tar xf "$srcdir/data.tar.xz" -C "$pkgdir"
  APP_ROOT="$pkgdir/opt/apps/com.seewo.easinote5/files"
  if [ -d "$pkgdir/opt/apps/com.seewo.easinote5/entries/applications" ]; then
    mkdir -p "$pkgdir/usr/share/applications"
    cp "$pkgdir/opt/apps/com.seewo.easinote5/entries/applications/com.seewo.easinote5.desktop" "$pkgdir/usr/share/applications/"
  fi
  cat >"$APP_ROOT/com.seewo.easinote5.sh" <<EOF
#!/bin/bash
exec "/opt/apps/com.seewo.easinote5/files/EasiNote5" "\$@"
EOF
  chmod +x "$APP_ROOT/com.seewo.easinote5.sh"
  asar e "$APP_ROOT/resources/app.asar" "$srcdir/app_unpacked"
  if [ -f "$srcdir/app_unpacked/dist/utils/getBiosVendor.js" ]; then
    sed -i 's/dmidecode.*/resolve('\''seewo'\'');/g' "$srcdir/app_unpacked/dist/utils/getBiosVendor.js"
  fi
  ACTIVATION_FILE="$srcdir/app_unpacked/dist/services/activationService/activationService.js"
  if [ -f "$ACTIVATION_FILE" ]; then
    cat >"$ACTIVATION_FILE" <<'ENDOFACTIVATIONJS'
		"use strict";
var __assign = (this && this.__assign) || function () {
    __assign = Object.assign || function(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
                t[p] = s[p];
        }
        return t;
    };
    return __assign.apply(this, arguments);
};
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g = Object.create((typeof Iterator === "function" ? Iterator : Object).prototype);
    return g.next = verb(0), g["throw"] = verb(1), g["return"] = verb(2), typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (g && (g = 0, op[0] && (_ = 0)), _) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
var __read = (this && this.__read) || function (o, n) {
    var m = typeof Symbol === "function" && o[Symbol.iterator];
    if (!m) return o;
    var i = m.call(o), r, ar = [], e;
    try {
        while ((n === void 0 || n-- > 0) && !(r = i.next()).done) ar.push(r.value);
    }
    catch (error) { e = { error: error }; }
    finally {
        try {
            if (r && !r.done && (m = i["return"])) m.call(i);
        }
        finally { if (e) throw e.error; }
    }
    return ar;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.ActivationService = void 0;
/**
 * 接口文档：https://kb.cvte.com/pages/viewpage.action?pageId=84417110
 */
var machineId = require('node-machine-id').machineId;
var fs = require('fs-extra');
var md5 = require('js-md5');
var _a = require('../../utils/soap'), createClient = _a.createClient, request = _a.request;
var getBiosVendor = require('../../utils/getBiosVendor').getBiosVendor;
var crypto = require('crypto');
var AES = require('crypto-js/aes');
var encUTF8 = require('crypto-js/enc-utf8');
var log = require('electron-log');
var path = require('path');
var app = require('electron').app;
var isEmpty_1 = require("../../utils/isEmpty");
var once_init_1 = require("once-init");
var os = require("os");
var getMachineID_1 = require("../../utils/getMachineID");
var Sentry = require("@sentry/node");
var node_1 = require("@sentry/node");
var checkOnline_1 = require("../../utils/checkOnline");
var biosReader_1 = require("../../tools/biosReader");
var softwareAuthServiceUrl = 'http://register.seewo.com/EasiRegisterWcfService.svc?wsdl';
var key = 'sau01thw';
var paramsCode = '';
var hardwareKey = md5('seewo');
var isMac = os.platform() === 'darwin'; // mac 默认激活
/**
 * @description 激活服务（当前代码是被迁移到此目录下）
 *
 * 1、mac 默认激活
 *
 */
var ActivationService = /** @class */ (function () {
    function ActivationService() {
        var _this = this;
        this._debugRemainDays = undefined; // 调试用
        this.isActive = true; // mac 默认激活
        this.activeFileSysPathOld = path.join(app.getPath('userData'), '.com.seewo.easinote5/.register');
        this.activeFileUserPathOld = path.join(app.getAppPath(), '../.appData/.register');
        this.activeFileSysPath = path.join(app.getPath('userData'), '.com.seewo.easinote5/.register-v2');
        this.activeFileUserPath = path.join(app.getAppPath(), '../.appData/.register-v2');
        // 通过接口请求，根据激活码，确认是否依然激活
        // 需要兼容旧激活文件？如果没有新文件，但他是激活成功的？
        this.sendActiveRequestWithTimeout = function (code) { return __awaiter(_this, void 0, void 0, function () {
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0: return [4 /*yield*/, Promise.race([
                            this.sendActiveRequest(code),
                            (function () {
                                return new Promise(function (res) {
                                    setTimeout(function () { return res([0x70, 'timeout', '']); }, 20 * 1000);
                                });
                            })(),
                        ])];
                    case 1: return [2 /*return*/, _a.sent()];
                }
            });
        }); };
        this._getRemainDaysByRequest = function (code) { return __awaiter(_this, void 0, void 0, function () {
            var _a, responseFlag, responseString, _b, authType, serialCode, remainDays, resultRemainDays, oldMachineId, _c;
            var _d;
            return __generator(this, function (_e) {
                switch (_e.label) {
                    case 0:
                        log.info('ActivationService getRemainDays, code:', code);
                        return [4 /*yield*/, this.sendActiveRequest(code)];
                    case 1:
                        _a = __read.apply(void 0, [_e.sent(), 2]), responseFlag = _a[0], responseString = _a[1];
                        log.info('ActivationService getRemainDays, responseString:', responseString);
                        if (!(responseFlag === 0x80)) return [3 /*break*/, 2];
                        _b = __read(responseString.split('|'), 3), authType = _b[0], serialCode = _b[1], remainDays = _b[2];
                        resultRemainDays = (_d = this._debugRemainDays) !== null && _d !== void 0 ? _d : Number(remainDays);
                        this.writeActiveFile({
                            permanent: authType === '01', // 01 是永久授权，07 是试用授权
                            deviceIdHash: md5(this.deviceId),
                            code: code,
                            remainDays: resultRemainDays,
                        }, [this.activeFileSysPath, this.activeFileUserPath]);
                        log.info('ActivationService getRemainDays, remainDays:', remainDays);
                        log.info('ActivationService getRemainDays, this._debugRemainDays:', this._debugRemainDays);
                        return [2 /*return*/, resultRemainDays];
                    case 2:
                        if (!(responseFlag === 0x27 || responseFlag === 0x31)) return [3 /*break*/, 8];
                        return [4 /*yield*/, this.getOldMachineId()];
                    case 3:
                        oldMachineId = _e.sent();
                        if (!(oldMachineId !== this.deviceId)) return [3 /*break*/, 5];
                        this.deviceId = oldMachineId;
                        return [4 /*yield*/, this._getRemainDaysByRequest(code)];
                    case 4: return [2 /*return*/, _e.sent()];
                    case 5:
                        _c = this;
                        return [4 /*yield*/, this.getMachineId()];
                    case 6:
                        _c.deviceId = _e.sent();
                        _e.label = 7;
                    case 7:
                        this.writeActiveFile({
                            permanent: false,
                            deviceIdHash: md5(this.deviceId),
                            code: code,
                            remainDays: Number(0),
                        }, [this.activeFileSysPath, this.activeFileUserPath]);
                        return [2 /*return*/, 0]; // 已过期，剩余天数为 0
                    case 8:
                        log.error('请求剩余激活天数失败', [responseFlag, responseString]);
                        return [2 /*return*/, Infinity]; // 尽量不影响用户使用，失败的话，返回无穷大
                }
            });
        }); };
        this._getRemainDaysDebounce = (0, once_init_1.default)(function () { return __awaiter(_this, void 0, void 0, function () {
            var fileContent, code;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        if (!this.isActive)
                            return [2 /*return*/, 0]; // 未激活，剩余天数为 0
                        return [4 /*yield*/, this.readActiveFile()];
                    case 1:
                        fileContent = _a.sent();
                        if (fileContent === null || fileContent === void 0 ? void 0 : fileContent.permanent)
                            return [2 /*return*/, Infinity]; // 永久激活，剩余天数为无穷大
                        code = fileContent.code;
                        if (!code)
                            return [2 /*return*/, Infinity]; // 没有激活请求字符串，尽量不影响用户使用，返回无穷大
                        return [4 /*yield*/, this._getRemainDaysByRequest(code)];
                    case 2: // 没有激活请求字符串，尽量不影响用户使用，返回无穷大
                    return [2 /*return*/, _a.sent()];
                }
            });
        }); }).refresh;
        // this.init();
        this.exponentialBackoffRetry = new isEmpty_1.ExponentialBackoffRetry();
    }
    ActivationService.prototype.setDebugRemainDays = function (remainDays) {
        return __awaiter(this, void 0, void 0, function () {
            var fileContent;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        log.info('setDebugRemainDays', remainDays);
                        this._debugRemainDays = remainDays;
                        return [4 /*yield*/, this.readActiveFile()];
                    case 1:
                        fileContent = _a.sent();
                        if (fileContent.permanent)
                            return [2 /*return*/]; // 永久激活，不修改
                        this.writeActiveFile(__assign(__assign({}, fileContent), { remainDays: this._debugRemainDays }), [this.activeFileSysPath, this.activeFileUserPath]);
                        return [2 /*return*/];
                }
            });
        });
    };
    ActivationService.prototype.getIsActive = function () {
        return __awaiter(this, void 0, void 0, function () {
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        if (!!this.deviceId) return [3 /*break*/, 2];
                        return [4 /*yield*/, this.init()];
                    case 1:
                        _a.sent();
                        _a.label = 2;
                    case 2: return [2 /*return*/, true];
                }
            });
        });
    };
    ActivationService.prototype.sendActiveRequest = function (code) {
        return __awaiter(this, void 0, void 0, function () {
            var client, checkCode, authRequestString, RegisterResult, responseArr;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        if (!!this.deviceId) return [3 /*break*/, 2];
                        return [4 /*yield*/, this.getMachineId()];
                    case 1:
                        _a.sent();
                        _a.label = 2;
                    case 2: return [4 /*yield*/, createClient(softwareAuthServiceUrl)];
                    case 3:
                        client = _a.sent();
                        return [4 /*yield*/, request(client, 'GenerateCheckCode', {})];
                    case 4:
                        checkCode = (_a.sent()).GenerateCheckCodeResult;
                        authRequestString = this.encryptParams([checkCode, code, this.deviceId, paramsCode]);
                        return [4 /*yield*/, request(client, 'Register', {
                                authRequestString: authRequestString,
                            })];
                    case 5:
                        RegisterResult = (_a.sent()).RegisterResult;
                        responseArr = this.decryptParams(RegisterResult);
                        return [2 /*return*/, responseArr.concat(checkCode)];
                }
            });
        });
    };
    ActivationService.prototype.activeByCode = function (code) {
        return __awaiter(this, void 0, void 0, function () {
            var _a, responseFlag, responseString, checkCode, _b, authType, serialCode, remainDays, permanent, oldMachineId, _c, err_1;
            return __generator(this, function (_d) {
                switch (_d.label) {
                    case 0:
                        _d.trys.push([0, 9, , 10]);
                        return [4 /*yield*/, this.sendActiveRequest(code)];
                    case 1:
                        _a = __read.apply(void 0, [_d.sent(), 3]), responseFlag = _a[0], responseString = _a[1], checkCode = _a[2];
                        _b = __read(responseString.split('|'), 3), authType = _b[0], serialCode = _b[1], remainDays = _b[2];
                        if (!(responseFlag === 0x80)) return [3 /*break*/, 2];
                        this.isActive = true;
                        permanent = authType === '01';
                        this.writeActiveFile({
                            permanent: permanent,
                            deviceIdHash: md5(this.deviceId),
                            code: code,
                            remainDays: permanent ? Infinity : Number(remainDays),
                        }, [this.activeFileSysPath, this.activeFileUserPath]);
                        // 如果是永久激活，再写一份到旧文件，兼容旧版本
                        if (permanent) {
                            this.writeActiveFile("".concat(md5(checkCode)).concat(md5(this.deviceId)).concat(md5(code)), [this.activeFileSysPathOld, this.activeFileUserPathOld], true);
                        }
                        return [2 /*return*/];
                    case 2:
                        if (!(responseFlag === 0x27 || responseFlag === 0x31)) return [3 /*break*/, 7];
                        return [4 /*yield*/, this.getOldMachineId()];
                    case 3:
                        oldMachineId = _d.sent();
                        if (!(oldMachineId !== this.deviceId)) return [3 /*break*/, 5];
                        this.deviceId = oldMachineId;
                        return [4 /*yield*/, this.activeByCode(code)];
                    case 4: return [2 /*return*/, _d.sent()];
                    case 5:
                        _c = this;
                        return [4 /*yield*/, this.getMachineId()];
                    case 6:
                        _c.deviceId = _d.sent();
                        _d.label = 7;
                    case 7:
                        log.error('激活失败', [responseFlag, responseString]);
                        _d.label = 8;
                    case 8: return [2 /*return*/, [responseFlag, responseString]];
                    case 9:
                        err_1 = _d.sent();
                        console.error(err_1);
                        log.error(err_1);
                        return [2 /*return*/, []];
                    case 10: return [2 /*return*/];
                }
            });
        });
    };
    ActivationService.prototype.getRemainDays = function () {
        return __awaiter(this, void 0, void 0, function () {
            var err_2;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        _a.trys.push([0, 4, , 5]);
                        if (!isMac) return [3 /*break*/, 1];
                        return [2 /*return*/, Infinity]; // mac 默认激活，剩余天数为无穷大
                    case 1: return [4 /*yield*/, this._getRemainDaysDebounce()];
                    case 2: return [2 /*return*/, _a.sent()];
                    case 3: return [3 /*break*/, 5];
                    case 4:
                        err_2 = _a.sent();
                        log.error('查询剩余激活天数失败', err_2);
                        return [2 /*return*/, Infinity]; // 尽量不影响用户使用，失败的话，返回无穷大
                    case 5: return [2 /*return*/];
                }
            });
        });
    };
    ActivationService.prototype.checkActiveWithServer = function () {
        return __awaiter(this, void 0, void 0, function () {
            var err_3;
            var _this = this;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        _a.trys.push([0, 2, , 3]);
                        return [4 /*yield*/, this.exponentialBackoffRetry.execute(function () { return __awaiter(_this, void 0, void 0, function () {
                                return __generator(this, function (_a) {
                                    switch (_a.label) {
                                        case 0:
                                            if (!(0, checkOnline_1.checkOnline)()) {
                                                this.exponentialBackoffRetry.reset(); // 如果网络断开，重置重试次数
                                            }
                                            return [4 /*yield*/, this._checkActiveWithServer()];
                                        case 1: return [2 /*return*/, true];
                                    }
                                });
                            }); }, function (result) {
                                if (Array.isArray(result) && [0x70, 0x21].includes(result[0])) {
                                    // 未知异常，重试
                                    log.info("[ExponentialBackoffRetry] checkActiveWithServer retrying due to unknown error ".concat(result[0]), result);
                                    return true;
                                }
                                return false;
                            }, function () {
                                // 已达重试上限，返回 false
                                Sentry.addBreadcrumb({
                                    category: 'checkActiveWithServer_retry_max',
                                    message: 'checkActiveWithServer_retry_max',
                                    data: {
                                        deviceId: _this.deviceId,
                                    },
                                    level: node_1.Severity.Error,
                                });
                                Sentry.captureException(new Error('checkActiveWithServer_retry_max'));
                                return false;
                            })];
                    case 1: return [2 /*return*/, _a.sent()];
                    case 2:
                        err_3 = _a.sent();
                        log.error(err_3); // 重试失败，返回 false
                        return [2 /*return*/, false];
                    case 3: return [2 /*return*/];
                }
            });
        });
    };
    ActivationService.prototype._checkActiveWithServer = function () {
        return __awaiter(this, void 0, void 0, function () {
            var seewoDevice, fileContent, code, response, _a, responseFlag, oldMachineId, _b;
            return __generator(this, function (_c) {
                switch (_c.label) {
                    case 0:
                        if (isMac)
                            return [2 /*return*/, true]; // mac 默认激活
                        return [4 /*yield*/, this.isSeewoDevice()];
                    case 1:
                        seewoDevice = _c.sent();
                        if (seewoDevice)
                            return [2 /*return*/, true]; // 希沃设备，默认激活
                        return [4 /*yield*/, this.readActiveFile()];
                    case 2:
                        fileContent = _c.sent();
                        if (!fileContent || (0, isEmpty_1.isEmpty)(fileContent)) {
                            log.error('没有激活文件，未激活');
                            return [2 /*return*/, false]; // 没有激活文件，未激活
                        }
                        code = fileContent.code;
                        if (!code) {
                            log.info('旧版本激活文件，认为激活成功');
                            return [2 /*return*/, true]; // 旧版本激活文件，无法获取code（经过md5加密），认为激活成功
                        }
                        return [4 /*yield*/, this.sendActiveRequestWithTimeout(code)];
                    case 3:
                        response = _c.sent();
                        _a = __read(response, 1), responseFlag = _a[0];
                        if (responseFlag === 0x80) {
                            // 激活码有效
                            return [2 /*return*/, true];
                        }
                        if (responseFlag === 0x70 || responseFlag === 0x21) {
                            // 未知异常，返回原始响应，让重试机制处理
                            return [2 /*return*/, response];
                        }
                        if (!(responseFlag === 0x27 || responseFlag === 0x31)) return [3 /*break*/, 8];
                        return [4 /*yield*/, this.getOldMachineId()];
                    case 4:
                        oldMachineId = _c.sent();
                        if (!(oldMachineId !== this.deviceId)) return [3 /*break*/, 6];
                        // 避免死循环
                        this.deviceId = oldMachineId;
                        return [4 /*yield*/, this._checkActiveWithServer()];
                    case 5: return [2 /*return*/, true];
                    case 6:
                        _b = this;
                        return [4 /*yield*/, this.getMachineId()];
                    case 7:
                        _b.deviceId = _c.sent();
                        // 如果oldMachineId和当前deviceId相同，说明已经是旧ID了，直接返回false
                        log.error('激活码有问题取消激活', responseFlag, code);
                        return [2 /*return*/, false];
                    case 8:
                        if ([0x25, 0x26].includes(responseFlag)) {
                            // 其他注册码相关错误码，未激活（0x27已经在上面处理了）
                            log.error('激活码有问题取消激活', responseFlag, code);
                            return [2 /*return*/, false];
                        }
                        // 默认情况：未知的responseFlag，认为未激活
                        log.error('未知的响应标志', responseFlag);
                        Sentry.captureEvent({
                            level: node_1.Severity.Warning,
                            message: '未知的响应标志',
                            extra: {
                                responseFlag: responseFlag,
                                code: code,
                                deviceId: this.deviceId,
                            },
                        });
                        return [2 /*return*/, false];
                }
            });
        });
    };
    ActivationService.prototype.isSeewoDevice = function () {
        return __awaiter(this, void 0, void 0, function () {
            var biosVendor;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0: return [4 /*yield*/, getBiosVendor()];
                    case 1:
                        biosVendor = _a.sent();
                        console.log('is seewo device biosvendor is ', biosVendor);
                        return [2 /*return*/, true];
                }
            });
        });
    };
    ActivationService.prototype.activateSeewoDevice = function (deviceIdHash) {
        return __awaiter(this, void 0, void 0, function () {
            var seewoDevice;
            return __generator(this, function (_a) {
                switch (_a.label) {
		    case 0:
                        this.isActive = true;
                        this.writeActiveFile({
                            permanent: true,
                            deviceIdHash: deviceIdHash,
                        }, [this.activeFileSysPath, this.activeFileUserPath]);
                        return [2 /*return*/];
                    case 1:
                        seewoDevice = _a.sent();
                        // 希沃设备，自动永久激活
                        if (seewoDevice) {
                            this.isActive = true;
                            this.writeActiveFile({
                                permanent: true,
                                deviceIdHash: deviceIdHash,
                            }, [this.activeFileSysPath, this.activeFileUserPath]);
                        }
                        else {
                            this.isActive = true;
                        }
                        return [2 /*return*/];
                }
            });
        });
    };
    ActivationService.prototype.init = function () {
        return __awaiter(this, void 0, void 0, function () {
            var _a, deviceId, fileContent, oldDeviceId, deviceIdHash, oldDeviceIdHash, fileDeviceId, fileRemainDays, filePermanent;
            return __generator(this, function (_b) {
                switch (_b.label) {
                    case 0: return [4 /*yield*/, Promise.all([
                            this.getMachineId(),
                            this.readActiveFile(),
                            this.getOldMachineId(),
                        ])];
                    case 1:
                        _a = __read.apply(void 0, [_b.sent(), 3]), deviceId = _a[0], fileContent = _a[1], oldDeviceId = _a[2];
                        deviceIdHash = md5(deviceId);
                        oldDeviceIdHash = md5(oldDeviceId);
                        if (!(!fileContent || (0, isEmpty_1.isEmpty)(fileContent))) return [3 /*break*/, 3];
                        // 如果没有激活文件，判断是否是希沃设备，是的话自动永久激活
                        return [4 /*yield*/, this.activateSeewoDevice(deviceId)];
                    case 2:
                        // 如果没有激活文件，判断是否是希沃设备，是的话自动永久激活
                        _b.sent();
                        return [2 /*return*/];
                    case 3:
                        fileDeviceId = fileContent.deviceIdHash;
                        fileRemainDays = fileContent.remainDays;
                        filePermanent = fileContent.permanent;
                        log.info("\n      filePermanent: ".concat(filePermanent, "\n      fileRemainDays: ").concat(fileRemainDays, "\n      "));
                        this.isActive = true;
                        if (!!this.isActive) return [3 /*break*/, 5];
                        return [4 /*yield*/, this.activateSeewoDevice(deviceId)];
                    case 4:
                        _b.sent();
                        _b.label = 5;
                    case 5: return [2 /*return*/];
                }
            });
        });
    };
    // 存在过期时间，且已过期
    ActivationService.prototype.hasExpired = function (remainDays) {
        if (remainDays === void 0) { remainDays = Infinity; }
        return Number(remainDays) <= 0;
    };
    ActivationService.prototype.getMachineId = function () {
        return __awaiter(this, void 0, void 0, function () {
            var id;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0: return [4 /*yield*/, (0, getMachineID_1.generateMachineID)()];
                    case 1:
                        id = _a.sent();
                        this.deviceId = id;
                        return [2 /*return*/, id];
                }
            });
        });
    };
    // 旧版本获取机器码的方法，用于兼容处理
    ActivationService.prototype.getOldMachineId = function () {
        return __awaiter(this, void 0, void 0, function () {
            var id;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0: return [4 /*yield*/, machineId()];
                    case 1:
                        id = _a.sent();
                        return [2 /*return*/, id];
                }
            });
        });
    };
    ActivationService.prototype.pathExists = function (filePath) {
        return __awaiter(this, void 0, void 0, function () {
            var exists, e_1;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        exists = false;
                        _a.label = 1;
                    case 1:
                        _a.trys.push([1, 3, , 4]);
                        return [4 /*yield*/, fs.pathExists(filePath)];
                    case 2:
                        exists = _a.sent();
                        return [3 /*break*/, 4];
                    case 3:
                        e_1 = _a.sent();
                        log.error(e_1);
                        return [3 /*break*/, 4];
                    case 4: return [2 /*return*/, exists];
                }
            });
        });
    };
    ActivationService.prototype.isMD5 = function (str) {
        if (!str)
            return false;
        var md5Regex = /^[a-f0-9]{32}$/i;
        var subStrs = str.match(/.{1,32}/g) || []; // 将字符串拆分为长度为32的子字符串
        return subStrs.every(function (subStr) { return md5Regex.test(subStr); });
    };
    ActivationService.prototype.readActiveFileInner = function (path) {
        return __awaiter(this, void 0, void 0, function () {
            var fileContent, rawStr, decryptByte, decryptStr, content, e_2;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        fileContent = Object.create(null);
                        _a.label = 1;
                    case 1:
                        _a.trys.push([1, 3, , 4]);
                        return [4 /*yield*/, fs.readFile(path, { encoding: 'utf8' })];
                    case 2:
                        rawStr = _a.sent();
                        decryptByte = AES.decrypt(rawStr, key);
                        decryptStr = decryptByte.toString(encUTF8);
                        content = JSON.parse(decryptStr);
                        fileContent = content;
                        return [3 /*break*/, 4];
                    case 3:
                        e_2 = _a.sent();
                        log.error('read active file fail:', e_2);
                        return [3 /*break*/, 4];
                    case 4: return [2 /*return*/, fileContent];
                }
            });
        });
    };
    ActivationService.prototype.readBIOSActiveFileInner = function () {
        return __awaiter(this, void 0, void 0, function () {
            var fileContent, rawStr, decryptByte, decryptStr, content, e_3;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        fileContent = Object.create(null);
                        _a.label = 1;
                    case 1:
                        _a.trys.push([1, 3, , 4]);
                        return [4 /*yield*/, (0, biosReader_1.readBiosVar)()];
                    case 2:
                        rawStr = _a.sent();
                        decryptByte = AES.decrypt(rawStr, key);
                        decryptStr = decryptByte.toString(encUTF8);
                        content = JSON.parse(decryptStr);
                        fileContent = content;
                        return [3 /*break*/, 4];
                    case 3:
                        e_3 = _a.sent();
                        log.error('read BIOS active file fail:', e_3);
                        return [3 /*break*/, 4];
                    case 4: return [2 /*return*/, fileContent];
                }
            });
        });
    };
    /**
     * 维护一下旧版本的激活文件
     * @returns
     */
    ActivationService.prototype.maintainOldActiveFile = function () {
        return __awaiter(this, void 0, void 0, function () {
            var _a, isOldSysPathExists, isOldUserPathExists, fileContent;
            return __generator(this, function (_b) {
                switch (_b.label) {
                    case 0: return [4 /*yield*/, Promise.all([
                            this.pathExists(this.activeFileSysPathOld),
                            this.pathExists(this.activeFileUserPathOld),
                        ])];
                    case 1:
                        _a = __read.apply(void 0, [_b.sent(), 2]), isOldSysPathExists = _a[0], isOldUserPathExists = _a[1];
                        fileContent = '';
                        if (!isOldSysPathExists) return [3 /*break*/, 3];
                        return [4 /*yield*/, fs.readFile(this.activeFileSysPathOld, { encoding: 'utf8' })];
                    case 2:
                        // 系统激活文件存在，安装目录激活文件不存在的场景，可能是用户重装软件，这里重写回安装目录
                        fileContent = _b.sent();
                        if (!isOldUserPathExists) {
                            this.writeActiveFile(fileContent, [this.activeFileUserPathOld], true);
                        }
                        return [3 /*break*/, 5];
                    case 3:
                        if (!isOldUserPathExists) return [3 /*break*/, 5];
                        return [4 /*yield*/, fs.readFile(this.activeFileUserPathOld, { encoding: 'utf8' })];
                    case 4:
                        // 安装目录激活文件存在，系统激活文件不存在的场景，可能是不同用户登录，这里重写回系统目录
                        fileContent = _b.sent();
                        this.writeActiveFile(fileContent, [this.activeFileSysPathOld], true);
                        _b.label = 5;
                    case 5: return [2 /*return*/, fileContent];
                }
            });
        });
    };
    ActivationService.prototype.readActiveFile = function () {
        return __awaiter(this, void 0, void 0, function () {
            var _a, isSysPathExists, isUserPathExists, oldFileContent, fileContent, hashLen, biosFileContent;
            return __generator(this, function (_b) {
                switch (_b.label) {
                    case 0: return [4 /*yield*/, Promise.all([
                            this.pathExists(this.activeFileSysPath),
                            this.pathExists(this.activeFileUserPath),
                        ])];
                    case 1:
                        _a = __read.apply(void 0, [_b.sent(), 2]), isSysPathExists = _a[0], isUserPathExists = _a[1];
                        return [4 /*yield*/, this.maintainOldActiveFile()];
                    case 2:
                        oldFileContent = _b.sent();
                        fileContent = {};
                        if (!isSysPathExists) return [3 /*break*/, 4];
                        return [4 /*yield*/, this.readActiveFileInner(this.activeFileSysPath)];
                    case 3:
                        fileContent = _b.sent();
                        // 系统激活文件存在，安装目录激活文件不存在的场景，可能是用户重装软件，这里重写回安装目录
                        if (!isUserPathExists) {
                            this.writeActiveFile(fileContent, [this.activeFileUserPath]);
                        }
                        return [3 /*break*/, 9];
                    case 4:
                        if (!isUserPathExists) return [3 /*break*/, 6];
                        return [4 /*yield*/, this.readActiveFileInner(this.activeFileUserPath)];
                    case 5:
                        // 安装目录激活文件存在，系统激活文件不存在的场景，可能是不同用户登录，这里重写回系统目录
                        fileContent = _b.sent();
                        this.writeActiveFile(fileContent, [this.activeFileSysPath]);
                        return [3 /*break*/, 9];
                    case 6:
                        if (!(oldFileContent && this.isMD5(oldFileContent))) return [3 /*break*/, 7];
                        hashLen = 32;
                        fileContent = {
                            permanent: true,
                            deviceIdHash: oldFileContent.slice(hashLen, hashLen * 2),
                        };
                        return [3 /*break*/, 9];
                    case 7: return [4 /*yield*/, this.readBIOSActiveFileInner()];
                    case 8:
                        biosFileContent = _b.sent();
                        if (biosFileContent && !(0, isEmpty_1.isEmpty)(biosFileContent)) {
                            fileContent = biosFileContent;
                            this.writeActiveFile(fileContent, [this.activeFileSysPath, this.activeFileUserPath]);
                        }
                        _b.label = 9;
                    case 9: return [2 /*return*/, fileContent];
                }
            });
        });
    };
    ActivationService.prototype.writeActiveFile = function (fileContent_1, paths_1) {
        return __awaiter(this, arguments, void 0, function (fileContent, paths, raw) {
            var filePath, err_4;
            if (raw === void 0) { raw = false; }
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0: return [4 /*yield*/, Promise.all(paths.map(function (filePath) {
                            var cipherText = raw ? fileContent : AES.encrypt(JSON.stringify(fileContent), key).toString(); // 加密，不然用户可以随便改
                            fs.outputFile(filePath, cipherText)
                                .then(function () {
                                console.log("\u6587\u4EF6 ".concat(filePath, " \u5199\u5165\u6210\u529F"));
                            })
                                .catch(function (err) {
                                console.log("\u6587\u4EF6 ".concat(filePath, " \u5199\u5165\u5931\u8D25\n              err:").concat(err, "\n            "));
                            });
                        }))];
                    case 1:
                        _a.sent();
                        filePath = paths.find(function (path) { return fs.existsSync(path); });
                        if (!filePath) return [3 /*break*/, 5];
                        _a.label = 2;
                    case 2:
                        _a.trys.push([2, 4, , 5]);
                        return [4 /*yield*/, (0, biosReader_1.writeBiosVar)(filePath)];
                    case 3:
                        _a.sent();
                        return [3 /*break*/, 5];
                    case 4:
                        err_4 = _a.sent();
                        console.log("BIOS\u53D8\u91CF\u5199\u5165\u5931\u8D25: ".concat(err_4));
                        return [3 /*break*/, 5];
                    case 5: return [2 /*return*/];
                }
            });
        });
    };
    ActivationService.prototype.addZero = function (buffers) {
        var paddingLength = buffers.length % 8;
        if (paddingLength) {
            return Buffer.concat([buffers, Buffer.alloc(8 - paddingLength)]);
        }
        return buffers;
    };
    ActivationService.prototype.encryptParams = function (params) {
        console.log('encryptParams begin:', params);
        var buffers = [];
        for (var i = 0; i < params.length; i++) {
            var utf8Param = Buffer.from(params[i], 'utf8');
            // 将参数的长度信息封装成 4 字节大小的 Buffer
            var lenBuffer = Buffer.alloc(4);
            lenBuffer.writeUInt32LE(utf8Param.length, 0);
            // 将参数数据和长度信息合并成新的 Buffer 追加到总 Buffer 序列（buffers）的尾部
            buffers.push(lenBuffer, utf8Param);
        }
        // 将所有参数的 Buffer 序列合并成一个总 Buffer
        var buffer = this.addZero(Buffer.concat(buffers));
        // 使用 DES/ECB/NoPadding 算法进行加密
        var cipher = crypto.createCipheriv('des-ecb', key, null);
        cipher.setAutoPadding(false);
        var encrypted = cipher.update(buffer);
        var finalBuffer = Buffer.concat([encrypted, cipher.final()]);
        // 对加密结果进行 base64 编码，并在前面添加版本号 02
        var base64Encoded = '02' + finalBuffer.toString('base64');
        console.log('encryptParams end:', base64Encoded);
        return base64Encoded;
    };
    ActivationService.prototype.decryptParams = function (encrypted) {
        console.log('decryptParams begin:', encrypted);
        var encryptedData = Buffer.from(encrypted, 'base64');
        // 使用 DES/ECB/NoPadding 算法进行解密
        var decipher = crypto.createDecipheriv('des-ecb', key, null);
        decipher.setAutoPadding(false);
        var decryptedData = decipher.update(encryptedData);
        // const finalData = decryptedData;
        var finalData = Buffer.concat([decryptedData, decipher.final()]);
        // 解析每个参数的长度和数据
        var params = [];
        params.push(finalData.readUInt32LE(0));
        var offset = 4;
        while (offset + 4 < finalData.length) {
            // 取出参数的长度信息
            var len = finalData.readUInt32LE(offset);
            offset += 4;
            // 根据长度信息取出参数的数据
            var param = Buffer.from(finalData.slice(offset, offset + len)).toString('utf8');
            offset += len;
            // 将解码后的参数保存到数组中
            params.push(param);
        }
        console.log('decryptParams end:', params);
        return params;
    };
    return ActivationService;
}());
exports.ActivationService = ActivationService;
ENDOFACTIVATIONJS
  fi
  asar p "$srcdir/app_unpacked" "$APP_ROOT/resources/app.asar"
  rm -rf "$srcdir/app_unpacked"
  chmod +x "$APP_ROOT/EasiNote5"
  if [ -f "$APP_ROOT/chrome-sandbox" ]; then
    chmod +x "$APP_ROOT/chrome-sandbox"
  fi
}
