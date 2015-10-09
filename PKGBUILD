# Maintainer: Piotr Rogoza <piotr.r.public at gmail dot com>
# Contributor: Piotr Rogoa <piotr.r.public at gmail dot com>

pkgname=sqlitestudio
_pkgname=SQLiteStudio
pkgver=3.0.6
_pkgver=3
pkgrel=4
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
case $CARCH in
  i686)
    depends+=(gcc-libs)
    ;;
  x86_64)
    depends+=(gcc-libs-multilib)
    ;;
esac
install='sqlitestudio.install'

source=(
http://sqlitestudio.pl/files/sqlitestudio${_pkgver}/complete/tar/sqlitestudio-$pkgver.tar.gz
sqlitestudio.desktop
tclconfig.diff
utils.diff
db.diff
cli_config.diff
)
sha256sums=('7b376b0adb3ec2b284d7dbea3115a436f4d567c1e43e28f36cf872355978b3d5'
            'c5a26a9b9003b04274887a0e0febda13eea49bb46c618eaad0b5b5c88b1cc1d2'
            'f63b112d42bc670ab95a264ee1d82acdefad34733c18554b17801fa5c2f56bae'
            '10f8ed73488b30efbcce563fb8dc6bc8b11a6511f42e5e0f8c7f9cab360dd855'
            '6e162788b3df1d60145fe982ce7db1a22dd1ac37f5d100736281e4ccb66510f6'
            '29b7ba8e453ce091f634e5a0a921dd01e5190a34f5a84b670e8ae6c3b820c865')

prepare(){
  cd "$srcdir"
  patch -p1 -i tclconfig.diff
  patch -p1 -i utils.diff
  patch -p1 -i db.diff
  patch -p1 -i cli_config.diff

}
build(){
  cd "$srcdir"

  install -dm755 $srcdir/output/build
  cd $srcdir/output/build
  qmake ../../${_pkgname}${_pkgver}
  make

  install -dm755 $srcdir/output/build/Plugins
  cd $srcdir/output/build/Plugins
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
}
