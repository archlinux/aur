# Maintainer: taotieren <admin@taotieren.com>

pkgname=n-m3u8dl-re-git
pkgver=0.2.0.beta.r24.g8fdb6bc
pkgrel=2
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
    dotnet-host
    dotnet-sdk)
backup=()
options=('!strip')
install=
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')
noextract=()

pkgver(){
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# prepare() {
#     cd "${srcdir}/${pkgname%-git}"
#     sed -i 's|net8.0|net7.0|g' src/N_m3u8DL-RE/N_m3u8DL-RE.csproj
# }

build() {
# DOTNET_CLI_TELEMETRY_OPTOUT=1

    cd "${srcdir}/${pkgname%-git}"

    if [ "$CARCH" == "aarch64" ]; then
        msg2 "build for arm64"
        dotnet publish src/N_m3u8DL-RE -r linux-arm64 -c Release -p:CppCompilerAndLinker=clang-9 -p:SysRoot=/crossrootfs/arm64 -p:PublishTrimmed=true --self-contained true -p:DebugType=None -p:DebugSymbols=false -o artifact
    else
        msg2 "build for x64"
        dotnet publish src/N_m3u8DL-RE -r linux-x64 -c Release -p:PublishTrimmed=true --self-contained true -p:DebugType=None -p:DebugSymbols=false -o artifact
    fi
}

package() {
    cd "${srcdir}/${pkgname%-git}/artifact/"
    install -Dm0755 N_m3u8DL-RE "${pkgdir}/usr/bin/${pkgname%-git}"
}
