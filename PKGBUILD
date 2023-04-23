# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=testdisk-wip
pkgver=7.2
pkgrel=2
pkgdesc="Checks and undeletes partitions. Includes PhotoRec signature based recovery tool. WIP version"
arch=('i686' 'x86_64')
url="http://www.cgsecurity.org/wiki/TestDisk"
license=('GPL')
depends=('libjpeg')
optdepends=('libewf: support EnCase files'
            'ntfs-3g: support NTFS partitions'
            'qt5-base: QPhotoRec GUI')
makedepends=('qt5-tools')
conflicts=('testdisk')
provides=('testdisk')
source=(http://www.cgsecurity.org/testdisk-$pkgver-WIP.tar.bz2)
#md5sums=('5d239865543019227c4ac5052066da6f')
md5sums=('SKIP')  # they update the source without changing the filename...

prepare() {
  cd "$srcdir/testdisk-$pkgver-WIP"

  # Some fixes to make it Qt5 capable
  sed -i '/<QWidget>/d' src/*.h
  sed -i '/<QWidget>/d' src/*.cpp
  sed -i 's/Qt::escape\(.*\)text())/QString\1text()).toHtmlEscaped()/g' src/qphotorec.cpp

  ## You might not need these, but I did for some reason
  test -f src/gnome/help-about.png || cp /usr/share/icons/gnome/48x48/actions/help-about.png src/gnome/
  test -f src/gnome/image-x-generic.png || cp /usr/share/icons/gnome/48x48/mimetypes/image-x-generic.png src/gnome/
}

build() {
  cd "$srcdir/testdisk-$pkgver-WIP"
  export QTGUI_LIBS="$(pkg-config Qt5Widgets --libs)"
  export QTGUI_CFLAGS="-fPIC $(pkg-config Qt5Widgets --cflags)"

  # add --disable-qt if you do not have qt5-base
  ./configure --prefix=/usr --enable-sudo
  make
}

package() {
  cd "$srcdir/testdisk-$pkgver-WIP"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
