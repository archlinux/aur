# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=openjpeg-git
pkgver=2.2.0.r9.g0b4c3ce7
pkgrel=1
pkgdesc="An open-source JPEG 2000 codec written in C language"
arch=('i686' 'x86_64')
url="https://github.com/uclouvain/openjpeg"
license=('BSD')
depends=('glibc' 'zlib' 'libpng' 'libtiff' 'lcms2')
makedepends=('git' 'cmake' 'doxygen')
provides=('openjpeg2')
conflicts=('openjpeg2')
source=("git+https://github.com/uclouvain/openjpeg.git")
sha256sums=('SKIP')


prepare() {
  cd "openjpeg"

  mkdir -p "build"

  # Install doxygen docs to the right directory
  sed -i -e "s:DESTINATION\ share/doc:DESTINATION\ share/doc/openjpeg2:" "doc/CMakeLists.txt"
}

pkgver() {
  cd "openjpeg"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "openjpeg/build"

  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release -DBUILD_DOC=on ../
  make
}

package() {
  cd "openjpeg/build"

  make DESTDIR="$pkgdir" install

  install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/openjpeg2/LICENSE"
  rm -r "$pkgdir/usr/share/doc/openjpeg-2.2"
}
