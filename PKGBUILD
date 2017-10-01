# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=qt1
pkgver=1.45
pkgrel=1
pkgdesc="Historical copy of Qt 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://github.com/KDE/qt1"
license=("custom:Qt Free Edition License")
depends=("libx11" "libxext") # TODO : Fill
_commit="78811a56cc111d17f42221566e7e4430d5de8d40"
source=("https://github.com/KDE/$pkgname/archive/$_commit.tar.gz")
sha256sums=('cf745bb7a40f4fe2c830f3ece3133853eb5d99280e6b108852c4655e83fa30af')

prepare() {
  cd $srcdir/$pkgname-$_commit
  mkdir -p lib
  find . -name "*.o" -delete
}

build() {
  # TODO : Fix package not building the second time (workaround with the find command in "prepare")
  cd $srcdir/$pkgname-$_commit
  export QTDIR=$(pwd)
  make linux-g++-shared
  make
}

_qt1_prefix="opt/qt1"
_qt1_libdir="$_qt1_prefix/lib"
_qt1_bindir="$_qt1_prefix/bin"
_qt1_includedir="$_qt1_prefix/include"

package() {
  # Stuff from the fedora spec file
  cd $srcdir/$pkgname-$_commit
  mkdir -p $pkgdir/$_qt1_bindir
  mkdir -p $pkgdir/$_qt1_libdir
#  mkdir -p $pkgdir/usr/man # disabled because it is apparently not needed
  install -s -m 755 bin/moc $pkgdir/$_qt1_bindir/moc
  cp lib/libqt.so.$pkgver $pkgdir/$_qt1_libdir
  ln -sf libqt.so.$pkgver $pkgdir/$_qt1_libdir/libqt.so.1
  ln -sf libqt.so.1 $pkgdir/$_qt1_libdir/libqt.so
  mkdir -p $pkgdir/$_qt1_libdir/qt $pkgdir/$_qt1_includedir/qt
  mkdir -p $pkgdir/$_qt1_libdir/qt/html $pkgdir/$_qt1_libdir/qt/tutorial
  mkdir -p $pkgdir/$_qt1_libdir/qt/examples
  cp -fR html $pkgdir/$_qt1_libdir/qt
  strip tutorial/*/* || :
  strip examples/*/* || :
  cp -fR tutorial $pkgdir/$_qt1_libdir/qt
  cp -fR examples $pkgdir/$_qt1_libdir/qt
  cp -fR include/. $pkgdir/$_qt1_includedir/qt
  for a in $pkgdir/$_qt1_libdir/qt/*/*/Makefile ; do
    sed 's-^SYSCONF_MOC.*-SYSCONF_MOC   = %{_qt1_bindir}/moc-' < $a > ${a}.2
    mv -v ${a}.2 $a
  done
  rm $pkgdir/$_qt1_libdir/qt/*/*/*.o # is this neccessary?
  chmod -R a+r $pkgdir/$_qt1_libdir/libqt.so* $pkgdir/$_qt1_libdir/qt

  # Stuff from me (for Arch)
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
