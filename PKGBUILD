# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=pupdate
pkgver=5.5.0
pkgrel=1
pkgdesc="Pupdate, a thing for updating your Analogue Pocket"
arch=('x86_64')
url="https://mattpannella.github.io/pupdate"
_url="https://github.com/mattpannella/pupdate"
license=('MIT')
depends=('dotnet-runtime-10.0' 'gcc-libs' 'glibc')
makedepends=('dotnet-sdk-10.0')
conflicts=('pupdate-bin')
source=("${pkgname}-${pkgver}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b2cd311433e53c13b27c6c5c64e316ce0f1b67bd2c4e145966b04c7a93381363')

_dotnet_env() {
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_NOLOGO=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
    export DOTNET_CLI_HOME="${srcdir}/.dotnet-home"
    export NUGET_PACKAGES="${srcdir}/.nuget"
}

build() {
    cd "${pkgname}-${pkgver}"
    _dotnet_env

    dotnet publish pupdate.csproj \
        --configuration Release \
        --runtime linux-x64 \
        --self-contained false \
        -p:PublishSingleFile=false \
        -p:Version="${pkgver}" \
        --output "${srcdir}/publish"
}

check() {
    cd "${pkgname}-${pkgver}"
    _dotnet_env

    dotnet test tests/pupdate.Tests/pupdate.Tests.csproj --configuration Release
}

package() {
    cd "${pkgname}-${pkgver}"

    install -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r --no-preserve=ownership "${srcdir}/publish/." "${pkgdir}/usr/lib/${pkgname}/"
    chmod 755 "${pkgdir}/usr/lib/${pkgname}/${pkgname}"

    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CLI.md "${pkgdir}/usr/share/doc/${pkgname}/CLI.md"
    install -Dm644 MENU.md "${pkgdir}/usr/share/doc/${pkgname}/MENU.md"
}
