# Contributor: Piotr Rogoza <piotr.r.public at gmail dot com>
# Contributor: Austin Keller <austin.keller@smartsheet.com>
# Maintainer: tee < teeaur at duck dot com >

pkgbase=sqlitestudio
pkgname=(
  sqlitestudio
  sqlitestudio-plugins
)
_pkgname=SQLiteStudio
pkgver=3.4.5
pkgrel=1
pkgdesc='Database manager for SQLite'
arch=(i686 x86_64)
url='https://sqlitestudio.pl'
_url='https://github.com/pawelsalawa/sqlitestudio'
license=('GPL3')
depends=(
  tcl
  python
  qt5-script
  qt5-declarative
)
makedepends=(
  pkgconf
  qt5-svg
  qt5-tools
  qt5-wayland
)
source=(
  ${_url}/archive/refs/tags/${pkgver}.tar.gz
  364981e.patch::${_url}/commit/364981e072039de1322a72c936e3747c462e57d4.patch
  ${pkgbase}.desktop
)
noextract=(
  "${pkgver}.tar.gz"
)
sha256sums=('6b0dcaa926cd88abb8ae9d38515e253059faf1255ddd2d8ebdb75066af99342b'
            '7bfd01ff5e7aea622006abfc23e3ce4c34d24132c5b3cc161c9b21e105d0d1c3'
            'c5a26a9b9003b04274887a0e0febda13eea49bb46c618eaad0b5b5c88b1cc1d2')

prepare(){
  cd "$srcdir"
  tar -xf ${pkgver}.tar.gz --strip-components=1
  patch -p1 < 364981e.patch
}

build(){
  cd "$srcdir"
  install -dm755 "$srcdir"/output/build/Plugins

  msg2 "Making sqlitestudio3-main"
  cd "$srcdir"/output/build
  qmake ../../SQLiteStudio3 \
    "LIBS += -L$srcdir/SQLiteStudio3/coreSQLiteStudio/services/impl"
  make

  PYTHON3=`pkgconf --cflags python3` 
  msg2 "Making sqlitestudio3-plugins"
  cd "$srcdir"/output/build/Plugins
  qmake ../../../Plugins \
    "INCLUDEPATH += ${PYTHON3#*I}" \
    "INCLUDEPATH += $srcdir/SQLiteStudio3/coreSQLiteStudio"
  (
    cd $srcdir/Plugins/DbSqliteCipher
    ln -sf $srcdir/SQLiteStudio3/coreSQLiteStudio/plugins
    ln -sf $srcdir/SQLiteStudio3/coreSQLiteStudio/db
  )
  sed -i 's|python3.*9|python3.12|' "$srcdir"/Plugins/ScriptingPython/ScriptingPython.pro 
  make
}

package_sqlitestudio(){
  cd "$srcdir"/output/build
  make INSTALL_ROOT="$pkgdir/usr" install

  install -Dm644 $srcdir/sqlitestudio.desktop \
    $pkgdir/usr/share/applications/sqlitestudio.desktop

  install -Dm755 \
    "$srcdir"/SQLiteStudio3/guiSQLiteStudio/img/sqlitestudio.svg \
    "$pkgdir"/usr/share/pixmaps/sqlitestudio.svg
}

package_sqlitestudio-plugins(){
  pkgdesc='Official plugins for sqlitestudio'
  depends=(sqlitestudio tcl python qt5-declarative)

  cd $srcdir/output/build/Plugins
  make INSTALL_ROOT="$pkgdir/usr" install
}
