# Maintainer: Paul Stoetzer <n8hm at arrl.net>

pkgname=libfprint-elantech-git
_pkgname=libfprint
pkgver=r352.8d2c931
pkgrel=1
pkgdesc="A fork of libfprint with ElanTech fingerprint reader driver"
arch=(x86_64)
url="https://github.com/iafilatov/libfprint"
license=(LGPL)
depends=(libusb nss pixman glib2)
makedepends=(git meson gtk-doc)
conflicts=(libfprint)
provides=(libfprint)
source=(git+https://github.com/iafilatov/libfprint.git)
md5sums=(SKIP)

pkgver() {
  cd libfprint
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  meson ../libfprint --prefix /usr -D x11-examples=false -D doc=false # FIXME: documentation doesn't build:
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
  mkdir "$pkgdir/usr/include/libfprint"
  ln -s /usr/include/fprint.h "$pkgdir/usr/include/libfprint/fprint.h"
}
