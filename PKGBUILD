# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgbase=qt5-service
pkgname=(qt5-service qt5-service-doc)
group=qt5-service-full
pkgver=1.1.0
pkgrel=1
pkgdesc="A platform independent library to easily create system services and use some of their features"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QtService"
license=('BSD')
depends=('qt5-base' 'libsystemd')
makedepends=('git' 'qt5-tools' 'qpmx-qpmsource' 'qt5-declarative' 'pkg-config' 'python' 'doxygen' 'graphviz')
optdepends=("repkg: Automatically rebuild the package on dependency updates")
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/QtService.git#tag=$pkgver"
		"$pkgname.rule")
sha256sums=('SKIP'
            '4917a8f753880a060abbaa22841b82dbba6d67e0e5177c6e76e643f7ae89d60c')

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

package_qt5-service() {
  cd build
  cd src
  make INSTALL_ROOT="$pkgdir" install
  cd ..

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -D -m644 "../$_pkgfqn/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/${pkgname}.rule"
}

package_qt5-service-doc() {
  depends=('qt5-service')
  optdepends=()

  cd build/doc
  make INSTALL_ROOT="$pkgdir" install

  # DROP file paths from doc tags
  find "$pkgdir/usr/share/doc/qt" -type f -name '*.tags' \
    -exec sed -i -e 's:<path>[^<]*<\/path>:<path>/usr/include/qt/QtJsonSerializer</path>:g' {} \;

  # install manpages
  install -Dm644 -t "$pkgdir//usr/share/man/man3" man/man3/*.3
}
