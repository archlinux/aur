# Maintainer: taotieren <admin@taotieren.com>

pkgname=n-m3u8dl-re-git
pkgver=0.3.0.beta.r5.gcd4dfb5
pkgrel=1
epoch=
pkgdesc="Cross-Platform, beautiful and powerful stream downloader for DASH/HLS."
arch=("x86_64" "aarch64")
url="https://github.com/nilaoda/N_m3u8DL-RE"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=()
makedepends=(
    curl
    zlib
    krb5
    git
    'dotnet-runtime>=9.0.0'
    'dotnet-sdk>=9.0.0'
)
backup=()
options=('!strip' '!debug' '!lto')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
noextract=()

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx

    # cd "${srcdir}/${pkgname}"
    # sed -i 's|net8.0|net7.0|g' src/N_m3u8DL-RE/N_m3u8DL-RE.csproj
}

build() {
    # DOTNET_CLI_TELEMETRY_OPTOUT=1

    cd "${srcdir}/${pkgname}"

    if [ "$CARCH" == "aarch64" ]; then
        msg2 "build for arm64"
        dotnet publish src/N_m3u8DL-RE -r linux-arm64 -c Release -p:CppCompilerAndLinker=clang-9 -p:SysRoot=/crossrootfs/arm64 -p:PublishTrimmed=true --self-contained true -p:DebugType=None -p:DebugSymbols=false -o artifact
    else
        msg2 "build for x64"
        dotnet publish src/N_m3u8DL-RE -r linux-x64 -c Release -p:PublishTrimmed=true --self-contained true -p:DebugType=None -p:DebugSymbols=false -o artifact
    fi
}

package() {
    cd "${srcdir}/${pkgname}/artifact/"
    install -Dm0755 N_m3u8DL-RE "${pkgdir}/usr/bin/${pkgname%-git}"
}
