# Maintainer: taotieren <admin@taotieren.com>

pkgname=bingdianwenku-wine
pkgver=v3.2.16.0125
pkgrel=1
pkgdesc="Wine 冰点文库下载器是一款免费的文库下载器软件，用户可以通过使用冰点文库下载器下载各种各样的文库文档。（原官网迫于百度压力已关闭，使用的是第三方的地址）"
arch=('any')
url="http://www.bingdian001.com/"
license=('unknow')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-wine})
replaces=(${pkgname})
depends=('wine' 'wqy-zenhei')
optdepends=("wine-mono-gecko-version-fix: Fix the version numbers of wine-mono and wine-gecko files to solve the dialog box that pops up when starting wine.")
makedepends=()
backup=()
options=('!strip')
install=${pkgname}.install
source=("${pkgname%-wine}.zip::https://dl10.95862788.com/soft/bingdianwenku.zip"
        "${pkgname}.install")
sha256sums=('ba13dd597f4701c240ca1793257d2a9b2ff24c118b65619cb4b8fd7078c40584'
            '792ad87a7c283299b007d93ec06f596c81a6aadae839c87e29fa94eff38308c8')


package() {

    _path="opt/bingdianwenku"

    install -dm0755 "${pkgdir}/${_path}/${pkgname%-wine}"

    cp -r "${srcdir}/冰点下载器_3.2.16.0125_Single.exe" "${pkgdir}/${_path}/${pkgname%-wine}.exe"

    find "${pkgdir}/${_path}" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/${_path}" -type d -exec chmod 755 "{}" \;

    _ftname="wqy-zenhei.ttc"
    install -Dm0644 /dev/stdin "${pkgdir}/${_path}/regpatch.reg" << EOF
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
"RegisteredOrganization"="H7-TOOL"
"RegisteredOwner"="H7-TOOL"

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\winebus]
"Start"=dword:00000002

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\winehid]
"Start"=dword:00000002

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\wineusb]
"Start"=dword:00000002

EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-wine}" << EOF
#!/bin/bash
export WINEARCH=win32 WINEPREFIX="$HOME/.${pkgname%-wine}/wine"

if [ ! -d "$HOME"/.${pkgname%-wine} ] ; then
    mkdir -p "$HOME"/.${pkgname%-wine}/wine || exit 1
    ln -s /${_path}/regpatch.reg "$HOME"/.${pkgname%-wine}/wine || exit 1
    ln -s /${_path}/${pkgname%-wine}.exe "$HOME"/.${pkgname%-wine}/${pkgname%-wine} || exit 1

    regedit "$HOME"/.${pkgname%-wine}/wine/regpatch.reg
    wineserver -k
fi

wine "$HOME"/.${pkgname%-wine}/${pkgname%-wine} "\$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-wine}.desktop" << EOF
[Desktop Entry]
Name=${pkgname%-wine}
Name[zh_CN]=冰点文库
Comment=${pkgdesc}
#MimeType=application/x-${pkgname%-wine};
Exec=${pkgname%-wine} %f
Type=Application
Categories=Development;Tool;
Terminal=false
#Icon=${pkgname%-wine}.png
Version=${pkgver}
EOF
}
