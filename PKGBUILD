# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=libsigrok
pkgver=0.5.2
pkgrel=1
pkgdesc='Client software that supports various hardware logic analyzers, core library'
arch=('x86_64')
url='https://www.sigrok.org/wiki/Libsigrok'
license=('GPL3')
depends=('libftdi' 'libserialport' 'glibmm' 'libzip' 'libieee1284')
makedepends=('cmake' 'doxygen' 'ruby' 'jdk8-openjdk' 'swig3' 'python' 'pygobject-devel' 'python-numpy' 'python-setuptools')
optdepends=('python' 'ruby' 'jdk8-openjdk'
            'sigrok-firmware-fx2lafw: Cypress FX2-based device support')
source=("https://sigrok.org/download/source/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('cf673dad6280302d69050c29490621f66c6d6a73932d019a53ec3501316d3f2e23e7667a04f866dbe6ed73f86a63de73d2173e2b6cea563631d705e06f887092')

prepare() {
  cd $pkgname-$pkgver
  sed -e 's|swig3.0|swig-3|g' -i configure # Build with swig 3
}

build() {
  cd $pkgname-$pkgver

 ./configure --prefix=/usr

  make
}

package() {
  cd libsigrok-$pkgver

  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -m644 -D contrib/60-libsigrok.rules "$pkgdir"/usr/lib/udev/rules.d/60-libsigrok.rules
  install -m644 -D contrib/61-libsigrok-uaccess.rules "$pkgdir"/usr/lib/udev/rules.d/61-libsigrok-uaccess.rules
}

