# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libcdio-git
pkgver=2.0.0.r53.g1be3d348
pkgrel=1
pkgdesc="Library for CD-ROM and CD image access"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/libcdio/"
license=('GPL3')
depends=('glibc' 'libcddb')
makedepends=('git' 'help2man')
provides=('libcdio')
conflicts=('libcdio')
options=('staticlibs')
source=("git+https://git.savannah.gnu.org/git/libcdio.git")
sha256sums=('SKIP')


pkgver() {
  cd "libcdio"

  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libcdio"

  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --enable-maintainer-mode \
    --disable-example-progs
  make
}

check() {
  cd "libcdio"

  make check
}

package() {
  cd "libcdio"

  make DESTDIR="$pkgdir" install

  sed -i "/LIBCDIO_SOURCE_PATH/s|.*|/* #undef LIBCDIO_SOURCE_PATH */|" \
    "$pkgdir/usr/include/cdio/cdio_config.h"
}
