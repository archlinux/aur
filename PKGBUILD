# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgbase=qt5-jsonserializer
pkgname=(qt5-jsonserializer qt5-jsonserializer-doc)
group=qt5-jsonserializer-full
pkgver=3.4.0
pkgrel=1
pkgdesc="A library to perform generic seralization and deserialization of QObjects"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QtJsonSerializer"
license=('BSD')
depends=('qt5-base')
makedepends=('git' 'qt5-tools' 'python' 'doxygen' 'graphviz')
optdepends=("repkg: Automatically rebuild the package on dependency updates")
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/QtJsonSerializer.git#tag=$pkgver"
		"$pkgname.rule")
sha256sums=('SKIP'
            '1b52eef5216017cfb4b399df1775950db544550a68a542053efe00eb8ef34911')

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake "../$_pkgfqn/"
  make
  make doxygen
}

check() {
  cd build
  make run-tests
}

package_qt5-jsonserializer() {
  cd build
  cd src/jsonserializer
  make INSTALL_ROOT="$pkgdir" install
  cd ../..

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -D -m644 "../$_pkgfqn/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
}

package_qt5-jsonserializer-doc() {
  depends=('qt5-jsonserializer')
  optdepends=()

  cd build/doc
  make INSTALL_ROOT="$pkgdir" install

  # DROP file paths from doc tags
  find "$pkgdir/usr/share/doc/qt" -type f -name '*.tags' \
    -exec sed -i -e 's:<path>[^<]*<\/path>:<path>/usr/include/qt/QtJsonSerializer</path>:g' {} \;
}
