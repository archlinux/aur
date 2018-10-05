# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Sphax <zecmerquise@gmail.com>

_pkgname=edyuk
pkgname=$_pkgname-svn
pkgver=r1053
pkgrel=4
pkgdesc="Fully-featured Qt4 IDE"
arch=('x86_64')
url="https://sourceforge.net/projects/edyuk/"
license=('GPL3')
depends=('qt4')
makedepends=('subversion')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::svn+https://svn.code.sf.net/p/edyuk/code/trunk)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd $pkgname
  sed -i 's|return m_handle ? m_handle->document() : false|return m_handle ? m_handle->document() != 0 : false|' \
                3rdparty/qcodeedit2/lib/document/qdocumentline.cpp
}

build() {
  cd $pkgname
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

  #mv "$pkgdir/usr/share/icons/"{default.kde,oxygen}
}

