# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgbase=qt5-restclient
pkgname=(qt5-restclient qt5-restclient-doc)
group=qt5-restclient-full
pkgver=2.2.0
pkgrel=1
pkgdesc="A library for generic JSON-based REST-APIs, with a mechanism to map JSON to Qt objects"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QtRestClient"
license=('BSD')
depends=('qt5-base' 'qt5-networkauth' 'qt5-jsonserializer>=3.1.0')
makedepends=('git' 'qt5-tools' 'qt5-declarative' 'qdep' 'python' 'doxygen' 'graphviz')
optdepends=("repkg: Automatically rebuild the package on dependency updates")
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/QtRestClient.git#tag=$pkgver"
		"$pkgname.rule")
sha256sums=('SKIP'
            '2ade1a0114b13c7868eb0057044531aa01bcc854704899772c1c5e010cb1478e')

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

package_qt5-restclient() {
  cd build
  cd src
  make INSTALL_ROOT="$pkgdir" install
  cd ../tools
  make INSTALL_ROOT="$pkgdir" install
  cd ..

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -D -m644 "../$_pkgfqn/qbs/Qt/restbuilder/module.qbs" "$pkgdir/usr/share/qbs/modules/Qt/restbuilder/module.qbs"

  install -D -m644 "../$_pkgfqn/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
}

package_qt5-restclient-doc() {
  depends=('qt5-restclient')
  optdepends=()

  cd build/doc
  make INSTALL_ROOT="$pkgdir" install

  # DROP file paths from doc tags
  find "$pkgdir/usr/share/doc/qt" -type f -name '*.tags' \
    -exec sed -i -e 's:<path>[^<]*<\/path>:<path>/usr/include/qt/QtRestClient</path>:g' {} \;
}
