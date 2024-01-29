# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ike Devolder <ike.devolder@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=taglib1
_pkgname=taglib
pkgver=1.13.1
pkgrel=1
pkgdesc='A Library for reading and editing the meta-data of several popular audio formats'
arch=(x86_64)
url='https://taglib.github.io/'
license=(LGPL-2.1-only
         MPL-1.1)
depends=(gcc-libs
         glibc
         sh
         zlib)
makedepends=(cmake
             utf8cpp)
checkdepends=(cppunit)
source=(https://taglib.github.io/releases/$_pkgname-$pkgver.tar.gz)
sha256sums=('c8da2b10f1bfec2cd7dbfcd33f4a2338db0765d851a50583d410bacf055cfd0b')

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr/lib/$pkgname \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG"
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  cd "${pkgdir}"
  # Move libs to /usr/lib, except the .so symlinks
  local f
  for f in usr/lib/$pkgname/lib/*; do
    if [[ $f == *.so ]]; then
      ln -srf -- usr/lib/"$(readlink "$f")" "$f"
    elif [[ ! -d $f ]]; then
      mv "$f" usr/lib
    fi
  done
}
