#Maintainer: Lubosz Sarnecki <lubosz@gmail.com> 

_realname=libkeyfinder
pkgname=$_realname-git
pkgver=2.1.0.227.2f868b2
pkgrel=1
pkgdesc="Musical key detection for digital audio."
arch=('i686' 'x86_64')
url="http://www.ibrahimshaath.co.uk/keyfinder/"
license=('GPL3')
depends=('qt5-base' 'fftw' 'boost-libs') 
makedepends=('git' 'boost')
provides=($_realname)
conflicts=($_realname)

_gitname=libKeyFinder

source=("git://github.com/ibsh/libKeyFinder.git" "0001-make-prefix-usr.patch")
sha256sums=("SKIP" '499cc00f55dbe89fe9dde5864ec0121106c00118a0b9f4a87f81fd95495e8c9b')
  
pkgver() {
  cd $_gitname
  VERSION=$(grep VERSION LibKeyFinder.pro | sed 's/VERSION = //')
  REVISION=$(git rev-list --count master)
  HASH=$(git rev-parse --short master)
  echo $VERSION.$REVISION.$HASH
}

build() {
  cd $_gitname
  git am ../../0001-make-prefix-usr.patch
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd $_gitname
  make INSTALL_ROOT="${pkgdir}" install
  mkdir -p ${pkgdir}/usr/include/keyfinder
  cp ${srcdir}/${_gitname}/*.h ${pkgdir}/usr/include/keyfinder
}
