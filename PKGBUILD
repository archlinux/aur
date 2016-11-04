# Maintainer: Piotr Rogoza <piotr.r.public at gmail dot com>

pkgbase=sqlitestudio
pkgname=(
sqlitestudio
sqlitestudio-plugins
)
_pkgname=SQLiteStudio
pkgver=3.1.1
pkgrel=1
_pkgver=3
pkgdesc='Database manager for SQLite'
arch=(i686 x86_64)
url='http://sqlitestudio.pl/'
license=('GPL3')
depends=(
termcap
sqlite2
tcl
qt5-script
)
makedepends=(
chrpath
qt5-base
qt5-svg
qt5-tools
)
source=(
http://sqlitestudio.pl/files/sqlitestudio${_pkgver}/complete/tar/sqlitestudio-$pkgver.tar.gz
sqlitestudio.desktop
)
sha256sums=('f757a82466e97137addd70dd5323a1a7ba7cad7841dc138812a2da2799f92c6c'
            'c5a26a9b9003b04274887a0e0febda13eea49bb46c618eaad0b5b5c88b1cc1d2')
prepare(){
  cd "$srcdir"
}
build(){
  cd "$srcdir"
  install -dm755 "$srcdir"/output/build/Plugins

  msg2 "Making sqlitestudio3-main"
  cd "$srcdir"/output/build
  qmake ../../${_pkgname}${_pkgver} "LIBS += -L$srcdir/SQLiteStudio3/coreSQLiteStudio/services/impl"
  make

  msg2 "Making sqlitestudio3-plugins"
  cd "$srcdir"/output/build/Plugins
  GCC_VERSION=$(gcc -dumpversion)
  qmake ../../../Plugins "INCLUDEPATH += /usr/include/c++/$GCC_VERSION" "INCLUDEPATH += $srcdir/SQLiteStudio3/coreSQLiteStudio"
  (
    cd $srcdir/Plugins/DbSqliteCipher
    ln -sf $srcdir/SQLiteStudio3/coreSQLiteStudio/plugins
    ln -sf $srcdir/SQLiteStudio3/coreSQLiteStudio/db
  )
  make
}
package_sqlitestudio (){
  cd "$srcdir"/output/build
  make INSTALL_ROOT="$pkgdir" install

  install -Dm644 $srcdir/sqlitestudio.desktop \
    $pkgdir/usr/share/applications/sqlitestudio.desktop

  # Insecure RPATH
  chrpath -d "$pkgdir"/usr/bin/sqlitestudio
  chrpath -d "$pkgdir"/usr/bin/sqlitestudiocli

  install -Dm755 "$srcdir"/SQLiteStudio3/guiSQLiteStudio/img/sqlitestudio.svg "$pkgdir"/usr/share/pixmaps/sqlitestudio.svg
}
package_sqlitestudio-plugins () {
  pkgdesc='Official plugins for sqlitestudio'
  depends=(sqlitestudio)

  cd $srcdir/output/build/Plugins
  make INSTALL_ROOT="$pkgdir" install
}
