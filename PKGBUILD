# Maintainer: devome <evinedeng@hotmail.com>

_dotnet_ver=8.0
_reponame=SyncClipboard
_pkgname="${_reponame,,}"
pkgname="${_pkgname}-server"
pkgver=3.1.6
pkgrel=1
pkgdesc="Cross-Platform Cipboard Syncing Solution (Server)"
arch=("x86_64" "aarch64")
url="https://github.com/Jeric-X/${_reponame}"
license=("MIT")
depends=("aspnet-runtime-${_dotnet_ver}")
makedepends=("dotnet-sdk-${_dotnet_ver}")
backup=("etc/${_pkgname}/"appsettings{,.Development}.json)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_pkgname}.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
sha256sums=('0b712cb685f37ac7cc95007dd12ed6e46fafa32b01af452aef57a04ba39b4708'
            '9c199944b31282e093bcb530f3c81b624970bae515f08fb1b5614b6ab8c973e9'
            'c926ecd545f945ac27cf4b2e54004f0d6847d58f012b9dda5b4e8416523e991c'
            'bf6ce00dbedafc8b2874818138c37d8371cb165721c5b88293c64f216cee1c66')

build() {
    cd "${_reponame}-${pkgver}"

    rm -rf builddir appsettings* &>/dev/null
    dotnet restore "src/${_reponame}.Server"
    dotnet publish "src/${_reponame}.Server/${_reponame}.Server.csproj" \
        --no-restore \
        --configuration Release \
        --framework "net${_dotnet_ver}" \
        --self-contained false \
        --output builddir \
        -p:DebugSymbols=false \
        -p:DebugType=none
    mv builddir/appsettings* .

    case $CARCH in
        x86_64)  find builddir/runtimes -mindepth 1 -maxdepth 1 -type d ! -name 'linux-x64' -exec rm -rf {} + ;;
        aarch64) find builddir/runtimes -mindepth 1 -maxdepth 1 -type d ! -name 'linux-arm64' -exec rm -rf {} + ;;
    esac
}

package() {
    local _binary="/usr/lib/${_pkgname}/server/${_reponame}.Server"

    install -Dm644 "${_pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

    cd "${_reponame}-${pkgver}"
    install -Dm644 *.md docs/*.md      -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 LICENSE                "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 appsettings*.json   -t "${pkgdir}/etc/${_pkgname}"

    cd builddir
    find -type f -exec install -Dm644 {}  "${pkgdir}/usr/lib/${_pkgname}/server/"{} \;
    install -dm755                        "${pkgdir}/usr/bin"
    ln -sf "${_binary}"                   "${pkgdir}/usr/bin/${pkgname}"
    chmod 755 "${pkgdir}${_binary}"
}
