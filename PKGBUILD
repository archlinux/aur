# Contributor: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=elektra
pkgver=0.8.23
pkgrel=1
pkgdesc="A universal hierarchical configuration store"
url="https://www.libelektra.org"
license=('custom:BSD')
arch=('i686' 'x86_64')
depends=('yajl' 'qt5-base' 'python' 'curl' 'boost' 'swig' 'libuv')
optdepends=('ruby: for ruby bindings'
	    'python2: for python2-bindings'
	    'xerces-c: for python2-bindings'
	    'lua: for lua bindings'
	    'libgit2: for git support')
makedepends=('docbook-xsl' 'cmake' 'doxygen')
source=(https://github.com/ElektraInitiative/libelektra/archive/$pkgver.tar.gz)
sha256sums=('f02c6219d26ec9b9d8c7409349e3a713ad88e587154897b8f24a4e6030b88d46')

build() {
  cd lib$pkgname-$pkgver
  rm -rf build
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DPLUGINS:STRING="ALL" \
        -DTOOLS:STRING="ALL" \
        -DBUILD_STATIC:STRING=OFF \
        -DBINDINGS:STRING="ALL" \
        -DSWIG_EXECUTABLE:STRING="/usr/bin/swig" \
        -DLUA_INCLUDE_DIR:PATH=/usr/include \
        -DLUA_LIBRARY:STRING=/usr/lib/liblua.so ..
  make clean 
  make
}

package() {
  cd lib$pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
