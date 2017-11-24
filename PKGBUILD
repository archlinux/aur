# $Id$
# Maintainer: Jacob Cantele (asynec) <jccantele49@gmail.com>

pkgname=libfprint-elantech
pkgver=r314.dd5275f
pkgrel=1
pkgdesc="Library for fingerprint readers forked for elantech support"
arch=(x86_64)
url="https://github.com/sbechet/libfprint"
license=(LGPL)
depends=(libusb nss pixman glib2)
makedepends=(git)
groups=(fprint)
conflicts=("libfprint")
_commit=d82847a6b4bbd2864388f2bf8e6a2b9d1aed05c4  # tags/V_0_7_0^0
source=("git+https://github.com/sbechet/libfprint.git")
sha256sums=('SKIP')

pkgver() {
  cd libfprint
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd libfprint
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd libfprint
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd libfprint
  make DESTDIR="$pkgdir" install
}
