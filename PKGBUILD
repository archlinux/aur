# Maintainer: Piotr Rogoza <piotr.r.public at gmail dot com>
# Contributor: Austin Keller <austin.keller@smartsheet.com>
# Contributor: tee < teeaur at duck dot com >

pkgbase=sqlitestudio
pkgname=(
  sqlitestudio
  sqlitestudio-plugins
)
_pkgname=SQLiteStudio
pkgver=3.4.4
pkgrel=1
_pkgver=3
pkgdesc='Database manager for SQLite'
arch=(i686 x86_64)
url='https://github.com/pawelsalawa/sqlitestudio'
# url='https://sqlitestudio.pl/'
license=('GPL3')
depends=(
  # termcap
  # sqlite2
  tcl
  python
  qt5-script
  qt5-declarative
  openssl # for sqlitecipher
)
makedepends=(
  pkgconf
  qt5-base
  qt5-svg
  qt5-tools
)
source=(
  ${url}/archive/refs/tags/${pkgver}.tar.gz
  v${pkgver}.patch::${url}/commit/364981e072039de1322a72c936e3747c462e57d4.patch
  sqlitestudio.desktop
)
noextract=(
  "${pkgver}.tar.gz"
)
sha256sums=('4a0b73401f8fc0a2a7f095dfcb487a83b3643adfe88fb7b53532bc6bc4ae04f1'
            '7bfd01ff5e7aea622006abfc23e3ce4c34d24132c5b3cc161c9b21e105d0d1c3'
            'c5a26a9b9003b04274887a0e0febda13eea49bb46c618eaad0b5b5c88b1cc1d2')

prepare(){
  cd "$srcdir"
  tar -xf ${pkgver}.tar.gz --strip-components=1
  patch -p1 < v${pkgver}.patch
}

build(){
  cd "$srcdir"
  install -dm755 "$srcdir"/output/build/Plugins

  msg2 "Making sqlitestudio3-main"
  cd "$srcdir"/output/build
  qmake ../../${_pkgname}${_pkgver} \
    "LIBS += -L$srcdir/SQLiteStudio3/coreSQLiteStudio/services/impl"
  make

  PYTHON3=`pkgconf --cflags python3` 
  msg2 "Making sqlitestudio3-plugins"
  cd "$srcdir"/output/build/Plugins
  GCC_VERSION=$(gcc -dumpversion)
  qmake ../../../Plugins \
    "INCLUDEPATH += /usr/include/c++/$GCC_VERSION" \
    "INCLUDEPATH += ${PYTHON3#*I}" \
    "INCLUDEPATH += $srcdir/SQLiteStudio3/coreSQLiteStudio"
  (
    cd $srcdir/Plugins/DbSqliteCipher
    ln -sf $srcdir/SQLiteStudio3/coreSQLiteStudio/plugins
    ln -sf $srcdir/SQLiteStudio3/coreSQLiteStudio/db
  )
  sed -i 's|python3.*9|python3.11|' $srcdir/Plugins/ScriptingPython/ScriptingPython.pro 
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
  depends=(sqlitestudio tcl python qt5-base qt5-declarative)

  cd $srcdir/output/build/Plugins
  make INSTALL_ROOT="$pkgdir/usr" install
}
