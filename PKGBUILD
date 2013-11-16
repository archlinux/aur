# Maintainer: Raimar Sandner <raimar.sandner@uibk.ac.at>

pkgname=cppqed-git
pkgver=59.228d379
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64')
url="http://www.sourceforge.net/projects/blitz/"
license=('GPL2')
depends=('gcc-libs' 'boost' 'blitz-cppqed-hg' 'flens-cvs')
makedepends=('git' 'gcc' 'cmake')
optdepends=()
provides=('cppqed')
conflicts=('cppqed')
source=("${pkgname}"::'git://git.code.sf.net/p/cppqed/cppqed#branch=Development')
md5sums=('SKIP')

pkgver() {
   cd "${pkgname}"
   echo "$(git rev-list --count HEAD).$(git describe --always )"
}

build() {
  cd "${pkgname}"
  git submodule update --init
  mkdir $srcdir/$pkgname/build_release
  mkdir $srcdir/$pkgname/build_debug
  cd $srcdir/$pkgname/build_release
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DEXAMPLES=Off ..
  make
  cd $srcdir/$pkgname/build_debug
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug -DEXAMPLES=Off ..
  make
}

package() {
  cd $srcdir/$pkgname/build_release
  make DESTDIR=$pkgdir install || return 1
  cd $srcdir/$pkgname/build_debug
  make DESTDIR=$pkgdir install || return 1
}


