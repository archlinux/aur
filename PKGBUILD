# Maintainer: Sergio Conde <skgsergio@gmail.com>

pkgname=rtl-sdr-keenerd-git
pkgver=20150428
pkgrel=5
pkgdesc="Turns Realtek RTL2832 based DVB dongle into a SDR receiver transferring the raw I/Q samples to the host. Keenerd's experimental fork."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/keenerd/rtl-sdr'
license=('GPL')
depends=('libusb>=1.0')
makedepends=('git' 'cmake')
provides=('rtl-sdr' 'rtl-sdr-git')
conflicts=('rtl-sdr' 'rtl-sdr-git')
source=("$pkgname::git+https://github.com/keenerd/rtl-sdr.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git show -s --format="%cd" --date=short HEAD | tr -d '-'
}

build() {
  cd "$srcdir/$pkgname"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DDETACH_KERNEL_DRIVER=ON -Wno-dev ../
  make
}

package() {
  cd "$srcdir/$pkgname/build/"
  make DESTDIR="$pkgdir" install
  install -D -m644 "$srcdir/$pkgname/rtl-sdr.rules" "$pkgdir/usr/lib/udev/rules.d/10-rtl-sdr.rules"
}
