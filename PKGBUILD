# Maintainer: taotieren <admin@taotieren.com>

pkgbase=logicanalyzer-git
pkgname=({logicanalyzer,clcapture}-git)
pkgver=6.0.0.1.r0.g8d63379
pkgrel=2
epoch=
pkgdesc="24 channel, 100Msps logic analyzer hardware and software "
arch=($CARCH)
url="https://github.com/gusmanb/logicanalyzer"
license=('GPL-3.0-only')
replaces=()
depends=()
makedepends=(git
    dotnet-sdk
    ttf-dejavu)
backup=()
options=(!strip !debug)
install=
source=("${pkgbase}::git+${url}.git")
sha256sums=('SKIP')
noextract=()

pkgver() {
    cd "${srcdir}/${pkgbase}"
    git describe --long --tags | sed 's/^[vV]//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    #     cd "${srcdir}/${pkgname-git}/Software/LogicAnalyzer"
    #
    #     if [ "$CARCH" == "aarch64" ]; then
    #     msg2 "build for arm64"
    #         dotnet publish  -r linux-arm64 -c Release -o artifact
    #     else
    #     msg2 "build for x64"
    #         dotnet publish  -r linux-x64 -c Release -o artifact
    #     fi

    #first step, prepare the structure
    mkdir -pv "${srcdir}/${pkgbase}/Software/LogicAnalyzer/artifact/LogicAnalyzer/analyzers"
    mkdir -pv "${srcdir}/${pkgbase}/Software/LogicAnalyzer/artifact/CLCapture"

    if [ "$CARCH" == "aarch64" ]; then
        msg2 "build for arm64"

        # compile LogicAnalyzer
        cd "${srcdir}/${pkgbase}/Software/LogicAnalyzer/LogicAnalyzer"
        dotnet publish -r linux-arm64 -c Release --self-contained true -p:DebugType=None -p:DebugSymbols=false -o "${srcdir}/${pkgbase}/Software/LogicAnalyzer/artifact/LogicAnalyzer"

        # compile CLCapture
        cd "${srcdir}/${pkgbase}/Software/LogicAnalyzer/CLCapture"
        dotnet publish -r linux-arm64 -c Release -p:PublishSingleFile=true -p:PublishTrimmed=true --self-contained true -p:DebugType=None -p:DebugSymbols=false -o "${srcdir}/${pkgbase}/Software/LogicAnalyzer/artifact/CLCapture"
    else
        msg2 "build for x64"
        # compile LogicAnalyzer
        cd "${srcdir}/${pkgbase}/Software/LogicAnalyzer/LogicAnalyzer"
        dotnet publish -r linux-x64 -c Release --self-contained true -p:DebugType=None -p:DebugSymbols=false -o "${srcdir}/${pkgbase}/Software/LogicAnalyzer/artifact/LogicAnalyzer"

        # compile CLCapture
        cd "${srcdir}/${pkgbase}/Software/LogicAnalyzer/CLCapture"
        dotnet publish -r linux-x64 -c Release -p:PublishSingleFile=true -p:PublishTrimmed=true --self-contained true -p:DebugType=None -p:DebugSymbols=false -o "${srcdir}/${pkgbase}/Software/LogicAnalyzer/artifact/CLCapture"
    fi
}

package_logicanalyzer-git() {
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})

    cd "${srcdir}/${pkgbase}/Software/LogicAnalyzer/artifact/"

    #     install -Dm0755 LogicAnalyzer/LogicAnalyzer "${pkgdir}/usr/bin/logicanalyzer"

    install -dm0755 ${pkgdir}/usr/share/${pkgname%-git}

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-git}" <<EOF
export COREHOST_TRACE=1

cd /usr/share/logicanalyzer/
LC_ALL=C ./LogicAnalyzer
EOF

    cp -rv LogicAnalyzer/* ${pkgdir}/usr/share/${pkgname%-git}

    install -Dm644 "$srcdir/logicanalyzer-git/Software/LogicAnalyzer/LogicAnalyzer/Assets/Logo.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png"

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop" <<EOF
[Desktop Entry]
Name=${pkgname%-git}
Name[zh_CN]=${pkgname%-git}
Comment=${pkgdesc}
#MimeType=application/x-${pkgname%-git};
Exec=${pkgname%-git}
Type=Application
Categories=Development;Tool;
Terminal=false
Icon=${pkgname%-git}
Version=1
EOF

}

package_clcapture-git() {
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})

    cd "${srcdir}/${pkgbase}/Software/LogicAnalyzer/artifact/"

    install -Dm0755 CLCapture/CLCapture "${pkgdir}/usr/bin/clcapture"
}
