# Maintainer: taotieren <admin@taotieren.com>

pkgbase=hypersploit
pkgname=hypersploit
pkgver=1.1.0
pkgrel=0
epoch=
pkgdesc="Bypasses HyperOS restrictions on bootloader unlocking"
arch=($CARCH)
url="https://github.com/TheAirBlow/HyperSploit"
license=('MPL-2.0')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(glibc)
makedepends=(
    git
    dotnet-sdk
)
backup=()
options=(!strip !debug)
install=
source=("${pkgbase}::git+${url}.git#tag=${pkgver}")
sha256sums=('93a70f204d1fc96cc51b0fd24286704e89c5e6ff4086dc08e0df4164221f8e79')
noextract=()

build() {
    cd "${srcdir}/${pkgname}"

    if [ "$CARCH" == "aarch64" ]; then
        msg2 "build for arm64"
        dotnet publish -r linux-arm64 -c Release -p:PublishSingleFile=true -p:PublishTrimmed=true --self-contained true -p:DebugType=None -p:DebugSymbols=false -o artifact
    else
        msg2 "build for x64"
        dotnet publish -r linux-x64 -c Release -p:PublishSingleFile=true -p:PublishTrimmed=true --self-contained true -p:DebugType=None -p:DebugSymbols=false -o artifact
    fi
}

package() {
    cd "${srcdir}/${pkgname}/"
    install -vDm644 "LICENCE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    cd "${srcdir}/${pkgname}/artifact/"
    install -Dm0755 HyperSploit "${pkgdir}/usr/bin/${pkgname}"
}
