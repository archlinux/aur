# Maintainer: Bartek Kryza <bkryza at gmail dot com>

pkgname=clang-uml
pkgver=0.6.1
pkgrel=1
pkgdesc="Customizable automatic UML diagram generator for C++ based on Clang."
url="https://github.com/bkryza/clang-uml"
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bkryza/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('7dfe913b75b311b8f464bb4caad2b441764ac6db64fb6a7a9c04756b0af521d320f5b035785d00f370987947ec34fdf4ba2fc2ca47847ec7175c1394ffe66c97')
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
