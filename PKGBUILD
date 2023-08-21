# Maintainer: taotieren <admin@taotieren.com>

pkgname=logicanalyzer-git
pkgver=5.0.0.0.r1.g5f95102
pkgrel=1
epoch=
pkgdesc="24 channel, 100Msps logic analyzer hardware and software "
arch=("x86_64" "aarch64")
url="https://github.com/gusmanb/logicanalyzer"
license=('GLP-3.0')
provides=(${pkgname%-git} clcapture)
conflicts=(${pkgname%-git} clcapture)
replaces=()
depends=(dotnet-runtime)
makedepends=(git
    dotnet-sdk)
backup=()
options=('!strip')
install=
source=("${pkgname-git}::git+${url}.git")
sha256sums=('SKIP')
noextract=()

pkgver(){
    cd "${srcdir}/${pkgname-git}"
    git describe --long --tags | sed 's/^V//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname-git}/Software/LogicAnalyzer"

    if [ "$CARCH" == "aarch64" ]; then
    msg2 "build for arm64"
    dotnet publish  -r linux-arm64 -c Release -o artifact
    else
    msg2 "build for x64"
    dotnet publish  -r linux-x64 -c Release -o artifact
    fi
}

package() {
    cd "${srcdir}/${pkgname-git}/Software/LogicAnalyzer/artifact/"

#     install -Dm0755 CLCapture "${pkgdir}/usr/share/${pkgname%-git}/CLCapture"
#     install -Dm0644 CLCapture.dll "${pkgdir}/usr/share/${pkgname%-git}/CLCapture.dll"
#     install -Dm0755 LogicAnalyzer "${pkgdir}/usr/share/${pkgname%-git}/LogicAnalyzer"
#     install -Dm0644 LogicAnalyzer.dll "${pkgdir}/usr/share/${pkgname%-git}/LogicAnalyzer.dll"
#     install -Dm0644 LogicAnalyzer.runtimeconfig.json "${pkgdir}/usr/share/${pkgname%-git}/LogicAnalyzer.runtimeconfig.json"

#     install -dm0755 "${pkgdir}/usr/bin" \
       install -dm0755 ${pkgdir}/usr/share/${pkgname%-git}

    install -Dm0755 /dev/stdin  "${pkgdir}/usr/bin/clcapture" <<EOF
export COREHOST_TRACE=1
cd  /usr/share/logicanalyzer/
./CLCapture
EOF

    install -Dm0755 /dev/stdin  "${pkgdir}/usr/bin/${pkgname%-git}" <<EOF
export COREHOST_TRACE=1
cd /usr/share/logicanalyzer/
./LogicAnalyzer
EOF

#     ln -sf /usr/share/${pkgname%-git}/LogicAnalyzer "${pkgdir}/usr/bin/${pkgname%-git}"

    cp -rv * ${pkgdir}/usr/share/${pkgname%-git}

    install -Dm644 "$srcdir/logicanalyzer-git/Software/LogicAnalyzer/LogicAnalyzer/Assets/Logo40.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png"
    install -Dm644 "$srcdir/logicanalyzer-git/Software/LogicAnalyzer/LogicAnalyzer/Assets/window.ico" "$pkgdir/usr/share/pixmaps/clcapture.ico"

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop" << EOF
[Desktop Entry]
Name=${pkgname%-git}
Name[zh_CN]=${pkgname%-git}
Comment=${pkgdesc}
#MimeType=application/x-${pkgname%-git};
Exec=${pkgname%-git} %u
Type=Application
Categories=Development;Tool;
Terminal=false
Icon=${pkgname%-git}
Version=1
EOF
    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/clcapture.desktop" << EOF
[Desktop Entry]
Name=clcapture
Name[zh_CN]=clcapture
Comment=Logic Analyzer Capture
#MimeType=application/x-clcapture;
Exec=clcapture %u
Type=Application
Categories=Development;Tool;
Terminal=false
Icon=clcapture.ico
Version=1
EOF
}
