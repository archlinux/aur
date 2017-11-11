# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=qt5-jsonserializer
pkgver=3.1.0
pkgrel=1
pkgdesc="A library to perform generic seralization and deserialization of QObjects"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QtJsonSerializer"
license=('BSD')
depends=('qt5-base')
makedepends=('git' 'qt5-tools')
optdepends=("repkg: Automatically rebuild the package on dependency updates")
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/QtJsonSerializer.git#tag=$pkgver"
		"$pkgname.rule")
sha256sums=('SKIP'
            '2147916eaeebda7109b04f17e122a873388f42f2015e4b6b9fbf6f98e8e80d15')

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake "../$_pkgfqn/"
  make qmake_all
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
