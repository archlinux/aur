# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=libsigrok-chromium-twinkie
_pkgname=libsigrok
pkgver=0.5.2
pkgrel=1
pkgdesc='Client software that supports various hardware logic analyzers, core library'
arch=('x86_64')
url='https://www.sigrok.org/wiki/Libsigrok'
license=('GPL3')
depends=('libftdi' 'libserialport' 'glibmm' 'libzip' 'libieee1284' 'bluez-libs' 'hidapi' 'libudev.so')
makedepends=('cmake' 'doxygen' 'ruby' 'jdk8-openjdk' 'swig' 'python' 'pygobject-devel' 'python-numpy' 'python-setuptools' 'autoconf-archive')
optdepends=('python' 'ruby' 'jdk8-openjdk'
            'sigrok-firmware-fx2lafw: Cypress FX2-based device support')
options=(!lto) # FS#78381
conflicts=(libsigrok)
provides=(libsigrok)
source=("https://sigrok.org/download/source/$_pkgname/$_pkgname-$pkgver.tar.gz"
        "fix_swig4_java_bindings.patch"
        "libsigrok-0.5.2-swig-4.1.patch"
	    "fix_ruby_bindings.patch::https://sigrok.org/bugzilla/attachment.cgi?id=640"
        "chromium-twinkie-driver.patch"
        "chromium-twinkie-vbus-channels.patch")
sha512sums=('cf673dad6280302d69050c29490621f66c6d6a73932d019a53ec3501316d3f2e23e7667a04f866dbe6ed73f86a63de73d2173e2b6cea563631d705e06f887092'
            '0e6bdddb2dcc03d76e5d16708bb127ec8a9207fba0e04b436ac92e370618cc0b1bc9d3e2c86a0878783626f2a8b59961c3a1a52a1e180e69005e3585e5766a89'
            '7a1e35b6b268d117e67dff55c2ff1320257525eedb7454a068732d79074b6d743036ab2c11043952738dd3990ca084782feeb15ad92a306b3b58c73ecc530154'
            '0e5b9ed566605acac02de6f559f9029929be7ca34d9688ed35d24d66c1b014f89a16902a4de79d0a1ef6347be257f24f77ea37b880aab757b2c338497de23030'
            'd5b20497be7d295b0b4cb7f254c279bddaaf598d222b2c6062450f1c5326defdf50ba53d88539b2c01dba01c978170e582deba5793cd00cfd2c7a2ba5e854208'
            '44737ff60df9b3c42ae5068b8c13c8a14ad02e483ebf2d8ca40f39bedad1f5d4804740c3b143d30f1fdaa8dc4cba3074f4fe37428717bea6fa787bbfc1331a0e')

prepare() {
  cd $_pkgname-$pkgver
  patch -p1 < ../fix_swig4_java_bindings.patch # https://sigrok.org/bugzilla/show_bug.cgi?id=1527
  patch -p1 < ../fix_ruby_bindings.patch # https://sigrok.org/bugzilla/show_bug.cgi?id=1526
  patch -p1 < ../libsigrok-0.5.2-swig-4.1.patch # https://sigrok.org/bugzilla/show_bug.cgi?id=1827
  patch -p1 < ../chromium-twinkie-driver.patch
  patch -p1 < ../chromium-twinkie-vbus-channels.patch

  # regenerate ./configure so it can detect Python 3.10
  autoreconf -vi
}

build() {
  cd $_pkgname-$pkgver

  ./configure --prefix=/usr --enable-ruby

  make
}

package() {
  cd libsigrok-$pkgver

  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -m644 -D contrib/60-libsigrok.rules "$pkgdir"/usr/lib/udev/rules.d/60-libsigrok.rules
  install -m644 -D contrib/61-libsigrok-uaccess.rules "$pkgdir"/usr/lib/udev/rules.d/61-libsigrok-uaccess.rules
}

