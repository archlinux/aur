# Maintainer: Piotr Rogoza <piotr.r.public at gmail dot com>
# Contributor: Austin Keller <austin.keller@smartsheet.com>

pkgbase=sqlitestudio
pkgname=(
  sqlitestudio
  sqlitestudio-plugins
)
_pkgname=SQLiteStudio
pkgver=3.3.3
pkgrel=2
_pkgver=3
pkgdesc='Database manager for SQLite'
arch=(i686 x86_64)
url='https://github.com/pawelsalawa/sqlitestudio'
# url='https://sqlitestudio.pl/'
license=('GPL3')
depends=(
  # termcap
  # sqlite2
  # tcl
  qt5-script
)
makedepends=(
  chrpath
  qt5-base
  qt5-svg
  qt5-tools
)
source=(
  ${url}/archive/refs/tags/${pkgver}.tar.gz
  sqlitestudio.desktop
)
noextract=(
  "${pkgver}.tar.gz"
)
sha256sums=('f234e1ea87d27e80a1794f86d32116ebd8919d51be63d35a7d0816a77115ce31'
            'c5a26a9b9003b04274887a0e0febda13eea49bb46c618eaad0b5b5c88b1cc1d2')
prepare(){
  cd "$srcdir"
  tar -xf ${pkgver}.tar.gz --strip-components=1
}
build(){
  cd "$srcdir"
  install -dm755 "$srcdir"/output/build/Plugins

  msg2 "Making sqlitestudio3-main"
  cd "$srcdir"/output/build
  qmake ../../${_pkgname}${_pkgver} \
    "LIBS += -L$srcdir/SQLiteStudio3/coreSQLiteStudio/services/impl"
  make

  msg2 "Making sqlitestudio3-plugins"
  cd "$srcdir"/output/build/Plugins
  GCC_VERSION=$(gcc -dumpversion)
  qmake ../../../Plugins \
    "INCLUDEPATH += /usr/include/c++/$GCC_VERSION" \
    "INCLUDEPATH += $srcdir/SQLiteStudio3/coreSQLiteStudio"
  (
    cd $srcdir/Plugins/DbSqliteCipher
    ln -sf $srcdir/SQLiteStudio3/coreSQLiteStudio/plugins
    ln -sf $srcdir/SQLiteStudio3/coreSQLiteStudio/db
  )
  make
}
package_sqlitestudio(){
  cd "$srcdir"/output/build
  make INSTALL_ROOT="$pkgdir" install

  install -Dm644 $srcdir/sqlitestudio.desktop \
    $pkgdir/usr/share/applications/sqlitestudio.desktop

  # namcap: Insecure RPATH
  chrpath -d "$pkgdir"/usr/bin/sqlitestudio
  chrpath -d "$pkgdir"/usr/bin/sqlitestudiocli

  # namcap: ELF file ('...') lacks PIE
  chmod -x "$pkgdir"/usr/lib/*.so

  install -Dm755 \
    "$srcdir"/SQLiteStudio3/guiSQLiteStudio/img/sqlitestudio.svg \
    "$pkgdir"/usr/share/pixmaps/sqlitestudio.svg
}
package_sqlitestudio-plugins(){
  pkgdesc='Official plugins for sqlitestudio'
  depends=(sqlitestudio tcl qt5-base)

  cd $srcdir/output/build/Plugins
  make INSTALL_ROOT="$pkgdir" install

  # namcap: ELF file ('...') lacks PIE
  chmod -x "$pkgdir"/usr/lib/sqlitestudio/*.so
}
