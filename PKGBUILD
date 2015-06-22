#Maintainer: lubosz <lubosz@gmail.com>
#Contributor: socke <github@socker.lepus.uberspace.de>

pkgname=assimp-git
pkgver=3.0.1.1629.b65b380
pkgrel=1
pkgdesc="Portable Open Source library to import various well-known 3D model formats in an uniform manner"
arch=(i686 x86_64)
url="http://assimp.sourceforge.net/"
license=('BSD')
depends=('boost')
makedepends=('git')
conflicts=()
options=(makeflags !emptydirs)
_gitname="assimp"
source=("git://github.com/assimp/assimp.git")
md5sums=('SKIP')


pkgver() {
  cd $_gitname
  
  major=$(grep "set (ASSIMP_VERSION_MAJOR" CMakeLists.txt | sed 's/set (ASSIMP_VERSION_MAJOR //' | sed 's/)//')
  minor=$(grep "set (ASSIMP_VERSION_MINOR" CMakeLists.txt | sed 's/set (ASSIMP_VERSION_MINOR //' | sed 's/)//')
  patch=$(grep "set (ASSIMP_VERSION_PATCH" CMakeLists.txt | sed 's/set (ASSIMP_VERSION_PATCH //' | sed 's/) # subversion revision?//')
  
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  
  echo $major.$minor.$patch.$revision.$hash
}

build() {
  cd $_gitname
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd $_gitname
  make DESTDIR=$pkgdir install
}
