#Maintainer: lubosz <lubosz@gmail.com>
#Contributor: socke <github@socker.lepus.uberspace.de>

pkgname=assimp-git
pkgver=5.1.0.r10655.gfe7321342
pkgrel=1
pkgdesc="Portable Open Source library to import various well-known 3D model formats in an uniform manner"
arch=(i686 x86_64)
url="https://www.assimp.org/"
license=('BSD')
depends=('boost' 'minizip')
makedepends=('cmake' 'git')
conflicts=('assimp')
provides=("assimp=${pkgver%.r*}")
options=(makeflags !emptydirs)
_gitname="assimp"
source=("git://github.com/assimp/assimp.git")
md5sums=('SKIP')


pkgver() {
  cd $_gitname
  printf "%s.r%s.g%s" \
  "$(grep -oP '^PROJECT\(Assimp VERSION \K[0-9.]*' CMakeLists.txt)" \
  "$(git rev-list --count HEAD)" \
  "$(git rev-parse --short HEAD)"
}

build() {
  cmake -S "$_gitname" -B build \
   -DCMAKE_INSTALL_PREFIX=/usr \
   -DCMAKE_BUILD_TYPE=Release
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
