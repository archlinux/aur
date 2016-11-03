# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Sven Greiner <sven@sammyshp.de>
# Contributor: vldmr <vldmr@lavabit.com>
# Contributor: Thomas Krug <phragment@lavabit.com>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=libfprint-git
epoch=1
pkgver=0.6.0.r34.g12f6dae
pkgrel=2
pkgdesc="Library for fingerprint readers"
arch=(i686 x86_64)
url="http://www.freedesktop.org/wiki/Software/fprint/libfprint"
license=(LGPL)
depends=(libusb nss pixman)
makedepends=(git)
optdepends=("vfs495-daemon: proprietary driver daemon for VFS495 fingerprint readers")
groups=(fprint-git)
provides=(libfprint)
conflicts=(libfprint)
source=("git://anongit.freedesktop.org/libfprint/libfprint.git"
        "validity-sensor.patch")
md5sums=('SKIP'
         'b5a26aaa401b41fcc9ba4d8b717189c3')

pkgver() {
  cd libfprint

  git describe --long --tags 2>/dev/null | sed 's/^V_//;s/\([0-9]*-g\)/r\1/;s/[-_]/./g'
}

prepare() {
  cd libfprint

  git apply -3 "$srcdir/validity-sensor.patch"

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd libfprint

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --disable-static
  make
}

package() {
  cd libfprint

  make DESTDIR="$pkgdir" install
}
