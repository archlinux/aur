pkgname=codemachine-cli-bin
_pkgname=CodeMachine-CLI
pkgver=0.8.0
pkgrel=1
pkgdesc="Multi-agent workflow orchestration CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/moazbuilds/${_pkgname}"
license=('Apache-2.0')
depends=('glibc')
provides=('codemachine-cli')
conflicts=('codemachine-cli')
options=('!strip' '!debug')

source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/moazbuilds/${_pkgname}/v${pkgver}/LICENSE")
source_x86_64=("codemachine-${pkgver}-x86_64::https://github.com/moazbuilds/${_pkgname}/releases/download/v${pkgver}/codemachine-linux-x64")
source_aarch64=("codemachine-${pkgver}-aarch64::https://github.com/moazbuilds/${_pkgname}/releases/download/v${pkgver}/codemachine-linux-arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('014fadbce233b5a5e2e33f643b5040c90d80122213983dd5dcf8aa4bbf4d15f6')
sha256sums_aarch64=('e5fc8a918ebbf9d508157f92d3cd98dc7df0eabf92a3145e8a8462d7b4296e87')

latestver() {
    gh api --paginate repos/moazbuilds/${_pkgname}/releases --jq \
        '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name == "codemachine-linux-x64") and any(.assets[]; .name == "codemachine-linux-arm64")) | .tag_name' |
        head -1 | sed 's/^v//'
}

package() {
    local _src
    case "${CARCH}" in
        x86_64)
            _src="${srcdir}/codemachine-${pkgver}-x86_64"
            ;;
        aarch64)
            _src="${srcdir}/codemachine-${pkgver}-aarch64"
            ;;
    esac

    install -Dm755 "${_src}" "${pkgdir}/usr/bin/codemachine"
    ln -s codemachine "${pkgdir}/usr/bin/cm"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
