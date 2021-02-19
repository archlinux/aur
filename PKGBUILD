# Maintainer: Tobias Markus < tobias AT miglix DOT eu >
# Contributor: Nils Czernia <nils[at]czserver.de>
# Contributor: Víctor Martínez Romanos <vmromanos@gmail.com>

pkgname=qucs-qt5-git
pkgver=0.0.20.rc1.r666.g99db53e97
pkgrel=1
pkgdesc="An integrated circuit simulator with a graphical user interface - experimental qt5 branch"
arch=('x86_64')
url="http://qucs.sourceforge.net"
license=('GPL')
depends=('gcc-libs' 'qt5-base' 'qt5-script' 'qt5-svg' 'adms' 'hicolor-icon-theme')
makedepends=('git' 'gperf')
optdepends=('freehdl: to permit digital circuit simulation'
#	    'asco: to enable circuit optimization'
	    'perl')
source=(
  'git+https://github.com/Qucs/qucs.git#branch=refactor+qt5-19'
  'git+https://github.com/Qucs/qucs-test.git'
  'git+https://github.com/Qucs/qucsator.git'
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/qucs"

    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
	cd "$srcdir/qucs"

	git submodule init
	git config submodule.qucs-test.url $srcdir/qucs-test
	git config submodule.qucsator.url $srcdir/qucsator
	git submodule update

    # Upstream renamed qucs-core to qucsator, but forgot the bootstrap script...
    sed -i 's/qucs-core/qucsator/g' bootstrap

    ./bootstrap
}

build() {
    cd "$srcdir/qucs"

    ./configure --prefix=/usr --disable-doc
    make RCC=/usr/bin/rcc-qt5
}

package() {
    cd "$srcdir/qucs"

    make DESTDIR="$pkgdir" install
}

# vim: ts=4:sw=4:expandtab
