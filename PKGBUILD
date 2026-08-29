# Maintainer:  Rubin Simons <me@rubin55.org>

_sdk=10.0
_name="FsAutoComplete"
pkgname="${_name,,}"
pkgver=0.84.0
pkgrel=1
pkgdesc="F# language server using Language Server Protocol (LSP)"
arch=('any')
url="https://ionide.io/Tools/fsac.html"
_url="https://github.com/ionide/${_name}"
license=('Apache-2.0')
# FsAutoComplete drives MSBuild to load projects, so it needs the SDK, not
# just the runtime.
depends=("dotnet-sdk-${_sdk}" 'sh')
makedepends=("dotnet-sdk-${_sdk}")
conflicts=("${pkgname}-bin")
source=("${pkgname}-${pkgver}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8a79ded3bdd9da84663893c33cb44126b80dd68386c711ddc31197538ecc7616')

_dotnet_env() {
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_NOLOGO=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
    export DOTNET_ROLL_FORWARD_TO_PRERELEASE=1
    export DOTNET_ROLL_FORWARD=Major
    export BuildNet10=true
    export DOTNET_CLI_HOME="${srcdir}/.dotnet-home"
    export NUGET_PACKAGES="${srcdir}/.nuget"
    export PATH="${DOTNET_CLI_HOME}/.dotnet/tools:${PATH}"
}

build() {
    cd "${_name}-${pkgver}"
    _dotnet_env

    dotnet tool restore
    dotnet publish src/${_name}/${_name}.fsproj \
        --configuration Release \
        --framework "net${_sdk}" \
        --output "${srcdir}/publish"
}

check() {
    cd "${_name}-${pkgver}"
    _dotnet_env

    dotnet test test/${_name}.Tests.Lsp/${_name}.Tests.Lsp.fsproj \
        --configuration Release \
        --framework "net${_sdk}" \
        --logger "console;verbosity=normal"
}

package() {
    cd "${_name}-${pkgver}"

    install -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r --no-preserve=ownership "${srcdir}/publish/." "${pkgdir}/usr/lib/${pkgname}/"

    install -d "${pkgdir}/usr/bin"
    printf '#!/bin/sh\n\nexec dotnet /usr/lib/%s/%s.dll "$@"\n' "${pkgname}" "${pkgname}" \
        > "${pkgdir}/usr/bin/${pkgname}"
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
