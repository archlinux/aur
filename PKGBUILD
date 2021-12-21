# Maintainer: taotieren <admin@taotieren.com>

pkgname=aliyundrive-wine
pkgver=2.3.4
pkgrel=1
pkgdesc="Wine 阿里云盘"
arch=('any')
url="https://www.aliyundrive.com"
license=('unknow')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=('wine' 'wqy-microhei')
makedepends=()
optdepends=("wine-mono-gecko-version-fix: Fix the version numbers of wine-mono and wine-gecko files to solve the dialog box that pops up when starting wine.")
backup=()
options=('!strip')
install=${pkgname}.install
source=("aDrive-${pkgver}.exe::https://yunpan.aliyun.com/downloads/apps/desktop/aDrive.exe"
        "${pkgname}.install")
sha256sums=('5ac6ec57ede7c4b31aaeb4b193507f95cd3f6ac8bc51b78b9140aa4fd42dcb14'
            'f5674719ec03e4f2d701241338f967d740b31f5c0173ba85882c3f1342350d63')
noextract=()

prepare() {

    _ftname="wqy-microhei.ttc"
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


[HKEY_CURRENT_USER\Software\Wine\Dll Overrides]
"msvcp100"="native,builtin"
"msvcr100"="native,builtin"
"msvcp120"="native,builtin"
"msvcr120"="native,builtin"
"vcruntime140"="native,builtin"
"nim"="native,builtin"
"nrtc"="native,builtin"
"libcef"="native,builtin"
"libEGL"="native,builtin"
"libGLESv2"="native,builtin"
"d3dcompiler_43"="native,builtin"
"d3dcompiler_47"="native,builtin"
"Log4cxx2_vc140x_mt"="native,builtin"
"CryptTool_vc140x_mt"="native,builtin"
"Log4cxxx_vc140x_mt"="native,builtin"
"DuiLib_vc140x_mt"="native,builtin"
"MemoryBuffer_vc140x_mt"="native,builtin"
"ExtractTool_vc140x_mt"="native,builtin"
"GerberDll_vc140x_mt"="native,builtin"
"HookFlash_vc140x_mt"="native,builtin"
"RarExt"="native,builtin"
"SmtCheckTools_vc140x_mt"="native,builtin"
"acge15"="native,builtin"
"acge18"="native,builtin"
"chrome_elf"="native,builtin"
"SmtCheckTools_vc140x_mt"="native,builtin"
"zextract_vc140x_mt"="native,builtin"
"zlibwapi_vc140x_mt"="native,builtin"
"nim_audio"="native,builtin"
"nim_audio_hook"="native,builtin"
"nim_chatroom"="native,builtin"
"nim_tools_http"="native,builtin"
"nrtc"="native,builtin"
"nrtc_audio_process"="native,builtin"
"libcef"="native,builtin"
"log4cxx_vc140x_mt"="native,builtin"
"mmpool_vc140x_mt"="native,builtin"
"libGLESv2"="native,builtin"
"libEGL"="native,builtin"
"importODB_vc140x_mt"="native,builtin"
"importExcellon_vc140x_mt"="native,builtin"
"import274x_vc140x_mt"="native,builtin"
"image_ole"="native,builtin"
EOF

}

package() {
    export LC_CTYPE="zh_CN.UTF-8"

    _aliyun="opt/aliyun"
    _drive="aDrive"

    install -dm0755 "${pkgdir}/${_aliyun}" \
                    "${pkgdir}/usr/share/pixmaps"

    install -Dm0755 "${srcdir}/${_drive}-${pkgver}.exe" "${pkgdir}/${_aliyun}/${_drive}.exe"
    cp -r "${srcdir}/regpatch.reg" "${pkgdir}/${_aliyun}/regpatch.reg"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-wine}" << EOF
#!/bin/bash
export WINEARCH=win32 WINEPREFIX="$HOME/.${pkgname%-wine}/wine"

if [ ! -d "$HOME"/.${pkgname%-wine} ] ; then
    mkdir -p "$HOME"/.${pkgname%-wine}/wine || exit 1

    cp -r /${_aliyun}/regpatch.reg "$HOME"/.${pkgname%-wine}/wine || exit 1
    ln -s /${_aliyun}/${_drive}.exe "$HOME"/.${pkgname%-wine}/${_drive}.exe || exit 1

    regedit "$HOME"/.${pkgname%-wine}/wine/regpatch.reg
    wine "$HOME"/.${pkgname%-wine}/${_drive}.exe
#     /silent /D=C:\Program Files\${_drive}
fi

wine "$HOME"/.${pkgname%-wine}/wine/drive_c/Program\ Files/${_drive}/${_drive}.exe "\$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-wine}.desktop" << EOF
[Desktop Entry]
Name=${pkgname%-wine}
Name[zh_CN]=阿里云盘
Comment=${pkgdesc}
Exec=${pkgname%-wine} %f
Type=Application
StartupNotify=true
Categories=Tool;
Terminal=false
Icon=${pkgname%-wine}
Version=${pkgver}
EOF
}
