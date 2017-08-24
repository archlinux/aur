# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=qt5-backgroundprocess
pkgver=1.5.2
pkgrel=2
pkgdesc="A Library to create background applications with simple, automated foreground control"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QtBackgroundProcess"
license=('BSD')
depends=('qt5-base')
makedepends=('qt5-tools' 'git' 'qpm')
optdepends=("repkg: Automatically rebuild the package on dependency updates")
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/QtBackgroundProcess.git#tag=$pkgver"
		"${pkgname}.rule")
sha256sums=('SKIP'
            '2147916eaeebda7109b04f17e122a873388f42f2015e4b6b9fbf6f98e8e80d15')

prepare() {
  mkdir -p build

  cd "$_pkgfqn/src/3rdparty"
  qpm install
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
