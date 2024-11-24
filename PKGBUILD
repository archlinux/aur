# Contributor: Piotr Rogoza <piotr.r.public at gmail dot com>
# Contributor: Austin Keller <austin.keller@smartsheet.com>
# Maintainer: tee < teeaur at duck dot com >

pkgbase=sqlitestudio
pkgname=(
  sqlitestudio
  sqlitestudio-plugins
)
_pkgname=SQLiteStudio
pkgver=3.4.6
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
)
source=(
  ${_url}/archive/refs/tags/${pkgver}.tar.gz
  b690.patch::${_url}/commit/b6907882161473f36ef06c1f25bd79c830b428a5.patch
  4ca9.patch::${_url}/commit/4ca9fabbc8eab13ce4984996a7b2846be8a97dd5.patch
  cc9b.patch::${_url}/commit/cc9baed11f10649df3cfc895e39ea107259a9f4b.patch
  ${pkgbase}.desktop
)
noextract=(
  ${pkgver}.tar.gz
)
sha256sums=('b21758383d100f7444c8c67975f9adb402d73cd7aa74645344c2df22b12e16f0'
            'b1921d0f6d7e0e192953b328c805a0283f0dd97dbdd86bb0a0de7bae1be96f98'
            '787cf2ecfc665d598b0f0eb3317055cfc136612f6bf9b9fb6cf3be1060ea6225'
            'f49ea26b15dfbdacb26a9271a2bc6bb8d61fd1894cd1eb9b0ae5746ed2f240d1'
            'c5a26a9b9003b04274887a0e0febda13eea49bb46c618eaad0b5b5c88b1cc1d2')

prepare(){
  cd "$srcdir"
  tar -xf ${pkgver}.tar.gz --strip-components=1
  sed -i 's|0x03110000|0x030b0000|' Plugins/ScriptingPython/scriptingpython.cpp
  patch -p1 < b690.patch
  patch -p1 < 4ca9.patch
  patch -p1 < cc9b.patch
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
  PYTHON3=`pkgconf --cflags python3`
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
