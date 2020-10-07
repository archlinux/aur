# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=openjpeg-git
pkgver=2.3.0.r2.gacd91508
pkgrel=2
pkgdesc="An open-source JPEG 2000 codec written in C language"
arch=('i686' 'x86_64')
url="https://github.com/uclouvain/openjpeg"
license=('BSD')
depends=('glibc' 'zlib' 'libpng' 'libtiff' 'lcms2')
makedepends=('git' 'cmake' 'doxygen')
provides=('openjpeg2')
conflicts=('openjpeg2')
options=('staticlibs')
source=("git+https://github.com/uclouvain/openjpeg.git")
sha256sums=('SKIP')


prepare() {
  cd "openjpeg"

  # Install doxygen docs to the right directory
  sed -i 's:DESTINATION\ share/doc:DESTINATION\ share/doc/openjpeg2:' "doc/CMakeLists.txt"
}

pkgver() {
  cd "openjpeg"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "openjpeg"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DBUILD_DOC=ON \
    ./
  make -C "_build"
}

package() {
  cd "openjpeg"

  make -C "_build" DESTDIR="$pkgdir" install

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/openjpeg2"
  rm -r "$pkgdir/usr/share/doc"/openjpeg-2.*
}
