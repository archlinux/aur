# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=codegraph-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="Pre-indexed code knowledge graph for AI coding assistants — fewer tokens, fewer tool calls, 100% local"
arch=('x86_64' 'aarch64')
url="https://github.com/colbymchenry/codegraph"
license=('MIT')
depends=('bash' 'glibc' 'libgcc' 'libstdc++.so')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')

_urlbase="https://github.com/colbymchenry/codegraph/releases/download/v${pkgver}"
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/colbymchenry/codegraph/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_urlbase}/codegraph-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_urlbase}/codegraph-linux-arm64.tar.gz")
sha256sums=('e6d98f98c666bebe065ac2492a0a19232cc318d4d67bac3ca42ffb77bacc8809')
sha256sums_x86_64=('767c112faf8175a3dd768defc1688203fef459de29c4b52c02e16a472b8f5d26')
sha256sums_aarch64=('3e31bfd645416ab4e34516a9fe444a907132b3527b18889c877148219cdcc966')

latestver() {
    curl -fsSL "https://api.github.com/repos/colbymchenry/codegraph/releases/latest" |
        jq -r '.tag_name // empty' | sed 's/^v//'
}

package() {
    local _archdir
    case "${CARCH}" in
        x86_64)  _archdir="codegraph-linux-x64" ;;
        aarch64) _archdir="codegraph-linux-arm64" ;;
    esac

    install -d "${pkgdir}/usr/lib/codegraph"
    cp -a "${srcdir}/${_archdir}"/{node,lib} "${pkgdir}/usr/lib/codegraph/"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/codegraph" <<'WRAPPER'
#!/bin/sh
exec /usr/lib/codegraph/node /usr/lib/codegraph/lib/dist/bin/codegraph.js "$@"
WRAPPER

    # Remove shebangs from bundled JS (vendored node used, not system node)
    find "${pkgdir}/usr/lib/codegraph/lib" -name '*.js' -exec \
        sed -i '1{/^#!.*node/d}' {} +
    find "${pkgdir}/usr/lib/codegraph/lib" -name '*.d.ts' -exec \
        sed -i '1{/^#!.*node/d}' {} +

    # Prune empty directories left by bundled node_modules
    find "${pkgdir}/usr/lib/codegraph/lib/node_modules" -type d -empty -delete

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
