# Contributor: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=elektra
pkgver=0.8.24
pkgrel=1
pkgdesc="A universal hierarchical configuration store"
url="https://www.libelektra.org"
license=('custom:BSD')
arch=('i686' 'x86_64')
depends=('yajl' 'qt5-base' 'python' 'curl' 'boost' 'swig' 'libuv' 'libgit2' 'libev' 'zeromq')
optdepends=('ruby: for ruby bindings'
	    'python2: for python2-bindings'
	    'xerces-c: for python2-bindings'
	    'lua: for lua bindings')
makedepends=('docbook-xsl' 'cmake' 'doxygen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ElektraInitiative/libelektra/archive/$pkgver.tar.gz")
sha256sums=('35efad1e024acd2f7d9a85a42f308dd3cea01b70beec7ec8ebe0176b5a218ba3')

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
