# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgbase=qt5-autoupdater
pkgname=(qt5-autoupdater qt5-autoupdater-qtifw qt5-autoupdater-packagekit qt5-autoupdater-doc)
group=qt5-autoupdater-full
pkgver=3.0.0
pkgrel=3
pkgdesc="A Qt library to automatically check for updates and install them"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QtAutoUpdater"
license=('BSD')
depends=('qt5-base' 'qt5-quickcontrols2')
makedepends=('git' 'qt5-tools' 'packagekit-qt5' 'qdep' 'python' 'doxygen' 'graphviz')
optdepends=("repkg: Automatically rebuild the package on dependency updates")
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/QtAutoUpdater.git#tag=$pkgver-3"
		"$pkgname.rule"
		"subpkg.rule")
sha256sums=('SKIP'
            '53d4064bdd7387926f655be81326b0b56b5a1b4abd895a870466d02456594cbf'
            'c1650aebcb7175bf4b163573205801df4637180aaf3583703338546bb66dbca6')

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake "../$_pkgfqn/"
  make
  make doxygen
}

package_qt5-autoupdater() {
  cd build/src/autoupdatercore
  make INSTALL_ROOT="$pkgdir" install
  cd ../plugins/updaters/qwebquery
  make INSTALL_ROOT="$pkgdir" install
  cd ../../../autoupdaterwidgets
  make INSTALL_ROOT="$pkgdir" install
  cd ../imports
  make INSTALL_ROOT="$pkgdir" install
  cd ../translations
  make INSTALL_ROOT="$pkgdir" install
  cd ../..

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -D -m644 "../$_pkgfqn/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
}

package_qt5-autoupdater-qtifw() {
  depends=('qt5-autoupdater')
  optdepends=()
  
  cd build/src/plugins/updaters/qtifw
  make INSTALL_ROOT="$pkgdir" install
  
  cd "../../../../../$_pkgfqn"
  install -D -m644 "../subpkg.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
}

package_qt5-autoupdater-packagekit() {
  depends=('qt5-autoupdater' 'packagekit-qt5')
  optdepends=()
  
  cd build/src/plugins/updaters/qpackagekit
  make INSTALL_ROOT="$pkgdir" install
  
  cd "../../../../../$_pkgfqn"
  install -D -m644 "../subpkg.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"

}

package_qt5-autoupdater-doc() {
  depends=('qt5-autoupdater')
  optdepends=()

  cd build/doc
  make INSTALL_ROOT="$pkgdir" install

  # DROP file paths from doc tags
  find "$pkgdir/usr/share/doc/qt" -type f -name '*.tags' \
    -exec sed -i -e 's:<path>[^<]*<\/path>:<path>/usr/include/qt/QtAutoUpdater</path>:g' {} \;
}
