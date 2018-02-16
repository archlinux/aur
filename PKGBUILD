# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgbase=qt5-restclient
pkgname=(qt5-restclient qt5-restclient-doc)
group=qt5-restclient-full
pkgver=1.2.6
pkgrel=1
pkgdesc="A library for generic JSON-based REST-APIs, with a mechanism to map JSON to Qt objects"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QtRestClient"
license=('BSD')
depends=('qt5-base' 'qt5-jsonserializer>=3.1.0')
makedepends=('git' 'qt5-tools' 'python' 'doxygen' 'graphviz')
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

  qmake "../$_pkgfqn/"
  make qmake_all
  make
  make lrelease
  make doxygen
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

  install -D -m644 "../$_pkgfqn/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/${pkgname}.rule"
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
