# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=libirecovery
pkgver=1.2.0
pkgrel=1
pkgdesc="Library and utility to talk to iBoot/iBSS via USB"
arch=('x86_64')
url="https://libimobiledevice.org/"
license=('LGPL-2.1-only')
depends=('libimobiledevice-glue' 'libusb' 'readline')
# systemd is needed to build udev rules and is not in base-devel
makedepends=('systemd')
source=("https://github.com/libimobiledevice/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('74448348f8a68b654015fe1952fdc4e0781db20dcf4e1d85ec97d6f91e95eb14')

prepare() {
  cd "$pkgname-$pkgver"

  # don't overlink to libplist-2.0.so
  sed -Ei 's/(\$\(limd_glue_LIBS)\)/\1:-lplist-2.0=)/' src/Makefile.{am,in}
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
