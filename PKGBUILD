# Maintainer: Bartek Kryza <bkryza at gmail dot com>

pkgname=clang-uml
pkgver=0.5.5
pkgrel=1
pkgdesc="Customizable automatic UML diagram generator for C++ based on Clang."
url="https://github.com/bkryza/clang-uml"
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bkryza/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('05098dcba5f51c3e33be28faedb267671a90102d669fb13af52b87e48d5c8f3189772abafe6c83c7ae04f772250654d6536b12d8b45591b55bf3c6ee150a603f')
arch=('x86_64')
depends=("clang<20.0" gcc-libs glibc "llvm-libs<20.0" yaml-cpp)
makedepends=("cmake" "llvm<20.0" "ninja")

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
