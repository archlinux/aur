# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=qt5-restclient
pkgver=1.2.3
pkgrel=4
pkgdesc="A library for generic JSON-based REST-APIs, with a mechanism to map JSON to Qt objects"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QtRestClient"
license=('BSD')
depends=('qt5-base' 'qt5-jsonserializer>=2.1.0')
makedepends=('git' 'qt5-tools')
optdepends=("repkg: Automatically rebuild the package on dependency updates")
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/QtRestClient.git#tag=$pkgver"
		"$pkgname.rule")
sha256sums=('SKIP'
            '6029d42b05d32d99a6e673e5a7c95ac657e6258f88835f8aff05bde7535e543b')

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
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/${pkgname}.rule"
}
