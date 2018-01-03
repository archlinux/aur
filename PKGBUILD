# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=libsigrok
pkgver=0.5.0
pkgrel=4
pkgdesc='Client software that supports various hardware logic analyzers, core library'
arch=(x86_64)
url='https://www.sigrok.org/wiki/Libsigrok'
license=(GPL3)
depends=(libftdi libserialport glibmm libzip libieee1284)
makedepends=(cmake doxygen ruby jdk8-openjdk swig python pygobject-devel python-numpy python-setuptools)
optdepends=('python' 'ruby' 'jdk8-openjdk')
source=(https://sigrok.org/download/source/libsigrok/libsigrok-$pkgver.tar.gz)
sha1sums=('51dbf0728804f1df9fd76c6136ee48a157298833')

prepare() {
  cd libsigrok-$pkgver
  sed -i 's|, MODE="660", GROUP="plugdev"||' contrib/z60_libsigrok.rules # FS#56059
}

build() {
  cd libsigrok-$pkgver
 ./configure --prefix=/usr
  make
}

package() {
  cd libsigrok-$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -m644 -D contrib/z60_libsigrok.rules $pkgdir/usr/lib/udev/rules.d/60-libsigrok.rules
}
