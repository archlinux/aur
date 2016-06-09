# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname='solvespace-git'
pkgver=r795.1e2f199
pkgrel=1
pkgdesc="SOLVESPACE is a parametric 3d CAD program."
arch=('i686' 'x86_64')
url='http://solvespace.com/'
license=('GPL3')
depends=('libpng' 'json-c' 'glew' 'gtkmm')
# awwm moved away from fltk
makedepends=('git' 'cmake')
source=('solvespace-git::git+https://github.com/solvespace/solvespace.git')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  #git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  git submodule update --init extlib/libdxfrw
}

# -std=c++11 or -std=gnu++11

build() {
  cd "$pkgname"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_CXX_FLAGS="-std=c++11" ../
  sed -i 's/lib64/lib/' src/cmake_install.cmake
  make
}

package() {
  cd "$pkgname/build"
  make DESTDIR="$pkgdir" install
}

