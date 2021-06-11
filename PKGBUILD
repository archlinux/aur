# Maintainer: taotieren <admin@taotieren.com>

pkgname=jlcpcassit-bin
pkgver=3.4.0
pkgrel=1
pkgdesc="嘉立创 PC 端下单助手"
arch=('x86_64')
url="https://www.jlc.com/portal/appDownloadsWithConfig.html"
license=('unknow')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-bin})
#replaces=(${pkgname})
depends=('wine' 'wqy-zenhei')
optdepends=("wine-mono-gecko-version-fix: Fix the version numbers of wine-mono and wine-gecko files to solve the dialog box that pops up when starting wine.")
makedepends=('unarchiver')
backup=()
options=('!strip')
install=${pkgname}.install
source=("${pkgname-bin}_${pkgver}.zip::https://download.jlc.com/jlchelper/release/${pkgver}/JLCPcAssit_setup_${pkgver}.zip"
        "${pkgname}.install")
sha256sums=('c6f47819c68b28d8661a36905601f33e2cd5ed686e9f2f5f08fbbb2276d42eb6'
            'a36674b1b1bfdc1aa028bc1a0a573d40186c63bd86cafdb2055844823642d00b')
#noextract=("${pkgname-bin}_${pkgver}.zip")

prepare() {
#    unar -e GBK "${srcdir}/${pkgname-bin}_${pkgver}.zip"

    install -m755 -d "${srcdir}"/tmp "${srcdir}"/tmp/env "${srcdir}"/tmp/local

    _ftname="wqy-zenhei.ttc"
    install -Dm0644 /dev/stdin "${srcdir}/tmp/env/ttffont.reg" << EOF
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
EOF

    export WINEPREFIX="${srcdir}"/tmp/env
    export XDG_DATA_HOME="${srcdir}"/tmp/local
    regedit "${srcdir}/tmp/env/ttffont.reg"
#     wine "${srcdir}"/setup.exe /silentoptions
    wine "${srcdir}"/setup.exe /q
}

package() {
    export LC_CTYPE="zh_CN.UTF-8"

    _jlc="opt/SZJLC/JLC_PC_Assit"
    _pc="PcAssit"

    install -dm0755 "${pkgdir}/opt"

    install -Dm0644 "${srcdir}/tmp/local/icons/hicolor/64x64/apps/54AE_PcAssit.0.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname%-bin}.png"

    cp -r "${srcdir}"/tmp/env/drive_c/Program\ Files/SZJLC "${pkgdir}/opt"

    cp -r "${srcdir}/tmp/env/ttffont.reg" "${pkgdir}/${_jlc}/ttffont.reg"

    find "${pkgdir}/${_jlc}" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/${_jlc}" -type d -exec chmod 755 "{}" \;

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" << EOF
#!/bin/bash
export LC_CTYPE="zh_CN.UTF-8"
export WINEARCH=win32 WINEPREFIX="$HOME/.${pkgname%-bin}/wine"

if [ ! -d "$HOME"/.${pkgname%-bin} ] ; then
    mkdir -p "$HOME"/.${pkgname%-bin}/wine || exit 1

    cp -r /${_jlc}/${_pc}/config "$HOME"/.${pkgname%-bin}/config || exit 1
    cp -r /${_jlc}/${_pc}/nim_conf "$HOME"/.${pkgname%-bin}/nim_conf || exit 1
    cp -r /${_jlc}/ttffont.reg "$HOME"/.${pkgname%-bin}/wine || exit 1

    ln -s /${_jlc}/${_pc}/${_pc}.exe "$HOME"/.${pkgname%-bin}/${pkgname%-bin} || exit 1
    ln -s -T /${_jlc}/${_pc}/loaderr "$HOME"/.${pkgname%-bin}/loaderr || exit 1
    ln -s -T /${_jlc}/${_pc}/locales "$HOME"/.${pkgname%-bin}/locales || exit 1
    ln -s -T /${_jlc}/${_pc}}/ppflash "$HOME"/.${pkgname%-bin}/ppflash || exit 1
    ln -s -T /${_jlc}/${_pc}}/skin "$HOME"/.${pkgname%-bin}/skin || exit 1

    cp -r /${_jlc}/${_pc}/*.exe "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${_jlc}/${_pc}/*.dll "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${_jlc}/${_pc}/*.bin "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${_jlc}/${_pc}/*.pak "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${_jlc}/${_pc}/*.ico "$HOME"/.${pkgname%-bin} || exit 1

fi

if [ ! -f "$HOME"/.${pkgname%-bin}/fontok ] ; then
    touch "$HOME"/.${pkgname%-bin}/fontok || exit 1
    cd "$HOME"/.${pkgname%-bin}/wine && regedit ttffont.reg
fi

if [ ! -f "$HOME"/.${pkgname%-bin}/fontok ] ; then
    touch "$HOME"/.${pkgname%-bin}/fontok || exit 1
    cd "$HOME"/.${pkgname%-bin}/wine && regedit ttffont.reg
fi

if [ ! -f "$HOME"/.${pkgname%-bin}/mono ] ; then
    touch "$HOME"/.${pkgname%-bin}/mono || exit 1
    winetricks -q msxml3 dotnet40 corefonts
fi

wine "$HOME"/.${pkgname%-bin}/${pkgname%-bin} "$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop" << EOF
[Desktop Entry]
Name=${pkgname%-bin}
Name[zh_CN]=嘉立创下单助手
Comment=嘉立创下单助手
Exec=${pkgname%-bin} %f
Type=Application
StartupNotify=true
Categories=Tool;
Terminal=false
Icon=${pkgname%-bin}.png
Version=${pkgver}
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname/-bin/-launcher}" << EOF
#!/bin/bash
export LC_CTYPE="zh_CN.UTF-8"
export WINEARCH=win32 WINEPREFIX="$HOME/.${pkgname%-bin}/wine"

if [ ! -d "$HOME"/.${pkgname%-bin} ] ; then
    mkdir -p "$HOME"/.${pkgname%-bin}/wine || exit 1

    cp -r /${_jlc}/${_pc}/config "$HOME"/.${pkgname%-bin}/config || exit 1
    cp -r /${_jlc}/${_pc}/nim_conf "$HOME"/.${pkgname%-bin}/nim_conf || exit 1
    cp -r /${_jlc}/ttffont.reg "$HOME"/.${pkgname%-bin}/wine || exit 1

    ln -s /${_jlc}/${_pc}/${_pc}.Launcher.exe "$HOME"/.${pkgname%-bin}/${pkgname/-bin/-launcher} || exit 1
#     ln -s -T /${_jlc}/${_pc}/*.exe "$HOME"/.${pkgname%-bin} || exit 1
#     ln -s -T /${_jlc}/${_pc}/*.dll "$HOME"/.${pkgname%-bin} || exit 1
#     ln -s -T /${_jlc}/${_pc}/*.bin "$HOME"/.${pkgname%-bin} || exit 1
#     ln -s -T /${_jlc}/${_pc}/*.pak "$HOME"/.${pkgname%-bin} || exit 1
#     ln -s -T /${_jlc}/${_pc}/*.ico "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${_jlc}/${_pc}/*.exe "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${_jlc}/${_pc}/*.dll "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${_jlc}/${_pc}/*.bin "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${_jlc}/${_pc}/*.pak "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${_jlc}/${_pc}/*.ico "$HOME"/.${pkgname%-bin} || exit 1

    ln -s -T /${_jlc}/${_pc}/loaderr "$HOME"/.${pkgname%-bin}/loaderr || exit 1
    ln -s -T /${_jlc}/${_pc}/locales "$HOME"/.${pkgname%-bin}/locales || exit 1
    ln -s -T /${_jlc}/${_pc}}/ppflash "$HOME"/.${pkgname%-bin}/ppflash || exit 1
    ln -s -T /${_jlc}/${_pc}}/skin "$HOME"/.${pkgname%-bin}/skin || exit 1


fi

if [ ! -f "$HOME"/.${pkgname%-bin}/fontok ] ; then
    touch "$HOME"/.${pkgname%-bin}/fontok || exit 1
    cd "$HOME"/.${pkgname%-bin}/wine && regedit ttffont.reg
fi

if [ ! -f "$HOME"/.${pkgname%-bin}/fontok ] ; then
    touch "$HOME"/.${pkgname%-bin}/fontok || exit 1
    cd "$HOME"/.${pkgname%-bin}/wine && regedit ttffont.reg
fi

# if [ ! -f "$HOME"/.${pkgname%-bin}/mono ] ; then
#     touch "$HOME"/.${pkgname%-bin}/mono || exit 1
#     wine start /i /usr/share/wine/mono/wine-mono-*.msi
# fi

wine "$HOME"/.${pkgname%-bin}/${pkgname/-bin/-launcher} "$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname/-bin/-launcher}.desktop" << EOF
[Desktop Entry]
Name=${pkgname/-bin/-launcher}
Name[zh_CN]=嘉立创下单桌面助手
Comment=嘉立创下单桌面助手
Exec=${pkgname/-bin/-launcher} %f
Type=Application
StartupNotify=true
Categories=Tool;
Terminal=false
Icon=${pkgname%-bin}.png
Version=${pkgver}
EOF
}
