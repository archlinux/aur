# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=libsigrok
pkgver=0.4.0
pkgrel=4
pkgdesc='Client software that supports various hardware logic analyzers, core library'
arch=(i686 x86_64)
url='https://www.sigrok.org/wiki/Libsigrok'
license=(GPL3)
depends=(libftdi libserialport glibmm libzip libieee1284)
makedepends=(swig python pygobject-devel python-numpy python-setuptools
             cmake python2) # for doxygen-1.8.12
optdepends=('python')
source=(https://sigrok.org/download/source/libsigrok/libsigrok-$pkgver.tar.gz
        https://ftp.stack.nl/pub/users/dimitri/doxygen-1.8.12.src.tar.gz)
sha1sums=('6d57bea676ce60b6591162c45854ede6f9d8ceb9'
          'eacf83859a5bd7f3f71b46f34759cefe1a05babc')

# libsigrok fail to build with doxygen-1.8.13 (segfault)
prepare() {
  cd "$srcdir/doxygen-1.8.12"
  rm -rf build && mkdir build && cd build
  cmake ../ \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DPYTHON_EXECUTABLE:FILE=/usr/bin/python2 \
    -Dbuild_doc:BOOL=OFF \
    -Dbuild_wizard:BOOL=OFF
  make
  make DESTDIR="$srcdir" install
}

build() {
  cd libsigrok-$pkgver
  # our doxygen executable
  export PATH=$PATH:"$srcdir"/usr/bin
 ./configure --prefix=/usr --disable-ruby --disable-java
  make
}

package() {
  cd libsigrok-$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
