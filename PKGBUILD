# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Sphax <zecmerquise@gmail.com>

pkgname=edyuk-svn
pkgver=r1053
pkgrel=5
pkgdesc="Fully-featured Qt4 IDE"
arch=('x86_64')
url="https://sourceforge.net/projects/edyuk/"
license=('GPL3')
depends=('qt4')
makedepends=('subversion')
provides=("${pkgname%-svn}")
conflicts=("${pkgname%-svn}")
source=($pkgname::svn+https://svn.code.sf.net/p/edyuk/code/trunk
        build.sh)
sha256sums=('SKIP'
            '7d448cbc365fe68535df15ac710973979be154a4177d664d2595ede406d36def')

pkgver() {
  cd $pkgname
  local version
  version="$(svnversion)"
  printf "r%s" "${version//[[:alpha:]]}"
}

prepare() {
  cd $pkgname
  sed -i 's|return m_handle ? m_handle->document() : false|return m_handle ? m_handle->document() != 0 : false|' \
                3rdparty/qcodeedit2/lib/document/qdocumentline.cpp
}

build() {
  cd $pkgname

  # This script runs all the build steps, even if a build step fails
  ../build.sh
}

package() {
  cd $pkgname
  make INSTALL_ROOT="$pkgdir" install

  # All libs files are installed as binary, but only libedyuk.so.1.0.0 is supposed to be a binary,
  # the others are supposed to be symlinks
  # Fix this now because of ldconfig reporting an error when installing with pacman
  cd "$pkgdir/usr/lib"
  rm libedyuk.{so,so.1,so.1.1}
  ln -s libedyuk.so.1.1.0 libedyuk.so.1.1
  ln -s libedyuk.so.1.1.0 libedyuk.so.1
  ln -s libedyuk.so.1.1.0 libedyuk.so

  # When 'update-mime-database /usr/share/mime' is called with mime file 'edyuk.xml' installed,
  # it causes firefox and Thunderbird (with kparts plugin) to crash when launched
  rm -r "$pkgdir/usr/share/mime/"

  #mv "$pkgdir/usr/share/icons/"{default.kde,oxygen}
}

