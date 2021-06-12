# Maintainer: taotieren <admin@taotieren.com>

pkgname=stc-isp-bin
pkgver=v6.88F
pkgrel=1
pkgdesc="STC-ISP 下载编程烧录软件"
arch=('any')
url="http://www.stcmcudata.com"
license=('unknow')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-bin})
#replaces=(${pkgname})
depends=('wine' 'wqy-zenhei' 'winetricks')
optdepends=("wine-mono-gecko-version-fix: Fix the version numbers of wine-mono and wine-gecko files to solve the dialog box that pops up when starting wine.")
makedepends=('unarchiver')
backup=()
options=('!strip')
install=${pkgname}.install
source=("${pkgname%-bin}-${pkgver}.zip::${url}/STCISP/${pkgname%-bin}-15xx-${pkgver}.zip"
        "${pkgname}.install")
sha256sums=('f5a0499c37048ec1311048b61b0c17c883226133d56708e931496e06dd706e34'
            'b2a93211b74f6e23a9c4dd508c65bf374c0a03c11174092f6ccec3e9194e47a6')
noextract=("${pkgname%-bin}-${pkgver}.zip")

prepare() {
    unar -e GBK "${srcdir}/${pkgname%-bin}-${pkgver}.zip"
}

package() {
    export LC_CTYPE="zh_CN.UTF-8"

    _stc="opt/STCMCU"
    _ftname="wqy-zenhei.ttc"

    install -dm0755 "${pkgdir}/${_stc}/${pkgname%-bin}"

    cp -ra ${srcdir}/${pkgname%-bin}-${pkgver}/* "${pkgdir}/${_stc}/${pkgname%-bin}"

    find "${pkgdir}/${_stc}" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/${_stc}" -type d -exec chmod 755 "{}" \;

    install -Dm0644 /dev/stdin "${pkgdir}/${_stc}/${pkgname%-bin}/regpatch.reg" << EOF
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

[HKEY_LOCAL_MACHINE\Software\Wine\Ports]
"COM1"="/dev/ttyUSB0"
"COM2"="/dev/ttyUSB1"
"COM3"="/dev/ttyUSB2"
"COM4"="/dev/ttyUSB3"
"COM5"="/dev/ttyUSB4"
"COM6"="/dev/ttyUSB5"
"COM7"="/dev/ttyACM0"
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" << EOF
#!/bin/bash
export WINEARCH=win32 WINEPREFIX="$HOME/.${pkgname%-bin}/wine"

if [ ! -d "$HOME"/.${pkgname%-bin} ] ; then
    mkdir -p "$HOME"/.${pkgname%-bin}/wine || exit 1

    cp -r /${_stc}/${pkgname%-bin}/regpatch.reg "$HOME"/.${pkgname%-bin}/wine || exit 1

    ln -s /${_stc}/${pkgname%-bin}/${pkgname%-bin}-${pkgver}.exe "$HOME"/.${pkgname%-bin}/${pkgname%-bin} || exit 1
    ln -s -T /${pkgdir}/${_stc}/${pkgname%-bin}/"STC-USB Driver" "$HOME"/.${pkgname%-bin}/"STC-USB Driver" || exit 1
    ln -s -T /${_stc}/${pkgname%-bin}/"USB to UART Driver" "$HOME"/.${pkgname%-bin}/"USB to UART Driver" || exit 1
    ln -s -T /${_stc}/${pkgname%-bin}/"STC-USB驱动安装说明.pdf" "$HOME"/.${pkgname%-bin}/"STC-USB驱动安装说明.pdf" || exit 1
    ln -s -T /${_stc}/${pkgname%-bin}/readme.txt "$HOME"/.${pkgname%-bin}/readme.txt || exit 1
fi

if [ ! -f "$HOME"/.${pkgname%-bin}/regpatchok ] ; then
    touch "$HOME"/.${pkgname%-bin}/regpatchok || exit 1
    cd "$HOME"/.${pkgname%-bin}/wine && regedit regpatch.reg && wineserver -k
    winetricks -q mfc42
fi

wine "$HOME"/.${pkgname%-bin}/${pkgname%-bin} "$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop" << EOF
[Desktop Entry]
Name=${pkgname%-bin}
Name[zh_CN]=${pkgname%-bin}
Comment=STC-ISP 下载编程烧录软件
#MimeType=application/x-${pkgname%-bin};
Exec=${pkgname%-bin} %f
Type=Application
Categories=Development;Tool;
Terminal=false
Icon=${pkgname%-bin}.png
Version=${pkgver}
EOF
}
