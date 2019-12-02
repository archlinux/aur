# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=libsigrok
pkgver=0.5.1
pkgrel=6
pkgdesc='Client software that supports various hardware logic analyzers, core library'
arch=('x86_64')
url='https://www.sigrok.org/wiki/Libsigrok'
license=('GPL3')
depends=('libftdi' 'libserialport' 'glibmm' 'libzip' 'libieee1284')
makedepends=('cmake' 'doxygen' 'ruby' 'jdk8-openjdk' 'swig3' 'python' 'pygobject-devel' 'python-numpy' 'python-setuptools')
optdepends=('python' 'ruby' 'jdk8-openjdk'
            'sigrok-firmware-fx2lafw: Cypress FX2-based device support')
source=("https://sigrok.org/download/source/$pkgname/$pkgname-$pkgver.tar.gz"
         libsigrok-doxygen.patch::"https://sigrok.org/gitweb/?p=libsigrok.git;a=patch;h=2da97803")
sha512sums=('48337fc4625dc0abc162ae54e04ce091047835aa1e49ba1ab84542805008d1ff5646b143fde57e317f3b34514c0e6d4dcb7b1c5944f3f16bdef1a7169edc3517'
            '761c2dfe69f44afbb0a7d73da132c522b056ac37dda9ffa161fa0277241f0da4ffd3a1bb893e99e2d0c8c544b81005bb8f16d90ce05db910b0d8d5421ece507e')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../libsigrok-doxygen.patch # Fix build with doxygen 1.8.16
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

