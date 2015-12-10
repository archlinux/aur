# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Vincenzo Maffione <v.maffione@gmail.com>
pkgname=fspcc
pkgver=r514.6f4a84a
pkgrel=1
pkgdesc="An FSP compiler and LTS analysis tool"
arch=('any')
license=('GPL3')
groups=()
depends=('bash')
optdepends=('graphviz: visualizing compiled LTS' 'xv: visualizing compiled LTS')
makedepends=('git')
source=("git+https://github.com/vmaffione/fspc.git")
md5sums=("SKIP")

_swname=fspc

pkgver() {
        cd "$srcdir/${_swname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_swname}"
    autoreconf --install
    ./configure || return 1
    make OPTIMIZE=-O2 || return 1 
}

package() {
    cd "$srcdir/${_swname}/src"
    mkdir -p "$pkgdir/usr/bin"
    cp fspcc "$pkgdir/usr/bin"
    cp ltsee "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/man/man1"
    cp fspcc.1 "$pkgdir/usr/share/man/man1"
    gzip "$pkgdir/usr/share/man/man1/fspcc.1"
}

# vim:set ts=2 sw=2 et:
