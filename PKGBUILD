# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=libirecovery
pkgver=1.1.0
pkgrel=1
pkgdesc="Library and utility to talk to iBoot/iBSS via USB"
arch=('x86_64')
url="https://libimobiledevice.org/"
license=('LGPL2.1')
depends=('libimobiledevice-glue' 'libusb' 'readline')
# systemd is needed to build udev rules and is not in base-devel
makedepends=('systemd')
source=("https://github.com/libimobiledevice/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('ee3b1afbc0cab5309492cfcf3e132c6cc002617a57664ee0120ae918318e25f9')

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
