# Maintainer: taotieren <admin@taotieren.com>

pkgname=jlcpcassit-wine
pkgver=3.4.0
pkgrel=3
pkgdesc="Wine 嘉立创 PC 端下单助手"
arch=('any')
url="https://www.jlc.com/portal/appDownloadsWithConfig.html"
license=('unknow')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-wine})
replaces=("jlcpcassit-bin")
depends=('wine' 'winetricks' 'wqy-zenhei' 'unixodbc' 'lib32-unixodbc')
# makedepends=('innoextract')
optdepends=("wine-mono-gecko-version-fix: Fix the version numbers of wine-mono and wine-gecko files to solve the dialog box that pops up when starting wine.")
backup=()
options=('!strip')
install=${pkgname}.install
source=("${pkgname-wine}_${pkgver}.zip::https://download.jlc.com/jlchelper/release/${pkgver}/JLCPcAssit_setup_${pkgver}.zip"
        "${pkgname}.install")
sha256sums=('c6f47819c68b28d8661a36905601f33e2cd5ed686e9f2f5f08fbbb2276d42eb6'
            'efdc2e692ae8bb6072fdeec51efbf9cc00adcc6d9e29fbbb511a3fb209a358e8')
#noextract=("${pkgname-wine}_${pkgver}.zip")

prepare() {
#    innoextract -e "${srcdir}/setup.exe"

#     install -m755 -d "${srcdir}"/tmp "${srcdir}"/tmp/env "${srcdir}"/tmp/local

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

#     export WINEPREFIX="${srcdir}"/tmp/env
#     export XDG_DATA_HOME="${srcdir}"/tmp/local
#
#     regedit "${srcdir}/tmp/env/regpatch.reg"
#     wine "${srcdir}"/setup.exe /silent
}

package() {
    export LC_CTYPE="zh_CN.UTF-8"

    _jlc="opt/SZJLC"
    _pc="PcAssit"

    install -dm0755 "${pkgdir}/${_jlc}" \
                    "${pkgdir}/usr/share/pixmaps"

    cp -r "${srcdir}/setup.exe" "${pkgdir}/${_jlc}/${_pc}.exe"
#     cp -r "${srcdir}/app/${_pc}" "${pkgdir}/${_jlc}"
#     cp -r "${srcdir}/app/update" "${pkgdir}/${_jlc}"

    cp -r "${srcdir}/regpatch.reg" "${pkgdir}/${_jlc}/regpatch.reg"

#     find "${pkgdir}/${_jlc}" -type f -exec chmod 644 "{}" \;
#     find "${pkgdir}/${_jlc}" -type d -exec chmod 755 "{}" \;
#
#     cd "${pkgdir}/${_jlc}/${_pc}/" && chmod 0755 *.exe
#     cd "${pkgdir}/${_jlc}/update/" && chmod 0755 *.exe
#
#     cp -r "${srcdir}/VisualBasic6-KB896559-v1-ENU.exe" "${pkgdir}/${_jlc}/VisualBasic6-KB896559-v1-ENU.exe"
#
#     ln -sf "/${_jlc}/${_pc}/browser.ico" "${pkgdir}/usr/share/pixmaps/${pkgname%-wine}.ico"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-wine}" << EOF
#!/bin/bash
export WINEARCH=win32 WINEPREFIX="$HOME/.${pkgname%-wine}/wine"

if [ ! -d "$HOME"/.${pkgname%-wine} ] ; then
    mkdir -p "$HOME"/.${pkgname%-wine}/wine || exit 1

#     cp -r /${_jlc}/${_pc}/config "$HOME"/.${pkgname%-wine}/config || exit 1
#     cp -r /${_jlc}/${_pc}/nim_conf "$HOME"/.${pkgname%-wine}/nim_conf || exit 1
    cp -r /${_jlc}/regpatch.reg "$HOME"/.${pkgname%-wine}/wine || exit 1

    ln -s /${_jlc}/${_pc}.exe "$HOME"/.${pkgname%-wine}/${_pc}.exe || exit 1
#     ln -s /${_jlc}/${_pc}/VisualBasic6-KB896559-v1-ENU.exe "$HOME"/.${pkgname%-wine}/VisualBasic6-KB896559-v1-ENU.exe || exit 1
#     ln -s /${_jlc}/${_pc}/${_pc}.exe "$HOME"/.${pkgname%-wine}/${pkgname%-wine} || exit 1
#     ln -s /${_jlc}/${_pc}/${_pc}.Launcher.exe "$HOME"/.${pkgname%-wine}/${pkgname/-wine/-launcher} || exit 1
#     ln -s -T /${_jlc}/${_pc}/loaderr "$HOME"/.${pkgname%-wine}/loaderr || exit 1
#     ln -s -T /${_jlc}/${_pc}/locales "$HOME"/.${pkgname%-wine}/locales || exit 1
#     ln -s -T /${_jlc}/${_pc}}/ppflash "$HOME"/.${pkgname%-wine}/ppflash || exit 1
#     ln -s -T /${_jlc}/${_pc}}/skin "$HOME"/.${pkgname%-wine}/skin || exit 1
#
#     cp -r /${_jlc}/${_pc}/*.exe "$HOME"/.${pkgname%-wine} || exit 1
#     cp -r /${_jlc}/${_pc}/*.dll "$HOME"/.${pkgname%-wine} || exit 1
#     cp -r /${_jlc}/${_pc}/*.dat "$HOME"/.${pkgname%-wine} || exit 1
#     cp -r /${_jlc}/${_pc}/*.bin "$HOME"/.${pkgname%-wine} || exit 1
#     cp -r /${_jlc}/${_pc}/*.pak "$HOME"/.${pkgname%-wine} || exit 1
#     cp -r /${_jlc}/${_pc}/*.ico "$HOME"/.${pkgname%-wine} || exit 1

#     winetricks -q comctl32
#     winetricks -q comctl32ocx
#     winetricks -q comdlg32ocx
#     winetricks -q vb6run
#    wine "$HOME"/.${pkgname%-wine}/VisualBasic6-KB896559-v1-ENU.exe /q
#     winetricks -q msvcirt
#     winetricks -q richtx32
#     winetricks -q tabctl32
#     winetricks -q vcrun6sp6
winetricks -q richtx32
# winetricks fakechinese
winetricks mimeassoc=on
wineserver -k
wineboot --update
#     winetricks -q vcrun2010
    regedit "$HOME"/.${pkgname%-wine}/wine/regpatch.reg
    wine "$HOME"/.${pkgname%-wine}/${_pc}.exe /silent
    ln -s "$HOME"/.${pkgname%-wine}/wine/drive_c/Program Files/SZJLC/JLC_PC_Assit/PcAssit/PcAssit.exe "$HOME"/.${pkgname%-wine}/${pkgname%-wine} || exit 1
#     cd "$HOME"/.jlcpcassit/ && regsvr32 *.dll
    wineserver -k
#     wine --check-libs
fi

WINEDEBUG=+loaddll wine "$HOME"/.${pkgname%-wine}/${pkgname%-wine} "\$@"

# wine "$HOME"/.${pkgname%-wine}/${pkgname%-wine} "\$@"
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
Icon=${pkgname%-wine}.ico
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

    ln -s /${_jlc}/${_pc}/${_pc}.exe "$HOME"/.${pkgname%-wine}/${pkgname%-wine} || exit 1
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

wine "$HOME"/.${pkgname%-wine}/${pkgname/-wine/-launcher} "\$@"
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
Icon=${pkgname%-wine}.ico
Version=${pkgver}
EOF
}
