pkgname=tuc-console
pkgver=1.8.0 # renovate: datasource=github-releases depName=TypedUseCase/tuc-console
pkgrel=1
pkgdesc="Console application for the TUC language, which generates PlantUML diagrams for use cases from a type-safe domain model."
arch=('x86_64')
url="https://github.com/TypedUseCase/tuc-console"
license=('MIT')
provides=('tuc')
conflicts=('tuc' 'tuc-console-bin')
depends=('dotnet-runtime>=10.0' 'icu' 'openssl' 'krb5')
makedepends=('dotnet-sdk>=10.0' 'git')
options=('!strip' '!debug')
source=()
sha256sums=()

prepare() {
    rm -rf "${srcdir:?}/${pkgname}"
    git clone --depth 1 --branch "${pkgver}" "${url}.git" "${srcdir}/${pkgname}"
}

build() {
    cd "${srcdir}/${pkgname}"

    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_NOLOGO=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1

    # Generates AssemblyInfo.fs, which Program.fs references via the
    # AssemblyVersionInformation module. dotnet publish restores and builds itself.
    ./build.sh AssemblyInfo

    # --no-self-contained: run against the dotnet-runtime dependency at runtime.
    # DebugType=none: no .pdb, so the assembly carries no embedded $srcdir path.
    dotnet publish TucConsole.fsproj \
        --configuration Release \
        --no-self-contained \
        --output publish \
        -p:DebugType=none \
        -p:DebugSymbols=false
}

package() {
    local _libdir="${pkgdir}/usr/lib/${pkgname}"

    install -d "${_libdir}"
    cp -r "${srcdir}/${pkgname}/publish/." "${_libdir}/"

    rm -f "${_libdir}/"*.pdb

    chmod 755 "${_libdir}/TucConsole"

    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/TucConsole" "${pkgdir}/usr/bin/tuc"

    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
