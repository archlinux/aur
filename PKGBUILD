# Maintainer: taotieren <admin@taotieren.com>

pkgname=airisp-git
pkgver=1.2.7.0.r0.g914c259
pkgrel=1
epoch=
pkgdesc="An ISP tool for Air MCU"
arch=("x86_64" "aarch64")
url="https://github.com/Air-duino/AirISP"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=()
makedepends=(git
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

build() {
DOTNET_CLI_TELEMETRY_OPTOUT=1

    cd "${srcdir}/${pkgname%-git}"

#     sed -i 's|net8.0|net7.0|g' AirISP/AirISP.csproj
    if [ "$CARCH" == "aarch64" ]; then
    msg2 "build for arm64"
    dotnet publish AirISP -r linux-arm64 -c Release -p:PublishSingleFile=true -p:PublishTrimmed=true --self-contained true -o artifact
    else
    msg2 "build for x64"
    dotnet publish AirISP -r linux-x64 -c Release -p:PublishSingleFile=true -p:PublishTrimmed=true --self-contained true -o artifact
    fi
}

package() {
    cd "${srcdir}/${pkgname%-git}/artifact/"
    install -Dm0755 AirISP "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
