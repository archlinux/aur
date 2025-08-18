# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>
# Contributor: Kohei Suzuki <eagletmt@gmail.com>
pkgname=jsonnetfmt
pkgver=0.21.0
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
sha512sums=('4fc39bd5e138623ba1ac7cf88594ea7957e9c3bcb952f0e9e346059a9de08eac3f60788376c31a70b34d6d522737a67ad4a122fadcd9621868722c23d9361d05')


build() {
  cd "$srcdir/jsonnet-$pkgver"

  mkdir -p build
  cd build
  cmake -DBUILD_JSONNET=OFF -DBUILD_JSONNETFMT=ON -DUSE_SYSTEM_GTEST=ON -DUSE_SYSTEM_JSON=OFF -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -Wno-dev -DCMAKE_INSTALL_PREFIX='/usr' ..
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

