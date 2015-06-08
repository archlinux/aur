# Maintainer: Sergio Conde <skgsergio@gmail.com>

pkgname=rtl-sdr-keenerd-git
pkgver=20150428
pkgrel=1
pkgdesc="Turns Realtek RTL2832 based DVB dongle into a SDR receiver transferring the raw I/Q samples to the host. Keenerd's experimental fork."
arch=('i686' 'x86_64')
url='https://github.com/keenerd/rtl-sdr'
license=('GPL')
depends=('libusb>=1.0')
makedepends=('git' 'cmake')
provides=('rtl-sdr')
conflicts=('rtl-sdr' 'rtl-sdr-git')
source=('git+https://github.com/keenerd/rtl-sdr.git')
sha256sums=('SKIP')

_gitname="rtl-sdr"

pkgver() {
  cd "$srcdir/$_gitname"
  git show -s --format="%cd" --date=short HEAD | tr -d '-'
}

build() {
  cd "$srcdir/$_gitname"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DDETACH_KERNEL_DRIVER=ON -Wno-dev ../
  make
}

package() {
  cd "$srcdir/$_gitname/build/"
  make DESTDIR="$pkgdir" install
  install -D -m644 "$srcdir/$_gitname/rtl-sdr.rules" "$pkgdir/usr/lib/udev/rules.d/10-rtl-sdr.rules"
}
