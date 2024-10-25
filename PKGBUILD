# Maintainer: devome <evinedeng@hotmail.com>

_netver=6.0
_reponame=SyncClipboard
_pkgname="${_reponame,,}"
pkgname="${_pkgname}-server"
pkgver=2.8.6
pkgrel=1
pkgdesc="Cross-Platform Cipboard Syncing Solution (Server)"
arch=("x86_64" "i686" "aarch64")
url="https://github.com/Jeric-X/${_reponame}"
license=("MIT")
depends=("aspnet-runtime-${_netver}")
makedepends=("dotnet-sdk-${_netver}")
backup=("etc/${_pkgname}/"appsettings{,.Development}.json)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_pkgname}.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
sha256sums=('86ec9ad907d2432d3250a95794147e8b6e639d80e27ed023b2d8913388212992'
            '39543906762fa52358b57f8450e57d007c860c862e400a839e72f0e5b6fa44ef'
            'c926ecd545f945ac27cf4b2e54004f0d6847d58f012b9dda5b4e8416523e991c'
            'bf6ce00dbedafc8b2874818138c37d8371cb165721c5b88293c64f216cee1c66')

build() {
    cd "${_reponame}-${pkgver}"

    ## build server
    echo "Build server..."
    rm -rf server appsettings* &>/dev/null
    dotnet restore "src/${_reponame}.Server"
    dotnet publish "src/${_reponame}.Server/${_reponame}.Server.csproj" --configuration Release --no-restore
    cp -r "src/${_reponame}.Server/bin/Release/net${_netver}/publish" server
    mv server/appsettings* .
}

package() {
    install -Dm644 "${_pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

    cd "${_reponame}-${pkgver}"
    install -Dm644 *.md docs/*.md      -t "${pkgdir}/usr/share/doc/${_pkgname}-server"
    install -Dm644 LICENSE                "${pkgdir}/usr/share/licenses/${_pkgname}-server/LICENSE"
    install -Dm644 appsettings*.json   -t "${pkgdir}/etc/${_pkgname}"
    install -dm755 "${pkgdir}/usr/"{bin,share/"${_pkgname}"}
    cp -r --preserve=mode server          "${pkgdir}/usr/share/${_pkgname}/server"
    ln -sf "/usr/share/${_pkgname}/server/${_reponame}.Server" "${pkgdir}/usr/bin/${_pkgname}-server"
}
