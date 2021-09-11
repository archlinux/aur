# Maintainer: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: Peter Vágner <pvdeejay@jabber.cz>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=python-atspi-git
pkgver=2.26.0+7+g9ec63fc
pkgrel=1
pkgdesc="Python 3 bindings for at-spi (with async fixes)"
arch=('any')
url="https://gitlab.gnome.org/GNOME/pyatspi2"
license=('GPL2')
depends=('python-gobject' 'at-spi2-core')
makedepends=('python-gobject' 'gnome-common' 'git')
provides=(python-atspi)
conflicts=(python-atspi)

source=("git+https://gitlab.gnome.org/GNOME/pyatspi2.git")
sha256sums=('SKIP')

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
  NOCONFIGURE=1 ./autogen.sh
}

build() (
  cd python3
  ../pyatspi2/configure --prefix=/usr --with-python=/usr/bin/python3
  make
)

package() {
  cd python3
  make DESTDIR="$pkgdir" install
}
