# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Sphax <zecmerquise@gmail.com>

_pkgname=edyuk
pkgname=$_pkgname-svn
pkgver=r1053 
pkgrel=2
pkgdesc="Fully-featured Qt4 IDE"
arch=('i686' 'x86_64')
url="http://www.edyuk.org"
license=('GPL3')
depends=('qt4')
makedepends=('subversion')
provides=($_pkgname)
conflicts=($_pkgname)
install=$pkgname.install
source=($pkgname::svn+http://edyuk.svn.sf.net/svnroot/edyuk/trunk
        installpri.patch)
md5sums=('SKIP'
         '66ce655bc8ad981f724150b06aea9ae4')

pkgver() {
  cd $pkgname
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd $pkgname

  # Fix path to Qt mkspecs directory
  # Fix directory for icons on KDE4
  patch -Np0 -i ../installpri.patch

  qmake-qt4
  make

  # Second run of qmake, needed for lib directory to be installed correctly
  qmake-qt4
}

package() {
  cd $pkgname
  make INSTALL_ROOT="$pkgdir" install

  # All libs files are installed as binary, but only libedyuk.so.1.0.0
  # is supposed to be a binary, the others are supposed to be symlinks
  # Fix this now because of ldconfig reporting an error when installing
  # with pacman
  cd "$pkgdir/usr/lib"
  rm libedyuk.{so,so.1,so.1.1}
  ln -s libedyuk.so.1.1.0 libedyuk.so.1.1
  ln -s libedyuk.so.1.1.0 libedyuk.so.1
  ln -s libedyuk.so.1.1.0 libedyuk.so

  # When 'update-mime-database /usr/share/mime' is called with mime file 'edyuk.xml' installed,
  # it causes firefox and thunderbird (with kparts plugin) to crash when launched
  rm -r "$pkgdir/usr/share/mime/"

  # Cannot install in a directory path that contains a symlink (/usr/share/icons/default.kde4)
  mv "$pkgdir/usr/share/icons/"{default.kde4,oxygen}
}

