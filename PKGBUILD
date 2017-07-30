# Maintainer: Andrei Alexeyev <akari@alienslab.net>

pkgname=('rexuiz-dlc-essential-git' 'rexuiz-dlc-extra-git')
pkgbase='rexuiz-dlc-git'
pkgver=r10.0ae1815
pkgrel=1
arch=('any')
pkgdesc="An updated fork of Nexuiz, a fast-paced multiplayer first-person shooter (downloadable content)."
url="http://rexuiz.top/"
license=("GPL2")
depends=()
makedepends=('zip')
optdepends=()
conflicts=('rexuiz-dlc')
provides=('rexuiz-dlc')
source=("git+https://github.com/kasymovga/rexdlc")
sha256sums=('SKIP')

# Prevent compressing final package
PKGEXT='.pkg.tar'

package_rexuiz-dlc-essential-git() {
    pkgdesc="An updated fork of Nexuiz, a fast-paced multiplayer first-person shooter (downloadable content - essential)."
    conflicts=('rexuiz-dlc-essential')
    provides=('rexuiz-dlc-essential')

    _package_subset essential
}

package_rexuiz-dlc-extra-git() {
    pkgdesc="An updated fork of Nexuiz, a fast-paced multiplayer first-person shooter (downloadable content - extra)."
    conflicts=('rexuiz-dlc-extra')
    provides=('rexuiz-dlc-extra')

    _package_subset extra
}

build() {
    cd "${srcdir}/rexdlc"
    rm -f zzz-rexdlc_*.pk3

    _build_subset essential
    _build_subset extra
}

_build_subset() {
    local subsetdir="${srcdir}/subset_$1"
    rm -rf "$subsetdir"
    mkdir "$subsetdir"
    make "$1"
    mv zzz-rexdlc_*.pk3 "$subsetdir"
}

_package_subset() {
    cd "${srcdir}/subset_$1"
    install -m755 -d "${pkgdir}/usr/share/rexuiz/data/dlcache/"
    install -m644 zzz-rexdlc_*.pk3 "${pkgdir}/usr/share/rexuiz/data/dlcache/"
}

pkgver() {
    cd "${srcdir}/rexdlc"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
