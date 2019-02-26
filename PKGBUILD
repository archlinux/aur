# Contributor: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=elektra
pkgver=0.8.26
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
makedepends=('docbook-xsl' 'cmake' 'doxygen' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ElektraInitiative/libelektra/archive/$pkgver.tar.gz")
sha256sums=('8d2fcd48d3e119fef63548028b2cb1a734008132d8691c36026df1f584e1a111')

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
