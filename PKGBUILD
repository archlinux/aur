# Maintainer: Bartek Kryza <bkryza at gmail dot com>

pkgname=clang-uml
pkgver=0.6.2
pkgrel=1
pkgdesc="Customizable automatic UML diagram generator for C++ based on Clang."
url="https://github.com/bkryza/clang-uml"
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bkryza/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('cd55114749d3fa274a70fa58a896c44d2777b66df9c0c69e7c8d6069dd640117cf920251a87d77bbd0dc751145ab74ddaa34dc028b9f0363a9797b80e6c0f1d9')
arch=('x86_64')
depends=("clang<22.0" gcc-libs glibc "llvm-libs<22.0" yaml-cpp)
makedepends=("cmake" "llvm<22.0" "ninja")

build() {
  rm -rf build
  cmake -Wno-dev -GNinja -S"${pkgname}-${pkgver}" -Bbuild --install-prefix /usr -DBUILD_TESTS=OFF -DGIT_VERSION=${pkgver}
  cmake --build build
}

check() {
  ${srcdir}/build/src/clang-uml --version
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -v -D -t ${pkgdir}/usr/share/bash-completions/completions/ ${srcdir}/${pkgname}-${pkgver}/packaging/autocomplete/clang-uml 
  install -v -D -t ${pkgdir}/usr/share/zsh/site-functions/ ${srcdir}/${pkgname}-${pkgver}/packaging/autocomplete/_clang-uml 
}

# vim:set ts=2 sw=2 et:
