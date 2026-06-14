# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=litehtml0.9
pkgver=0.9
pkgrel=2
pkgdesc='Fast and lightweight HTML/CSS rendering engine'
url='http://www.litehtml.com/'
arch=(x86_64)
license=(BSD-3-Clause)
depends=(glibc
         gumbo-parser
         libgcc
         libstdc++)
makedepends=(cmake
             git)
source=(git+https://github.com/litehtml/litehtml#tag=v$pkgver
        coinstallability.patch)
sha256sums=('75eca510af3a80fb429a6ec926ec883cfb73ab3aefb7b3cd867fb585d43ed387'
            '819c4b2d8a02a215c50387c7b9e1df6f693a600322c5a5f5a0ef128b4e292d72')

prepare() {
  cd litehtml
  patch -p1 < ../coinstallability.patch # Make package coinstallable with newer versions
}

build() {
  cmake -B build -S litehtml \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DEXTERNAL_GUMBO=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DLITEHTML_BUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 litehtml/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
# Don't search for non-existant gumbo cmake config
  sed -e '/gumbo/d' -i "$pkgdir"/usr/lib/cmake/litehtml0.9/litehtmlConfig.cmake
# Add compatibility cmake target
  echo "add_library(litehtml ALIAS litehtml0.9)" >> "$pkgdir"/usr/lib/cmake/litehtml0.9/litehtmlTargets.cmake
# Fix include dir
  sed -e 's|litehtml/|litehtml0.9/|g' -i "$pkgdir"/usr/include/litehtml0.9/litehtml.h
}
