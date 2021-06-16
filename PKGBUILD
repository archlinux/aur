# Maintainer: taotieren <admin@taotieren.com>

pkgname=luatools-wine
pkgver=2_1_17
pkgrel=1
pkgdesc="Wine LuatTools 是合宙的 Lua 调试工具"
arch=('any')
url="https://doc.openluat.com/wiki/3?wiki_page_id=694"
license=('unknow')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-wine})
replaces=("jlcpcassit-bin")
depends=('wine' 'winetricks' 'wqy-zenhei')
#makedepends=('innoextract')
optdepends=("wine-mono-gecko-version-fix: Fix the version numbers of wine-mono and wine-gecko files to solve the dialog box that pops up when starting wine.")
backup=()
options=('!strip')
install=${pkgname}.install
source=("${pkgname%-wine}.exe::http://cdndownload.openluat.com/Luat_tool_src/v2tools/exe/exe_${pkgver}.exe"
#         "http://www.openluat.com/Product/file/uis8910dm/sw_file_20200303181718_8910_module_usb_driver_signed%20_20200303_hezhou.7z"
        "http://www.openluat.com/Product/file/asr1802/AirM2M_USB_Download&Com_Driver_for_4G_V1.0.0.4.7z"
        "${pkgname%-wine}.svg::https://www.openluat.com/static/logo.0ced3f97.svg"
        "${pkgname}.install")
sha256sums=('4653eb360899714cdcf9d466a38a5378bac1b21e0e99e37cb88b189fd768421b'
            'd68a23e640ae125b8a70821f3ff4b4aa998031c9373cae1b54bf34d11c316f2a'
            'ba8836a40c11d432e6cabfee2a8792d44b1f3b56f0db77680a4f73511da1899c'
            '025d5f294f258a9d36334a610a0348ef3f084bba1e70c61cb0f7fea4b43f8e5a')
#noextract=("${pkgname-wine}_${pkgver}.zip")

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
"RegisteredOrganization"="${pkgname%-wine}"
"RegisteredOwner"="${pkgname%-wine}"

[HKEY_LOCAL_MACHINE\Software\Wine\Ports]
"COM1"="/dev/ttyUSB0"
"COM2"="/dev/ttyUSB1"
"COM3"="/dev/ttyUSB2"
"COM4"="/dev/ttyUSB3"
"COM5"="/dev/ttyUSB4"
"COM6"="/dev/ttyUSB5"
"COM7"="/dev/ttyACM0"
EOF
}

package() {
    export LC_CTYPE="zh_CN.UTF-8"

    _path="opt/openluat"
    _app="${pkgname%-wine}"
    _usb="driver"

    install -dm0755 "${pkgdir}/${_path}/${_app}" \
                    "${pkgdir}/usr/share/pixmaps"

    cp -r "${srcdir}/${pkgname%-wine}.exe" "${pkgdir}/${_path}/${_app}/${_app}.exe"
    cp -r "${srcdir}/AirM2M_USB_Download&Com_Driver_for_4G_V1.0.0.4" "${pkgdir}/${_path}/${_usb}"
    cp -r "${srcdir}/regpatch.reg" "${pkgdir}/${_path}/regpatch.reg"

    install -Dm0644 "${srcdir}/${pkgname%-wine}.svg" "${pkgdir}/usr/share/pixmaps/${pkgname%-wine}.svg"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/bash
export WINEARCH=win32 WINEPREFIX="$HOME/.${pkgname%-wine}/wine"

if [ ! -d "$HOME"/.${pkgname%-wine} ] ; then
    mkdir -p "$HOME"/.${pkgname%-wine}/wine || exit 1
#     winetricks win10
    ln -s /${_path}/regpatch.reg "$HOME"/.${pkgname%-wine}/wine || exit 1
    regedit "$HOME"/.${pkgname%-wine}/wine/regpatch.reg

    ln -s /${_path}/${_app}/${_app}.exe "$HOME"/.${pkgname%-wine}/${pkgname} || exit 1
    ln -s /${_path}/${_usb} "$HOME"/.${pkgname%-wine}/${_usb} || exit 1

    wine "$HOME"/.${pkgname%-wine}/${_usb}/DrvInstaller.exe
#     winetricks -q python27
#     wineboot --update

fi


WINEDEBUG=+loaddll wine "$HOME"/.${pkgname%-wine}/${pkgname} "\$@"

# wine "$HOME"/.${pkgname%-wine}/${pkgname} "\$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=${pkgname}
Name[zh_CN]=luatools
Comment=${pkgdesc}
Exec=${pkgname%-wine} %f
Type=Application
StartupNotify=true
Categories=Tool;Lua
Terminal=false
Icon=${pkgname%-wine}.svg
Version=${pkgver}
EOF
}
