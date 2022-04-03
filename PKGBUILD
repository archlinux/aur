# Maintainer: taotieren <admin@taotieren.com>

pkgname=pandownload-wine
pkgver=0.0.5
pkgrel=2
pkgdesc="本软件为 PanDownload 的众多修改版中的一个，鉴于找不到比 PanDownload 更优秀的百度网盘多账号管理软件，所以对 PanDownload 进行了一些基础功能上的修复。"
arch=('any')
url="https://pandownload.net/"
license=('unknow')
provides=('PanDownload')
conflicts=()
replaces=()
depends=('wine' 'wqy-microhei' 'winetricks' 'wine-mono' 'wine-gecko' 'lib32-gnutls')
optdepends=("wine-mono-gecko-version-fix: Fix the version numbers of wine-mono and wine-gecko files to solve the dialog box that pops up when starting wine.")
makedepends=('unarchiver')
backup=()
options=('!strip')
install=${pkgname}.install
_pkg_file_name=PanDownload_公测版_${pkgver}_ALL.zip
source=("${_pkg_file_name}::https://harmonyos.oss-cn-beijing.aliyuncs.com/attach/202203/19b020f48842c4d37b4623a4ee80248a1ea463.zip"
        "${pkgname}.install")
sha256sums=('b57c1113d037b569c30525cfa5c9fa47fe30eee36cc4e424c830fef8497ac1d1'
            '50f2d42d213da6a4567e99184571906f86377c8001c6a0e0a490338110279163')
noextract=("${_pkg_file_name}")

package() {
    export LC_CTYPE="zh_CN.UTF-8"

    _path="opt/${pkgname%-wine}"
    _ftname="wqy-microhei.ttc"

    install -dm0755 "${pkgdir}/${_path}/${pkgname%-wine}"

#     cp -ra "${srcdir}/${pkgname%-wine}-${pkgver}/${pkgname%-wine}-${pkgver}.exe" "${pkgdir}/${_path}/${pkgname%-wine}"
    bsdtar -xf "${srcdir}/${_pkg_file_name}" -C "${pkgdir}/${_path}/${pkgname%-wine}"

    find "${pkgdir}/${_path}" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/${_path}" -type d -exec chmod 755 "{}" \;

    install -Dm0644 /dev/stdin "${pkgdir}/${_path}/${pkgname%-wine}/regpatch.reg" << EOF
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

EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-wine}" << EOF
#!/bin/bash
export LC_CTYPE="zh_CN.UTF-8"
export WINEARCH=win32 WINEPREFIX="$HOME/.${pkgname%-wine}/wine"

if [ ! -d "$HOME"/.${pkgname%-wine} ] ; then
    mkdir -p "$HOME"/.${pkgname%-wine}/wine || exit 1

    cp -r /${_path}/${pkgname%-wine}/regpatch.reg "$HOME"/.${pkgname%-wine}/wine || exit 1

    cp -r /${_path}/${pkgname%-wine}/Pandownload.exe "$HOME"/.${pkgname%-wine}/${pkgname%-wine} || exit 1
    cp -r /${_path}/${pkgname%-wine}/libcurl.dll "$HOME"/.${pkgname%-wine}/libcurl.dll || exit 1
    cp -r /${_path}/${pkgname%-wine}/lua53.dll "$HOME"/.${pkgname%-wine}/lua53.dll || exit 1
    cp -r /${_path}/${pkgname%-wine}/PanData "$HOME"/.${pkgname%-wine}/PanData || exit 1
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
Icon=${pkgname%-wine}.png
Version=${pkgver}
EOF
}
