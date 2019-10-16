# Contributor: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=elektra-git
pkgver=0.9.0.r881.gfe1b27e31
pkgrel=1
pkgdesc="A universal hierarchical configuration store from git master"
url="https://www.libelektra.org"
license=('custom:BSD')
arch=('i686' 'x86_64')
depends=('yajl' 'qt5-base' 'python' 'curl' 'boost' 'swig' 'libuv' 'libgit2' 'libev' 'zeromq' 'gpgme')
optdepends=('ruby: for ruby bindings'
	    'python2: for python2-bindings'
	    'xerces-c: for python2-bindings'
	    'lua: for lua bindings')
makedepends=('docbook-xsl' 'cmake' 'doxygen' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+https://github.com/ElektraInitiative/libelektra.git")
sha256sums=('SKIP')

pkgver() {
  cd lib${pkgname%-git}
  git describe --tags |sed 's+-+.r+'|tr - .
}

build() {
  cd lib${pkgname%-git} 
  [[ -d build ]] || mkdir build
  cd build
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
  cd lib${pkgname%-git}/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
