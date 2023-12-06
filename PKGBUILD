# Maintainer: taotieren <admin@taotieren.com>

pkgbase=stc-isp-wine
pkgname=(stc-isp{,-tiny}-wine)
pkgver=6.92H
pkgrel=1
arch=('x86_64')
url="http://www.stcmcudata.com"
license=('unknow')
provides=('STC-ISP')
conflicts=('stc-isp' 'stc-isp-bin')
replaces=('stc-isp-bin')
depends=('wine' 'wqy-microhei' 'winetricks' 'wine-mono' 'wine-gecko')
optdepends=()
makedepends=('libarchive')
backup=()
options=('!strip')
install=${pkgname}.install
source=("${pkgname%-wine}-v${pkgver}.zip::${url}/STCISP/${pkgname%-wine}-15xx-v${pkgver}.zip"
        "${pkgname%-wine}-tiny-v${pkgver}.zip::${url}/STCISP/${pkgname%-wine}-15xx-v${pkgver}-tiny.zip"
        "stc-isp-wine.install"
        "stc-isp-tiny-wine.install"
        "icon.svg")
sha256sums=('ccc06f649bb97bf7c7691ec41706ea96561b54d4a4ad0e6cc5c4057bdfbcbbbe'
            '57a8b830aa7f8043c96197a0183e39ef8ae306bcf1d2d1c4600d3b9a043902f2'
            'b2a93211b74f6e23a9c4dd508c65bf374c0a03c11174092f6ccec3e9194e47a6'
            'b2a93211b74f6e23a9c4dd508c65bf374c0a03c11174092f6ccec3e9194e47a6'
            'c04d3cf704c9055e4b0bb010d946c5e90710677c459def826f762c8e9d717538')
# noextract=("${pkgname%-wine}-v${pkgver}.zip"
#             "${pkgname%-wine}-tiny-v${pkgver}.zip")

# prepare() {
#     unar -e GBK "${srcdir}/${pkgname%-wine}-v${pkgver}.zip"
#     unar -e GBK "${srcdir}/${pkgname%-wine}-tiny-v${pkgver}.zip"
#     bsdtar -xf  "${srcdir}/${pkgname%-wine}-v${pkgver}.zip"
#     bsdtar -xf  "${srcdir}/${pkgname%-wine}-tiny-v${pkgver}.zip"
# }

package_stc-isp-wine() {
    export LC_CTYPE="zh_CN.UTF-8"

    pkgdesc="Wine STC-ISP 下载编程烧录软件"

    _stc="opt/STCMCU"
    _ftname="wqy-microhei.ttc"

    install -dm0755 "${pkgdir}/${_stc}/${pkgname%-wine}"
    install -Dm6644 "${srcdir}/icon.svg" "${pkgdir}/usr/share/pixmaps/${pkgname%-wine}.svg"

#     cp -ra "${srcdir}/${pkgname%-wine}-v${pkgver}/${pkgname%-wine}-v${pkgver}.exe" "${pkgdir}/${_stc}/${pkgname%-wine}"
    cp -ra "${srcdir}/${pkgname%-wine}-v${pkgver}.exe" "${pkgdir}/${_stc}/${pkgname%-wine}"

    find "${pkgdir}/${_stc}" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/${_stc}" -type d -exec chmod 755 "{}" \;

    install -Dm0644 /dev/stdin "${pkgdir}/${_stc}/${pkgname%-wine}/regpatch.reg" << EOF
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
"FontSmoothingOrientation"=dword:00000001
"FontSmoothingType"=dword:00000002
"FontSmoothingGamma"=dword:00000578

[HKEY_LOCAL_MACHINE\Software\Wine\Ports]
"COM1"="/dev/ttyUSB0"
"COM2"="/dev/ttyUSB1"
"COM3"="/dev/ttyUSB2"
"COM4"="/dev/ttyUSB3"
"COM5"="/dev/ttyUSB4"
"COM6"="/dev/ttyUSB5"
"COM7"="/dev/ttyUSB6"
"COM8"="/dev/ttyUSB7"
"COM9"="/dev/ttyUSB8"
"COM10"="/dev/ttyACM0"
"COM11"="/dev/ttyACM1"
"COM12"="/dev/ttyACM2"
"COM13"="/dev/ttyACM3"
"COM14"="/dev/ttyACM4"
"COM15"="/dev/ttyACM5"
"COM16"="/dev/ttyACM6"
"COM17"="/dev/ttyACM7"
"COM18"="/dev/ttyACM8"
"COM19"="/dev/ttyACM9"
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-wine}" << EOF
#!/bin/bash
export LC_CTYPE="zh_CN.UTF-8"
export WINEARCH=win32 WINEPREFIX="$HOME/.${pkgname%-wine}/wine"
export WINEDLLOVERRIDES="mscoree,mshtml="

if [ ! -d "$HOME"/.${pkgname%-wine} ] ; then
    mkdir -p "$HOME"/.${pkgname%-wine}/wine || exit 1

    cp -r /${_stc}/${pkgname%-wine}/regpatch.reg "$HOME"/.${pkgname%-wine}/wine || exit 1

    ln -s /${_stc}/${pkgname%-wine}/${pkgname%-wine}-v${pkgver}.exe "$HOME"/.${pkgname%-wine}/${pkgname%-wine} || exit 1
fi

if [ ! -f "$HOME"/.${pkgname%-wine}/regpatchok ] ; then
    touch "$HOME"/.${pkgname%-wine}/regpatchok || exit 1
    cd "$HOME"/.${pkgname%-wine}/wine && regedit regpatch.reg && wineserver -k
    winetricks -q mfc42
fi

wine "$HOME"/.${pkgname%-wine}/${pkgname%-wine} "\$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-wine}.desktop" << EOF
[Desktop Entry]
Name=${pkgname%-wine}
Name[zh_CN]=${pkgname%-wine}
Comment=${pkgdesc}
#MimeType=application/x-${pkgname%-wine};
Exec=${pkgname%-wine} %f
Type=Application
Categories=Development;Tool;
Terminal=false
Icon=${pkgname%-wine}.svg
Version=${pkgver}
EOF
}

package_stc-isp-tiny-wine() {
    export LC_CTYPE="zh_CN.UTF-8"

    pkgdesc="Wine STC-ISP 简化版下载编程烧录软件"

    _stc="opt/STCMCU"
    _ftname="wqy-microhei.ttc"

    install -dm0755 "${pkgdir}/${_stc}/${pkgname%-wine}"
    install -Dm6644 "${srcdir}/icon.svg" "${pkgdir}/usr/share/pixmaps/${pkgname%-wine}.svg"

#     cp -ra "${srcdir}/${pkgname%-wine}-v${pkgver}/${pkgname%-tiny-wine}-v${pkgver}-tiny.exe" "${pkgdir}/${_stc}/${pkgname%-wine}/${pkgname%-wine}-${pkgver}.exe"
    cp -ra "${srcdir}/${pkgname%-tiny-wine}-v${pkgver}-tiny.exe" "${pkgdir}/${_stc}/${pkgname%-wine}/${pkgname%-wine}-${pkgver}.exe"

    find "${pkgdir}/${_stc}" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/${_stc}" -type d -exec chmod 755 "{}" \;

    install -Dm0644 /dev/stdin "${pkgdir}/${_stc}/${pkgname%-wine}/regpatch.reg" << EOF
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
"FontSmoothingOrientation"=dword:00000001
"FontSmoothingType"=dword:00000002
"FontSmoothingGamma"=dword:00000578

[HKEY_LOCAL_MACHINE\Software\Wine\Ports]
"COM1"="/dev/ttyUSB0"
"COM2"="/dev/ttyUSB1"
"COM3"="/dev/ttyUSB2"
"COM4"="/dev/ttyUSB3"
"COM5"="/dev/ttyUSB4"
"COM6"="/dev/ttyUSB5"
"COM7"="/dev/ttyUSB6"
"COM8"="/dev/ttyUSB7"
"COM9"="/dev/ttyUSB8"
"COM10"="/dev/ttyACM0"
"COM11"="/dev/ttyACM1"
"COM12"="/dev/ttyACM2"
"COM13"="/dev/ttyACM3"
"COM14"="/dev/ttyACM4"
"COM15"="/dev/ttyACM5"
"COM16"="/dev/ttyACM6"
"COM17"="/dev/ttyACM7"
"COM18"="/dev/ttyACM8"
"COM19"="/dev/ttyACM9"
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-wine}" << EOF
#!/bin/bash
export LC_CTYPE="zh_CN.UTF-8"
export WINEARCH=win32 WINEPREFIX="$HOME/.${pkgname%-wine}/wine"
export WINEDLLOVERRIDES="mscoree,mshtml="

if [ ! -d "$HOME"/.${pkgname%-wine} ] ; then
    mkdir -p "$HOME"/.${pkgname%-wine}/wine || exit 1

    cp -r /${_stc}/${pkgname%-wine}/regpatch.reg "$HOME"/.${pkgname%-wine}/wine || exit 1

    ln -s /${_stc}/${pkgname%-wine}/${pkgname%-wine}-v${pkgver}.exe "$HOME"/.${pkgname%-wine}/${pkgname%-wine} || exit 1
fi

if [ ! -f "$HOME"/.${pkgname%-wine}/regpatchok ] ; then
    touch "$HOME"/.${pkgname%-wine}/regpatchok || exit 1
    cd "$HOME"/.${pkgname%-wine}/wine && regedit regpatch.reg && wineserver -k
    winetricks -q mfc42
fi

wine "$HOME"/.${pkgname%-wine}/${pkgname%-wine} "\$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-wine}.desktop" << EOF
[Desktop Entry]
Name=${pkgname%-wine}
Name[zh_CN]=${pkgname%-wine}
Comment=${pkgdesc}
#MimeType=application/x-${pkgname%-wine};
Exec=${pkgname%-wine} %f
Type=Application
Categories=Development;Tool;
Terminal=false
Icon=${pkgname%-wine}.svg
Version=${pkgver}
EOF
}
