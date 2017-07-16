# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=qt5-restclient
pkgver=1.2.3
pkgrel=3
pkgdesc="A library for generic JSON-based REST-APIs, with a mechanism to map JSON to Qt objects"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QtRestClient"
license=('BSD')
depends=('qt5-base' 'qt5-tools' 'qt5-jsonserializer>=2.1.0')
makedepends=('git')
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/QtRestClient.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake -r "../$_pkgfqn/"
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -D -m644 "../$_pkgfqn/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
