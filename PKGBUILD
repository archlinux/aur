# Maintainer: taotieren <admin@taotieren.com>

pkgname=jlcpcassit-wine
pkgver=3.4.0
pkgrel=2
pkgdesc="Wine 嘉立创 PC 端下单助手"
arch=('any')
url="https://www.jlc.com/portal/appDownloadsWithConfig.html"
license=('unknow')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-wine})
replaces=("jlcpcassit-bin")
depends=('wine' 'winetricks' 'wqy-zenhei' 'unixodbc' 'lib32-unixodbc')
optdepends=("wine-mono-gecko-version-fix: Fix the version numbers of wine-mono and wine-gecko files to solve the dialog box that pops up when starting wine.")
# makedepends=('unarchiver')
backup=()
options=('!strip')
install=${pkgname}.install
source=("${pkgname-wine}_${pkgver}.zip::https://download.jlc.com/jlchelper/release/${pkgver}/JLCPcAssit_setup_${pkgver}.zip"
        "${pkgname}.install")
sha256sums=('c6f47819c68b28d8661a36905601f33e2cd5ed686e9f2f5f08fbbb2276d42eb6'
            'efdc2e692ae8bb6072fdeec51efbf9cc00adcc6d9e29fbbb511a3fb209a358e8')
#noextract=("${pkgname-wine}_${pkgver}.zip")

prepare() {
#    unar -e GBK "${srcdir}/${pkgname-wine}_${pkgver}.zip"

    install -m755 -d "${srcdir}"/tmp "${srcdir}"/tmp/env "${srcdir}"/tmp/local

    _ftname="wqy-zenhei.ttc"
    install -Dm0644 /dev/stdin "${srcdir}/tmp/env/regpatch.reg" << EOF
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
"vcruntime140"="native,builtin"
"nim"="native,builtin"
"nrtc"="native,builtin"
"libcef"="native,builtin"
"libEGL"="native,builtin"
"libGLESv2"="native,builtin"
"d3dcompiler_43"="native,builtin"
"d3dcompiler_47"="native,builtin"
"acge15"="native,builtin"

EOF

    export WINEPREFIX="${srcdir}"/tmp/env
    export XDG_DATA_HOME="${srcdir}"/tmp/local

    regedit "${srcdir}/tmp/env/regpatch.reg"
    wine "${srcdir}"/setup.exe /silent
}

package() {
    export LC_CTYPE="zh_CN.UTF-8"

    _jlc="opt/SZJLC/JLC_PC_Assit"
    _pc="PcAssit"

    install -dm0755 "${pkgdir}/opt"

    install -Dm0644 "${srcdir}/tmp/local/icons/hicolor/64x64/apps/54AE_PcAssit.0.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname%-wine}.png"

    cp -r "${srcdir}"/tmp/env/drive_c/Program\ Files/SZJLC "${pkgdir}/opt"

    cp -r "${srcdir}/tmp/env/regpatch.reg" "${pkgdir}/${_jlc}/regpatch.reg"

    find "${pkgdir}/${_jlc}" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/${_jlc}" -type d -exec chmod 755 "{}" \;

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-wine}" << EOF
#!/bin/bash
export WINEARCH=win32 WINEPREFIX="$HOME/.${pkgname%-wine}/wine"

if [ ! -d "$HOME"/.${pkgname%-wine} ] ; then
    mkdir -p "$HOME"/.${pkgname%-wine}/wine || exit 1

    cp -r /${_jlc}/${_pc}/config "$HOME"/.${pkgname%-wine}/config || exit 1
    cp -r /${_jlc}/${_pc}/nim_conf "$HOME"/.${pkgname%-wine}/nim_conf || exit 1
    cp -r /${_jlc}/regpatch.reg "$HOME"/.${pkgname%-wine}/wine || exit 1

    ln -s /${_jlc}/${_pc}/${_pc}.exe "$HOME"/.${pkgname%-wine}/${pkgname%-wine} || exit 1
    ln -s -T /${_jlc}/${_pc}/loaderr "$HOME"/.${pkgname%-wine}/loaderr || exit 1
    ln -s -T /${_jlc}/${_pc}/locales "$HOME"/.${pkgname%-wine}/locales || exit 1
    ln -s -T /${_jlc}/${_pc}}/ppflash "$HOME"/.${pkgname%-wine}/ppflash || exit 1
    ln -s -T /${_jlc}/${_pc}}/skin "$HOME"/.${pkgname%-wine}/skin || exit 1

    cp -r /${_jlc}/${_pc}/*.exe "$HOME"/.${pkgname%-wine} || exit 1
    cp -r /${_jlc}/${_pc}/*.dll "$HOME"/.${pkgname%-wine} || exit 1
    cp -r /${_jlc}/${_pc}/*.dat "$HOME"/.${pkgname%-wine} || exit 1
    cp -r /${_jlc}/${_pc}/*.bin "$HOME"/.${pkgname%-wine} || exit 1
    cp -r /${_jlc}/${_pc}/*.pak "$HOME"/.${pkgname%-wine} || exit 1
    cp -r /${_jlc}/${_pc}/*.ico "$HOME"/.${pkgname%-wine} || exit 1

fi

if [ ! -f "$HOME"/.${pkgname%-wine}/regok ] ; then
    touch "$HOME"/.${pkgname%-wine}/regok || exit 1

#     winetricks -q vcrun2010

    cd "/home/taotieren"/.jlcpcassit/ && regsvr32 *.dll
    wineserver -k
    regedit "$HOME"/.${pkgname%-wine}/wine/regpatch.reg
    wineserver -k
fi

# WINEDEBUG=+loaddll wine64 "$HOME"/.${pkgname%-wine}/${pkgname%-wine} "$@"

wine "$HOME"/.${pkgname%-wine}/${pkgname%-wine} "$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-wine}.desktop" << EOF
[Desktop Entry]
Name=${pkgname%-wine}
Name[zh_CN]=嘉立创下单助手
Comment=${pkgdesc}
Exec=${pkgname%-wine} %f
Type=Application
StartupNotify=true
Categories=Tool;
Terminal=false
Icon=${pkgname%-wine}.png
Version=${pkgver}
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname/-wine/-launcher}" << EOF
#!/bin/bash
export WINEARCH=win32 WINEPREFIX="$HOME/.${pkgname%-wine}/wine"

if [ ! -d "$HOME"/.${pkgname%-wine} ] ; then
    mkdir -p "$HOME"/.${pkgname%-wine}/wine || exit 1

    cp -r /${_jlc}/${_pc}/config "$HOME"/.${pkgname%-wine}/config || exit 1
    cp -r /${_jlc}/${_pc}/nim_conf "$HOME"/.${pkgname%-wine}/nim_conf || exit 1
    cp -r /${_jlc}/regpatch.reg "$HOME"/.${pkgname%-wine}/wine || exit 1

    ln -s /${_jlc}/${_pc}/${_pc}.Launcher.exe "$HOME"/.${pkgname%-wine}/${pkgname/-wine/-launcher} || exit 1
#     ln -s -T /${_jlc}/${_pc}/*.exe "$HOME"/.${pkgname%-wine} || exit 1
#     ln -s -T /${_jlc}/${_pc}/*.dll "$HOME"/.${pkgname%-wine} || exit 1
#     ln -s -T /${_jlc}/${_pc}/*.wine "$HOME"/.${pkgname%-wine} || exit 1
#     ln -s -T /${_jlc}/${_pc}/*.pak "$HOME"/.${pkgname%-wine} || exit 1
#     ln -s -T /${_jlc}/${_pc}/*.ico "$HOME"/.${pkgname%-wine} || exit 1
    cp -r /${_jlc}/${_pc}/*.exe "$HOME"/.${pkgname%-wine} || exit 1
    cp -r /${_jlc}/${_pc}/*.dll "$HOME"/.${pkgname%-wine} || exit 1
    cp -r /${_jlc}/${_pc}/*.bin "$HOME"/.${pkgname%-wine} || exit 1
    cp -r /${_jlc}/${_pc}/*.pak "$HOME"/.${pkgname%-wine} || exit 1
    cp -r /${_jlc}/${_pc}/*.ico "$HOME"/.${pkgname%-wine} || exit 1

    ln -s -T /${_jlc}/${_pc}/loaderr "$HOME"/.${pkgname%-wine}/loaderr || exit 1
    ln -s -T /${_jlc}/${_pc}/locales "$HOME"/.${pkgname%-wine}/locales || exit 1
    ln -s -T /${_jlc}/${_pc}}/ppflash "$HOME"/.${pkgname%-wine}/ppflash || exit 1
    ln -s -T /${_jlc}/${_pc}}/skin "$HOME"/.${pkgname%-wine}/skin || exit 1


fi

if [ ! -f "$HOME"/.${pkgname%-wine}/regok ] ; then
    touch "$HOME"/.${pkgname%-wine}/regok || exit 1
    cd "$HOME"/.${pkgname%-wine}/wine && regedit regpatch.reg
fi

wine "$HOME"/.${pkgname%-wine}/${pkgname/-wine/-launcher} "$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname/-wine/-launcher}.desktop" << EOF
[Desktop Entry]
Name=${pkgname/-wine/-launcher}
Name[zh_CN]=嘉立创下单桌面助手
Comment=Wine 嘉立创下单桌面助手
Exec=${pkgname/-wine/-launcher} %f
Type=Application
StartupNotify=true
Categories=Tool;
Terminal=false
Icon=${pkgname%-wine}.png
Version=${pkgver}
EOF
}
