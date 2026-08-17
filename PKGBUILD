# Maintainer: Rubin Simons <me@rubin55.org>

_sdk=10.0
pkgname='dev-proxy'
pkgver=3.2.0
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Simulate API failures, throttling, and chaos, all from your command line"
arch=('x86_64')
url="https://github.com/dotnet/dev-proxy"
license=('MIT')
depends=("dotnet-runtime-${_sdk}" "aspnet-runtime-${_sdk}" 'gcc-libs' 'glibc')
makedepends=("dotnet-sdk-${_sdk}")
conflicts=('dev-proxy-bin')
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('c9c2c85e1543aecc81fbc0f4f3c8fb93719319c0d00f6138c440bfc37d552a70')

_dotnet_env() {
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_NOLOGO=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
    export DOTNET_CLI_HOME="${srcdir}/.dotnet-home"
    export NUGET_PACKAGES="${srcdir}/.nuget"
}

build() {
    cd "${pkgname}-${_pkgver}"
    _dotnet_env

    dotnet publish ./DevProxy/DevProxy.csproj \
        --configuration Release \
        --runtime linux-x64 \
        --self-contained false \
        -p:PublishSingleFile=false \
        -p:InformationalVersion="${_pkgver}" \
        -p:ContinuousIntegrationBuild=true \
        --output "${srcdir}/publish"

    dotnet build ./DevProxy.Plugins/DevProxy.Plugins.csproj \
        --configuration Release \
        --runtime linux-x64 \
        --no-self-contained \
        -p:InformationalVersion="${_pkgver}" \
        -p:ContinuousIntegrationBuild=true

    cp -r ./DevProxy/bin/Release/net10.0/linux-x64/plugins "${srcdir}/publish/"

    # Same cleanup the upstream release pipeline does.
    find "${srcdir}/publish" \
        \( -name '*.deps.json' -o -name '*.staticwebassets.endpoints.json' \
        -o -name 'web.config' \) -delete
}

check() {
    cd "${pkgname}-${_pkgver}"
    _dotnet_env

    # Upstream has no test suite yet, so only smoke test the built executable.
    "${srcdir}/publish/devproxy" --version
}

package() {
    cd "${pkgname}-${_pkgver}"

    install -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r --no-preserve=ownership "${srcdir}/publish/." "${pkgdir}/usr/lib/${pkgname}/"
    chmod 755 "${pkgdir}/usr/lib/${pkgname}/devproxy" \
              "${pkgdir}/usr/lib/${pkgname}"/*.sh

    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/devproxy" "${pkgdir}/usr/bin/devproxy"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
