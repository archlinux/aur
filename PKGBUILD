# Contributor: Richard Stöckl<richard.stoeckl@aon.at>
pkgname=('libelektra' 'libelektra-docs')
pkgver=0.9.9
pkgrel=3
pkgdesc="A universal hierarchical configuration store"
url="https://www.libelektra.org"
license=('custom:BSD')
arch=('i686' 'x86_64')
depends=('yajl' 'qt5-declarative' 'qt5-base' 'lua' 'python'
  'libuv' 'libgit2' 'libev' 'zeromq' 'gpgme' 'hicolor-icon-theme'
  'discount' 'yaml-cpp' 'java-runtime')
optdepends=('ruby: for ruby bindings'
  'python2: for python2-bindings')
makedepends=('cmake' 'doxygen' 'git' 'swig' 'xerces-c')
provides=('libelektra' 'elektra')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ElektraInitiative/libelektra/archive/$pkgver.tar.gz")
sha256sums=('12e94a58d1a707f8cf359d888c19c8f4e059b3bacc0c35c86dfc309ebd0a385b')

build() {
  cd "$pkgname-$pkgver"
  [[ -d build ]] || mkdir build
  cd build
  JAVA_HOME="/usr/lib/jvm/$(archlinux-java get)"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_RPATH:PATH=/usr/lib \
    -DPLUGINS:STRING="ALL;-ruby;-jni" \
    -DTOOLS:STRING="ALL" \
    -DBUILD_STATIC:STRING=OFF \
    -DBINDINGS:STRING="ALL;-ruby" \
    -DSWIG_EXECUTABLE:STRING="/usr/bin/swig" \
    -DLUA_INCLUDE_DIR:PATH=/usr/include \
    -DLUA_LIBRARY:STRING=/usr/lib/liblua.so ..
  make
}

package_libelektra() {
  cd "$pkgbase-$pkgver/build"
  make DESTDIR="$pkgdir" install

  install -Dm644 ../LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  ln -sr "$pkgdir"/usr/share/elektra/tool_data/elektrad/elektrad "$pkgdir"/usr/share/elektra/tool_data/hub-zeromq/hub-zeromq "$pkgdir"/usr/bin
  rm -rf "$pkgdir"/usr/share/doc
}

package_libelektra-docs() {
  arch=('any')
  depends=()
  optdepends=()
  pkgdesc="A universal hierarchical configuration store (documentation)"
  cd "$pkgbase-$pkgver/build/doc"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../../LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}

