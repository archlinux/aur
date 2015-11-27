# Maintainer: Piotr Rogoza <piotr.r.public at gmail dot com>

pkgname=sqlitestudio
_pkgname=SQLiteStudio
pkgver=3.0.7
_pkgver=3
pkgrel=1
pkgdesc='Database manager for SQLite'
arch=(i686 x86_64)
url='http://sqlitestudio.pl/'
license=('GPL3')
depends=(
termcap
sqlite2
tcl
qt5-script
libxkbcommon-x11
)
makedepends=(
chrpath
qtchooser
qt5-svg
qt5-tools
)
install='sqlitestudio.install'
source=(
http://sqlitestudio.pl/files/sqlitestudio${_pkgver}/complete/tar/sqlitestudio-$pkgver.tar.gz
sqlitestudio.desktop
tclconfig.diff
utils.diff
db.diff
cli_config.diff
dbandroid.diff
)
sha256sums=('b5ad7ac22a88eacb9404637ca6257934d0b1b59e16a182099bbdb158a7af55aa'
            'c5a26a9b9003b04274887a0e0febda13eea49bb46c618eaad0b5b5c88b1cc1d2'
            'f63b112d42bc670ab95a264ee1d82acdefad34733c18554b17801fa5c2f56bae'
            '10f8ed73488b30efbcce563fb8dc6bc8b11a6511f42e5e0f8c7f9cab360dd855'
            '6e162788b3df1d60145fe982ce7db1a22dd1ac37f5d100736281e4ccb66510f6'
            '29b7ba8e453ce091f634e5a0a921dd01e5190a34f5a84b670e8ae6c3b820c865'
            '41784cc78f9d5e9a92442942f91d8039e211017e2cde3a043628b623c1ba76da')
prepare(){
  cd "$srcdir"
  patch -p1 -i tclconfig.diff
  patch -p1 -i utils.diff
  patch -p1 -i db.diff
  patch -p1 -i cli_config.diff
  patch -p1 -i dbandroid.diff

}
build(){
  cd "$srcdir"
  install -dm755 "$srcdir"/output/build/Plugins

  msg2 "Making sqlitestudio3"
  cd "$srcdir"/output/build
  qmake ../../${_pkgname}${_pkgver}
  make

  msg2 "Making plugins for sqlitestudio3"
  cd "$srcdir"/output/build/Plugins
  qmake ../../../Plugins
  make
}
package(){
  cd "$srcdir"/output/build
  make INSTALL_ROOT="$pkgdir" install

  cd $srcdir/output/build/Plugins
  make INSTALL_ROOT="$pkgdir" install

  install -Dm644 $srcdir/sqlitestudio.desktop \
    $pkgdir/usr/share/applications/sqlitestudio.desktop

  # Insecure RPATH
  chrpath -d "$pkgdir"/usr/bin/sqlitestudio
  chrpath -d "$pkgdir"/usr/bin/sqlitestudiocli

  install -Dm755 "$srcdir"/SQLiteStudio3/guiSQLiteStudio/img/sqlitestudio.svg "$pkgdir"/usr/share/pixmaps/sqlitestudio.svg
}
