# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=libasl
pkgver=0.1.3
pkgrel=1
pkgdesc='Multiphysics simulation software package (Advanced Simulation Library)'
arch=('i686' 'x86_64')
url='http://asl.org.il/'
license=('AGPL3')
depends=('vtk' 'libcl' 'boost')
makedepends=('cmake' 'opencl-headers')
optdepends=('libmatio: Matlab file format support (should be installed before build)')
conflicts=('libasl-git')
options=(!buildflags)
source=("$pkgname-$pkgver.tar.gz::https://github.com/AvtechScientific/ASL/archive/v${pkgver}.tar.gz")
sha256sums=('7d5214dcd0da84695fe967038f25ced9cbd02075515926f485003c7f915cf0cf')

prepare() {
  cd "$srcdir/ASL-$pkgver"
  # Add fpermissive flag to avoid some build issues
  # https://github.com/AvtechScientific/ASL/issues/2
  sed -i "s/set(CMAKE_CXX_STANDARD 11)/set(CMAKE_CXX_STANDARD 11)\n\tset(CMAKE_CXX_FLAGS "-fpermissive")/g" CMakeLists.txt
}

build() {
  cd "$srcdir/ASL-$pkgver"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -G "Unix Makefiles" ../
  make
}

package() {
  cd "$srcdir/ASL-$pkgver/build"
  make DESTDIR="$pkgdir/" install

  # Add LICENSE file
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
