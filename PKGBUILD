# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgbase=qt5-mvvm
pkgname=(qt5-mvvmcore qt5-mvvmwidgets qt5-mvvmquick qt5-mvvmdatasynccore qt5-mvvmdatasyncwidgets qt5-mvvmdatasyncquick qt5-mvvm-doc)
group=qt5-mvvm
pkgver=1.1.5
pkgrel=1
pkgdesc="A mvvm oriented library for Qt, to create Projects for Widgets and Quick in parallel"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QtMvvm"
license=('BSD')
depends=('qt5-base' 'qt5-svg')
makedepends=('qt5-tools' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-datasync' 'git' 'qdep' 'python' 'doxygen' 'graphviz')
optdepends=("repkg: Automatically rebuild the package on dependency updates")
_pkgfqn=$pkgbase-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/QtMvvm.git#tag=${pkgver}"
		"${pkgbase}core.rule"
		"${pkgbase}widgets.rule"
		"${pkgbase}quick.rule"
		"${pkgbase}datasynccore.rule"
		"${pkgbase}datasyncwidgets.rule"
		"${pkgbase}datasyncquick.rule")
sha256sums=('SKIP'
            '1b52eef5216017cfb4b399df1775950db544550a68a542053efe00eb8ef34911'
            'c69a4d6f324019d30a6f3d5dac00760af670c8f14b5064e6f4c08072a34ab5b8'
            '8eff388f59e28e1246c3f4aff71c5405c0098651d66a705fae73d67f76a80e4c'
            '883fb2489da33b13827e5a44f6b56fddddcd18e9de96691db095ac5786a056c0'
            'b974d9a7d88fcc9bde60ce6af3bac3c5f7374e07f635f8a90ef05e2791c99eae'
            '8a6d5cc54a0eae285296c11de1e1ea02583cf8271ba87219c4fcfdcdf9907786')

prepare() {
  mkdir -p build

  cd "$_pkgfqn"
}

build() {
  cd build

  qmake "CONFIG+=no_auto_lupdate" "../$_pkgfqn/"
  make
  make doxygen
}

check() {
  cd build
  make run-tests
}

package_qt5-mvvmcore() {
  cd build
  cd src/mvvmcore
  make INSTALL_ROOT="$pkgdir" install
  cd ../imports/mvvmcore
  make INSTALL_ROOT="$pkgdir" install
  cd ../../../tools/settingsgenerator
  make INSTALL_ROOT="$pkgdir" install
  cd ../..

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -D -m644 "../$_pkgfqn/qbs/Qt/settingsgenerator/module.qbs" "$pkgdir/usr/share/qbs/modules/Qt/settingsgenerator/module.qbs"
  install -D -m644 "../$_pkgfqn/LICENSE" "$pkgdir/usr/share/licenses/$pkgbase/LICENSE"
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
}

package_qt5-mvvmwidgets() {
  depends=('qt5-mvvmcore')
  optdepends=()

  cd build
  cd src/mvvmwidgets
  make INSTALL_ROOT="$pkgdir" install
  cd ../..

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
}

package_qt5-mvvmquick() {
  depends=('qt5-mvvmcore' 'qt5-quickcontrols2' 'qt5-graphicaleffects')
  optdepends=()

  cd build
  cd src/mvvmquick
  make INSTALL_ROOT="$pkgdir" install
  cd ../imports/mvvmquick
  make INSTALL_ROOT="$pkgdir" install
  cd ../../..

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
}

package_qt5-mvvmdatasynccore() {
  depends=('qt5-mvvmcore' 'qt5-datasync')
  optdepends=()

  cd build
  cd src/mvvmdatasynccore
  make INSTALL_ROOT="$pkgdir" install
  cd ../imports/mvvmdatasynccore
  make INSTALL_ROOT="$pkgdir" install
  cd ../../..

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
  # Install mimetype
  install -D -m644 "../$_pkgfqn/src/mvvmdatasynccore/application-x-datasync-account-data.xml" "$pkgdir/usr/share/mime/packages/application-x-datasync-account-data.xml"
}

package_qt5-mvvmdatasyncwidgets() {
  depends=('qt5-mvvmdatasynccore' 'qt5-mvvmwidgets')
  optdepends=()

  cd build
  cd src/mvvmdatasyncwidgets
  make INSTALL_ROOT="$pkgdir" install
  cd ../..

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
}

package_qt5-mvvmdatasyncquick() {
  depends=('qt5-mvvmdatasynccore' 'qt5-mvvmquick')
  optdepends=()

  cd build
  cd src/mvvmdatasyncquick
  make INSTALL_ROOT="$pkgdir" install
  cd ../imports/mvvmdatasyncquick
  make INSTALL_ROOT="$pkgdir" install
  cd ../../..

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
}

package_qt5-mvvm-doc() {
  depends=('qt5-mvvmcore')
  optdepends=()

  cd build/doc
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 -t "$pkgdir/usr/share/man/man3" man/man3/*.3
  cd "../../$_pkgfqn/ProjectTemplate"
  find . -type f -exec install -D -m644 "{}" "$pkgdir/usr/share/qtcreator/templates/wizards/projects/qtmvvm/{}" \;

  # DROP file paths from doc tags
  find "$pkgdir/usr/share/doc/qt" -type f -name '*.tags' \
    -exec sed -i -e 's:<path>[^<]*<\/path>:<path>/usr/include/qt/QtMvvm</path>:g' {} \;
}
