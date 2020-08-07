# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=libsigrok
pkgver=0.5.2
pkgrel=5
pkgdesc='Client software that supports various hardware logic analyzers, core library'
arch=('x86_64')
url='https://www.sigrok.org/wiki/Libsigrok'
license=('GPL3')
depends=('libftdi' 'libserialport' 'glibmm' 'libzip' 'libieee1284' 'bluez-libs' 'hidapi')
makedepends=('cmake' 'doxygen' 'ruby' 'jdk8-openjdk' 'swig' 'python' 'pygobject-devel' 'python-numpy' 'python-setuptools')
optdepends=('python' 'ruby' 'jdk8-openjdk'
            'sigrok-firmware-fx2lafw: Cypress FX2-based device support')
source=("https://sigrok.org/download/source/$pkgname/$pkgname-$pkgver.tar.gz"
        "fix_swig4_java_bindings.patch"
	"fix_ruby_bindings.patch::https://sigrok.org/bugzilla/attachment.cgi?id=640")
sha512sums=('cf673dad6280302d69050c29490621f66c6d6a73932d019a53ec3501316d3f2e23e7667a04f866dbe6ed73f86a63de73d2173e2b6cea563631d705e06f887092'
            '0e6bdddb2dcc03d76e5d16708bb127ec8a9207fba0e04b436ac92e370618cc0b1bc9d3e2c86a0878783626f2a8b59961c3a1a52a1e180e69005e3585e5766a89'
            '0e5b9ed566605acac02de6f559f9029929be7ca34d9688ed35d24d66c1b014f89a16902a4de79d0a1ef6347be257f24f77ea37b880aab757b2c338497de23030')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 < ../fix_swig4_java_bindings.patch # https://sigrok.org/bugzilla/show_bug.cgi?id=1527
  patch -p1 < ../fix_ruby_bindings.patch # https://sigrok.org/bugzilla/show_bug.cgi?id=1526
}

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --enable-ruby

  make
}

package() {
  cd libsigrok-$pkgver

  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -m644 -D contrib/60-libsigrok.rules "$pkgdir"/usr/lib/udev/rules.d/60-libsigrok.rules
  install -m644 -D contrib/61-libsigrok-uaccess.rules "$pkgdir"/usr/lib/udev/rules.d/61-libsigrok-uaccess.rules
}

