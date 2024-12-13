# Contributor: Piotr Rogoza <piotr.r.public at gmail dot com>
# Contributor: Austin Keller <austin.keller@smartsheet.com>
# Maintainer: tee < teeaur at duck dot com >

pkgbase=sqlitestudio
pkgname=(
  sqlitestudio
  sqlitestudio-plugins
)
_pkgname=SQLiteStudio
pkgver=3.4.10
pkgrel=1
pkgdesc='Database manager for SQLite'
arch=(i686 x86_64)
url='https://sqlitestudio.pl'
_url='https://github.com/pawelsalawa/sqlitestudio'
license=('GPL3')
depends=(
  qt5-script
  qt5-declarative
)
makedepends=(
  pkgconf
  qt5-svg
  qt5-tools
  qt5-wayland
  python
  tcl
)
source=(
  ${_url}/archive/refs/tags/${pkgver}.tar.gz
  ${pkgbase}.desktop
)
noextract=(
  ${pkgver}.tar.gz
)
sha256sums=('1cb60b571d8aa934bb88cfc239535496b3fa0fb329b8f142bb426265397f03ff'
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
  qmake ../../SQLiteStudio3 \
    "LIBS += -L$srcdir/SQLiteStudio3/coreSQLiteStudio/services/impl"
  make -s

  msg2 "Making sqlitestudio3-plugins"
  cd "$srcdir"/output/build/Plugins
  export PYTHON3=`pkgconf --cflags python3`
  sed -i 's|python3.*9|python3.12|' "$srcdir"/Plugins/ScriptingPython/ScriptingPython.pro
  qmake ../../../Plugins \
    "INCLUDEPATH += ${PYTHON3#*I}" \
    "INCLUDEPATH += $srcdir/SQLiteStudio3/coreSQLiteStudio"
  (
    cd $srcdir/Plugins/DbSqliteCipher
    ln -sf $srcdir/SQLiteStudio3/coreSQLiteStudio/plugins
    ln -sf $srcdir/SQLiteStudio3/coreSQLiteStudio/db
  )
  make -s -j1
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
  depends=(sqlitestudio tcl python)

  cd $srcdir/output/build/Plugins
  make INSTALL_ROOT="$pkgdir/usr" install
}
