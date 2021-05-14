# Maintainer: Tobias Markus < tobias AT miglix DOT eu >
# Contributor: Nils Czernia <nils[at]czserver.de>
# Contributor: Víctor Martínez Romanos <vmromanos@gmail.com>

pkgname=qucs-qt5-git
pkgver=r4548.b4b88f164
pkgrel=1
pkgdesc="An integrated circuit simulator with a graphical user interface - modular branch"
arch=('x86_64')
url="http://qucs.sourceforge.net"
license=('GPL3')
depends=('gcc-libs' 'qt5-base' 'qt5-script' 'qt5-svg' 'hicolor-icon-theme' 'qcustomplot')
makedepends=('git' 'gperf')
optdepends=(
    'freehdl: digital circuit simulation'
    'qucsator: circuit simulation'
#   'asco: circuit optimization'
    'perl'
  )
source=(
  'git+https://github.com/Qucs/qucs.git#branch=modular'
)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/qucs"

    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
	cd "$srcdir/qucs"

    ./bootstrap
}

build() {
    cd "$srcdir/qucs"

    ./configure --prefix=/usr
    make RCC=/usr/bin/rcc-qt5
}

package() {
    cd "$srcdir/qucs"

    make DESTDIR="$pkgdir" install
}

# vim: ts=4:sw=4:expandtab
