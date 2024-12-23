# Contributor: Piotr Rogoza <piotr.r.public at gmail dot com>
# Contributor: Austin Keller <austin.keller@smartsheet.com>
# Maintainer: tee < teeaur at duck dot com >

pkgbase=sqlitestudio
pkgname=(
  sqlitestudio
  sqlitestudio-plugins
)
_pkgname=SQLiteStudio
pkgver=3.4.12
pkgrel=1
pkgdesc='Database manager for SQLite'
arch=(i686 x86_64)
url='https://sqlitestudio.pl'
_git='https://github.com/pawelsalawa/sqlitestudio'
license=('GPL3')
depends=(
  qt5-script
  qt5-declarative
)
makedepends=(
  qt5-svg
  qt5-tools
  qt5-wayland
  python
  tcl
)
source=(
  ${_git}/archive/refs/tags/${pkgver}.tar.gz
  ${pkgbase}.desktop
)
noextract=(
  ${pkgver}.tar.gz
)
sha256sums=('eeae5af364b8a0129ed34715cf2b05a1e7848bb47d56d04e40f0264ad46596c1'
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
  IFS=' ' read -r -a array <<< "$(python3 -V)"
  ver="python${array[1]%.*}"
  sed -i "s|python3.*9|$ver|" "$srcdir"/Plugins/ScriptingPython/ScriptingPython.pro
  qmake ../../../Plugins \
    "INCLUDEPATH += $srcdir/SQLiteStudio3/coreSQLiteStudio" \
    "INCLUDEPATH += /usr/include/$ver"
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
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
