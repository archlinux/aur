# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>
# Contributor: Kohei Suzuki <eagletmt@gmail.com>
pkgname=jsonnetfmt
pkgver=0.19.1
pkgrel=1
pkgdesc='The data templating language, formatter'
arch=('x86_64')
url='https://jsonnet.org'
license=('Apache')
depends=('gcc-libs' 'nlohmann-json')
makedepends=('gtest')
checkdepends=('python')
# conflicts=(jsonnet) but go-jsonnet-git provides jsonnet thus this can not conflict, jsonnet should be a spit for jsonnetfmt
source=("jsonnet-${pkgver}.tar.gz::https://github.com/google/jsonnet/archive/v${pkgver}.tar.gz")
sha512sums=('21312de71f63f4a74005f563290d67fcc2d220f043291a123af2fc834f4118f8bbc311ea8acc5dd52b13eff8c32f026a5ce6bfe3d88b4c6c770e585dd1f0b688')


build() {
  cd "$srcdir/jsonnet-$pkgver"

  mkdir -p build
  cd build
  cmake -DBUILD_JSONNET=OFF -DBUILD_JSONNETFMT=ON -DUSE_SYSTEM_GTEST=ON -DUSE_SYSTEM_JSON=OFF -Wno-dev -DCMAKE_INSTALL_PREFIX='/usr' ..
  cmake --build .
}

check() {
  cd "$srcdir/jsonnet-$pkgver"

  mkdir -p build
  cd build
  ctest --test-dir . --output-on-failure
}

package() {
  cd "jsonnet-$pkgver"

  install -D -m755 build/jsonnetfmt "$pkgdir/usr/bin/jsonnetfmt"
  install -D -m644 include/libjsonnet_fmt.h "$pkgdir/usr/include/libjsonnet_fmt.h"
}

