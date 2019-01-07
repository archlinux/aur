# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=libsigrok
pkgver=0.5.1
pkgrel=3
pkgdesc='Client software that supports various hardware logic analyzers, core library'
arch=(x86_64)
url='https://www.sigrok.org/wiki/Libsigrok'
license=(GPL3)
depends=(libftdi libserialport glibmm libzip libieee1284)
makedepends=(cmake doxygen ruby jdk8-openjdk swig python pygobject-devel python-numpy python-setuptools)
optdepends=('python' 'ruby' 'jdk8-openjdk')
source=(https://sigrok.org/download/source/libsigrok/libsigrok-$pkgver.tar.gz)
sha1sums=('7b4727668153f2f3ea062b0a4cffc7f9c199957a')

prepare() {
  cd libsigrok-$pkgver
  sed -i 's|, MODE="660", GROUP="plugdev"||' contrib/60-libsigrok.rules # FS#56059
}

build() {
  cd libsigrok-$pkgver
 ./configure --prefix=/usr
  make
}

package() {
  cd libsigrok-$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -m644 -D contrib/60-libsigrok.rules $pkgdir/usr/lib/udev/rules.d/60-libsigrok.rules
  install -m644 -D contrib/61-libsigrok-plugdev.rules $pkgdir/usr/lib/udev/rules.d/61-libsigrok-plugdev.rules
  install -m644 -D contrib/61-libsigrok-uaccess.rules $pkgdir/usr/lib/udev/rules.d/61-libsigrok-uaccess.rules
}
