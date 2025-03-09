# Maintainer: taotieren <admin@taotieren.com>

pkgbase=hqdfm-wine
pkgname=hqdfm-wine
pkgver=3.5.0
pkgrel=1
pkgdesc="Wine 华秋 DFM 是一款高效的 PCB 设计软件，一键分析设计隐患，提供优化方案，输出 Gerber、BOM、坐标文件，让设计和制造更简单。"
arch=('x86_64')
url="https://dfm.elecfans.com"
license=('LicenseRef-unknow')
provides=(${pkgname%-wine})
conflicts=(${pkgname%-wine})
replaces=()
depends=(
    bash
    hicolor-icon-theme
    wine
    wqy-microhei
    winetricks)
optdepends=()
makedepends=('libarchive')
backup=()
options=('!strip' '!debug')
install=${pkgname}.install
source=(
    "${pkgname%-wine}-v${pkgver}.zip::${url}/uploads/software/HQDFM%20V${pkgver}.zip"
    "${pkgname}.install"
    "${pkgname%-wine}.png::${url}/static/images/dfm_logo.png")
sha256sums=('318371bd51198a81cc291d09246c905ebb02e33042fd918cb6a3ced0f7aa5ce7'
            '18ba316bf686a95eda0ac51276965b6ba2a0c7093ed6c73484b3d226b5cb1085'
            '2fa20ad946fbf021b14d9493aad8b7af3d8829e71b0ca66316b2ee1065b66b15')
# noextract=("${pkgname%-wine}-v${pkgver}.zip"
#             "${pkgname%-wine}-tiny-v${pkgver}.zip")

# prepare() {
#     unar -e GBK "${srcdir}/${pkgname%-wine}-v${pkgver}.zip"
#     unar -e GBK "${srcdir}/${pkgname%-wine}-tiny-v${pkgver}.zip"
#     bsdtar -xf  "${srcdir}/${pkgname%-wine}-v${pkgver}.zip"
#     bsdtar -xf  "${srcdir}/${pkgname%-wine}-tiny-v${pkgver}.zip"
# }

package() {

    _pname="opt/hqfdm"
    _ftname="wqy-microhei.ttc"

    install -dm0755 "${pkgdir}/${_pname}/${pkgname%-wine}"
    install -Dm6644 "${srcdir}/${pkgname%-wine}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-wine}.png"

    #     cp -ra "${srcdir}/${pkgname%-wine}-v${pkgver}.exe" "${pkgdir}/${_pname}/${pkgname%-wine}"
    cp -ra "${srcdir}/HQDFM Setup.exe" "${pkgdir}/${_pname}/${pkgname%-wine}/${pkgname%-wine}-v${pkgver}.exe"

    #     find "${pkgdir}/${_pname}" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/${_pname}" -type d -exec chmod 755 "{}" \;

    install -Dm0644 /dev/stdin "${pkgdir}/${_pname}/${pkgname%-wine}/regpatch.reg" <<EOF
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

EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-wine}" <<EOF
#!/bin/bash
export LC_CTYPE="zh_CN.UTF-8"
export WINEARCH=win64 WINEPREFIX="\$HOME/.${pkgname%-wine}/wine"
export WINEDLLOVERRIDES="mscoree,mshtml=,winemenubuilder.exe=d"

if [ ! -d "\$HOME"/.${pkgname%-wine} ] ; then
    mkdir -pv "\$HOME"/.${pkgname%-wine}/wine || exit 1

    cp -rv /${_pname}/${pkgname%-wine}/regpatch.reg "\$HOME"/.${pkgname%-wine}/wine || exit 1

    cp -rv /${_pname}/${pkgname%-wine}/${pkgname%-wine}-v${pkgver}.exe "\$HOME"/.${pkgname%-wine}/${pkgname%-wine} || exit 1
fi

if [ ! -f "\$HOME"/.${pkgname%-wine}/regpatchok ] ; then
    touch "\$HOME"/.${pkgname%-wine}/regpatchok || exit 1
    cd "\$HOME"/.${pkgname%-wine}/wine && regedit regpatch.reg && wineserver -k
    winetricks -q mfc42 vcrun2015 riched20
fi

wine "\$HOME"/.${pkgname%-wine}/${pkgname%-wine} "\$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-wine}.desktop" <<EOF
[Desktop Entry]
Name=${pkgname%-wine}
Name[zh_CN]=${pkgname%-wine}
Comment=${pkgdesc}
#MimeType=application/x-${pkgname%-wine};
Exec=${pkgname%-wine} %f
Type=Application
Categories=Tool;PCB设计;PCB软件;PCB设计软件;DFM;
Terminal=false
Icon=${pkgname%-wine}
Version=${pkgver}
EOF
}
