# Contributor: Piotr Rogoza <piotr.r.public at gmail dot com>
# Contributor: Austin Keller <austin.keller@smartsheet.com>
# Maintainer: tee < teeaur at duck dot com >

pkgbase=sqlitestudio
pkgname=(
  sqlitestudio
  sqlitestudio-plugins
)
_pkgname=SQLiteStudio
pkgver=3.4.21
pkgrel=1
pkgdesc='Database manager for SQLite'
arch=(x86_64)
url='https://sqlitestudio.pl'
_git='https://github.com/pawelsalawa/letos'
license=('GPL-3.0-or-later AND LicenseRef-custom')
depends=(
  qt5-base
  qt5-declarative
  qt5-script
)
# test remove qt5-script
makedepends=(
  qt5-svg
  qt5-tools
  qt5-wayland
  python
  tcl
)
source=(
  ${pkgbase}-${pkgver}.tar.gz::${_git}/archive/${pkgver}.tar.gz
  ${pkgbase}.desktop
)
noextract=(
  ${pkgbase}-${pkgver}.tar.gz
)
sha256sums=('6c98530b4d8614578ac03e9abea8a73bebda8a17e9f7de11ce4dc0ee139cff71'
            'db6705def8e528c5749da122b6c7cc3a7982b8669e6f7e43e291f8e42dcc2ee4')

prepare(){
  tar -xf "${pkgbase}-${pkgver}.tar.gz" --strip-components=1
}

build(){
  mkdir -p "$srcdir"/output/build/Plugins
  msg2 "Making sqlitestudio3-main"
  cd "$srcdir"/output/build
  qmake ../../SQLiteStudio3 \
    "LIBS += -L$srcdir/SQLiteStudio3/coreSQLiteStudio/services/impl"
  make -s
  # test rm LIBS

  msg2 "Making sqlitestudio3-plugins"
  cd "$srcdir"/output/build/Plugins

  local ver=$(pkgconf --modversion python3)
  qmake "$srcdir"/Plugins \
    "PYTHON_VERSION = $ver" \
    "INCLUDEPATH += $srcdir/SQLiteStudio3/coreSQLiteStudio" \
    "INCLUDEPATH += /usr/include/python$ver"
  (
    cd $srcdir/Plugins/DbSqliteCipher
    ln -sf $srcdir/SQLiteStudio3/coreSQLiteStudio/plugins
    ln -sf $srcdir/SQLiteStudio3/coreSQLiteStudio/db
  )
  make -s -j1
}

package_sqlitestudio(){
  make -C output/build INSTALL_ROOT="$pkgdir/usr" install

  install -Dm644 sqlitestudio.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgbase/"
  cd SQLiteStudio3/guiSQLiteStudio/img/
  install -Dm644 sqlitestudio.svg -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps/
  install -Dm644 sqlitestudio_16.png -t "$pkgdir"/usr/share/icons/hicolor/16x16/apps/
  install -Dm644 sqlitestudio_48.png -t "$pkgdir"/usr/share/icons/hicolor/48x48/apps/
  install -Dm644 sqlitestudio_256.png -t "$pkgdir"/usr/share/icons/hicolor/256x256/apps/
}

package_sqlitestudio-plugins(){
  pkgdesc='Official plugins for sqlitestudio'
  depends=(sqlitestudio python tcl)

  make -C output/build/Plugins INSTALL_ROOT="$pkgdir/usr" install
}
# vim:set noet sts=0 sw=4 ts=4:
