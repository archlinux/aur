# Maintainer: taotieren <admin@taotieren.com>

pkgbase=onenet-debugger-tool-wine
pkgname=($pkgbase onenet-edpproto-debugger-wine onenet-mqtt-device-debugger-wine onenet-lua-script-debugger-wine)
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
url='https://open.iot.10086.cn/doc/art433.html#118'
license=('Custom')
provides=()
#conflicts=()
depends=('bash' 'wine' 'wqy-zenhei')
makedepends=('libarchive' 'unarchiver')
optdepends=("wine-mono-gecko-version-fix: Fix the version numbers of wine-mono and wine-gecko files to solve the dialog box that pops up when starting wine.")

source=("onenet-edpproto-debugger-wine-${pkgver}.rar::https://upfiles.heclouds.com/123/ueditor/2016/09/26/99dd0b18908b05a2f74588d5c9217957.rar"
        "onenet-mqtt-device-debugger-wine-${pkgver}.rar::https://upfiles.heclouds.com/123/tools/simulate-device.rar"
        "onenet-lua-script-debugger-wine-${pkgver}.zip::https://upfiles.heclouds.com/123/ueditor/2017/04/05/d7ed57e61270a67f640338cb6a00a4b4.zip"
        "onenet-edpproto-debugger-wine.install"
        "onenet-mqtt-device-debugger-wine.install"
        "onenet-lua-script-debugger-wine.install"
        )

sha256sums=('2337d7a979b47b027cf1082910d17a9ffd2b05ac14ede8407aeab77c94bdf797'
            'e6b181fb7194cabbebbd2537496fdaa95d440b9b96660774d5bc33091502f0a0'
            '0d9d39ab285e7679b61ebe4020726ea9f058a63385d10098f1342b9942c0035a'
            'd64b11e05aa8e4511e418bec1f320f498edf167753a02d5be697be4c8bf4982d'
            '065acc7e612cf863890945c8c6f1e27770024217979436d1174bbf8c0ca85d01'
            'be6e6b4c5f331e770511c5d147b03aa79e3602255cf0f3bb23a58a317846e530')

noextract=(onenet-edpproto-debugger-wine-${pkgver}.rar onenet-mqtt-device-debugger-wine-${pkgver}.rar onenet-lua-script-debugger-wine-${pkgver}.zip)

prepare() {
    _ftname="wqy-zenhei.ttc"
    install -Dm0644 /dev/stdin "${srcdir}/regpatch.reg" << EOF
REGEDIT4

[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink]
"Lucida Sans Unicode"="${_ftname}"
"Microsoft Sans Serif"="${_ftname}"
"MS Sans Serif"="${_ftname}"
"Tahoma"="${_ftname}"
"Tahoma Bold"="${_ftname}"
"SimSun"="${_ftname}"
"Arial"="${_ftname}"
"Arial Black"="${_ftname}"
"Lucida Sans Unicode"=str(7):"${_ftname}"
"Microsoft Sans Serif"=str(7):"${_ftname}"
"Tahoma"=str(7):"${_ftname}"
"Lucida Sans Unicode"="${_ftname}"
"Microsoft Sans Serif"="${_ftname}"
"Microsoft YaHei"="${_ftname}"
"微软雅黑"="${_ftname}"
"宋体"="${_ftname}"
"新細明體"="${_ftname}"
"DFKai-SB"="${_ftname}"
"FangSong"="${_ftname}"
"KaiTi"="${_ftname}"
"Microsoft JhengHei"="${_ftname}"
"Microsoft YaHei"="${_ftname}"
"MingLiU"="${_ftname}"
"NSimSun"="${_ftname}"
"PMingLiU"="${_ftname}"
"SimHei"="${_ftname}"
"SimKai"="${_ftname}"
"SimSun"="${_ftname}"

[HKEY_CURRENT_USER\Software\Wine\X11 Driver]
"ClientSideAntiAliasWithCore"="N"
"ClientSideAntiAliasWithRender"="N"
"ClientSideWithRender"="N"

[HKEY_CURRENT_USER\Control Panel\Desktop]
"FontSmoothing"="2"
"FontSmoothingType"=dword:00000002
"FontSmoothingGamma"=dword:00000578
"FontSmoothingOrientation"=dword:00000001

[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion]
"RegisteredOrganization"="OneNET"
"RegisteredOwner"="OneNET"
EOF

}

package_onenet-debugger-tool-wine() {
    pkgdesc="Wine OneNET EdpProto MQTT Lua 调试工具，设备模拟器，运行环境Win7+"
    depends=(onenet-edpproto-debugger-wine onenet-mqtt-device-debugger-wine onenet-lua-script-debugger-wine)
}

package_onenet-edpproto-debugger-wine() {
    pkgdesc="Wine OneNET EdpProto 调试工具，设备模拟器，运行环境Win7+"
    install=${pkgname}.install
    install -dm0755 "${pkgdir}/opt/onenet/${pkgname%-wine}"

    unar  "${srcdir}/${pkgname}-${pkgver}.rar" -o "${pkgdir}/opt/onenet/${pkgname%-wine}"
    cp -r "${srcdir}/regpatch.reg" "${pkgdir}/opt/onenet/${pkgname%-wine}"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-wine}" << EOF
#!/bin/bash
export WINEARCH=win32 WINEPREFIX="$HOME/.onenet/${pkgname%-wine}/wine"

if [ ! -d "$HOME"/.onenet/${pkgname%-wine} ] ; then
    mkdir -p "$HOME"/.onenet/${pkgname%-wine}/wine || exit 1

    cp -r /opt/onenet/${pkgname%-wine}/regpatch.reg "$HOME"/.onenet/${pkgname%-wine}/wine || exit 1
    cp -r /opt/onenet/${pkgname%-wine}/EdpProtoDebugger-v2.0.exe "$HOME"/.onenet/${pkgname%-wine}/ || exit 1

    regedit "$HOME"/.onenet/${pkgname%-wine}/wine/regpatch.reg

    wineserver -k
fi

wine "$HOME"/.onenet/${pkgname%-wine}/EdpProtoDebugger-v2.0.exe "\$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-wine}.desktop" << EOF
[Desktop Entry]
Name=${pkgname%-wine}
Name[zh_CN]=${pkgname%-wine}
Comment=${pkgdesc}
Exec=${pkgname%-wine} %f
Type=Application
Categories=Development;Tool;
Terminal=false
Icon=${pkgname%-wine}.png
Version=${pkgver}
EOF
}

package_onenet-mqtt-device-debugger-wine() {
    pkgdesc="Wine OneNET MQTT 调试工具，设备模拟器，运行环境Win7+"
    install=${pkgname}.install
    install -dm0755 "${pkgdir}/opt/onenet/${pkgname%-wine}"

    unar "${srcdir}/${pkgname}-${pkgver}.rar" -o "${pkgdir}/opt/onenet/${pkgname%-wine}"
    cp -r "${srcdir}/regpatch.reg" "${pkgdir}/opt/onenet/${pkgname%-wine}"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-wine}" << EOF
#!/bin/bash
export WINEARCH=win32 WINEPREFIX="$HOME/.onenet/${pkgname%-wine}/wine"

if [ ! -d "$HOME"/.onenet/${pkgname%-wine} ] ; then
    mkdir -p "$HOME"/.onenet/${pkgname%-wine}/wine || exit 1

    cp -r /opt/onenet/${pkgname%-wine}/regpatch.reg "$HOME"/.onenet/${pkgname%-wine}/wine || exit 1
    cp -r /opt/onenet/${pkgname%-wine}/simulate-device.exe "$HOME"/.onenet/${pkgname%-wine}/ || exit 1

    regedit "$HOME"/.onenet/${pkgname%-wine}/wine/regpatch.reg

    wineserver -k
fi

wine "$HOME"/.onenet/${pkgname%-wine}/simulate-device.exe "\$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-wine}.desktop" << EOF
[Desktop Entry]
Name=${pkgname%-wine}
Name[zh_CN]=${pkgname%-wine}
Comment=${pkgdesc}
Exec=${pkgname%-wine} %f
Type=Application
Categories=Development;Tool;
Terminal=false
Icon=${pkgname%-wine}.png
Version=${pkgver}
EOF
}


package_onenet-lua-script-debugger-wine() {
    pkgdesc="Wine OneNET Lua 调试工具，设备模拟器，运行环境Win7+"
    install=${pkgname}.install
    install -dm0755 "${pkgdir}/opt/onenet/${pkgname%-wine}"

    unar  "${srcdir}/${pkgname}-${pkgver}.zip"
    cp -r "${srcdir}"/${pkgname}-${pkgver}/. "${pkgdir}/opt/onenet/${pkgname%-wine}"
    cp -r "${srcdir}/regpatch.reg" "${pkgdir}/opt/onenet/${pkgname%-wine}"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-wine}" << EOF
#!/bin/bash
export WINEARCH=win32 WINEPREFIX="$HOME/.onenet/${pkgname%-wine}/wine"

if [ ! -d "$HOME"/.onenet/${pkgname%-wine} ] ; then
    mkdir -p "$HOME"/.onenet/${pkgname%-wine}/wine || exit 1

    cp -r /opt/onenet/${pkgname%-wine}/regpatch.reg "$HOME"/.onenet/${pkgname%-wine}/wine || exit 1
    cp -r /opt/onenet/${pkgname%-wine}/ScriptDebugger.exe "$HOME"/.onenet/${pkgname%-wine}/ || exit 1
    cp -r /opt/onenet/${pkgname%-wine}/modbus_03.exe "$HOME"/.onenet/${pkgname%-wine} || exit 1
    cp -r /opt/onenet/${pkgname%-wine}/*.lua "$HOME"/.onenet/${pkgname%-wine} || exit 1
    cp -r /opt/onenet/${pkgname%-wine}/*.dll "$HOME"/.onenet/${pkgname%-wine} || exit 1

    regedit "$HOME"/.onenet/${pkgname%-wine}/wine/regpatch.reg

    wineserver -k
fi

wine "$HOME"/.onenet/${pkgname%-wine}/ScriptDebugger.exe "\$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-wine}.desktop" << EOF
[Desktop Entry]
Name=${pkgname%-wine}
Name[zh_CN]=${pkgname%-wine}
Comment=${pkgdesc}
Exec=${pkgname%-wine} %f
Type=Application
Categories=Development;Tool;
Terminal=false
Icon=${pkgname%-wine}.png
Version=${pkgver}
EOF
}

