# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: Peter Vágner <pvdeejay@jabber.cz>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=pyatspi-git
pkgname=(python-atspi-git python2-atspi-git)
pkgver=2.26.0+0+g813ba13
pkgrel=1
arch=('any')
url="https://gitlab.gnome.org/GNOME/pyatspi2"
license=('GPL2')
makedepends=('python-gobject' 'python2-gobject' 'at-spi2-core' 'gnome-common' 'git')

_commit=813ba139a46c071103efd45ec65481213974f07f  # tags/PYATSPI_2_26_0^0
source=("git+https://gitlab.gnome.org/GNOME/pyatspi2.git#commit=$_commit"
  "async-fix.diff")
sha256sums=('SKIP'
            'ab4f8acf08e4661bbb0388995dcb45e4e103b59b16fcdd8a77b097722ebb1893')

pkgver() {
  cd pyatspi2
  ( set -o pipefail
    git describe --long --tags | sed 's/^PYATSPI_//;s/_/./g;s/-/+/g' ||
    printf "r.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  mkdir -p python2 python3
  cd pyatspi2
  patch -p1 < ../async-fix.diff
  NOCONFIGURE=1 ./autogen.sh
}

_build() (
  cd python$1
  ../pyatspi2/configure --prefix=/usr --with-python=/usr/bin/python$1
  make
)

build() {
  _build 2
  _build 3
}

package_python-atspi-git() {
  pkgdesc="Python 3 bindings for at-spi"
  depends=(python-gobject at-spi2-core)
  provides=(python-atspi)
  conflicts=(python-atspi)

  cd python3
  make DESTDIR="$pkgdir" install
}

package_python2-atspi-git() {
  pkgdesc="Python 2 bindings for at-spi"
  depends=(python2-gobject at-spi2-core)
  provides=(python2-atspi)
  conflicts=(python2-atspi)

  cd python2
  make DESTDIR="$pkgdir" install
}
