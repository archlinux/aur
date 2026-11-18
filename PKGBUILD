# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>
# Contributor: Kohei Suzuki <eagletmt@gmail.com>
pkgname=jsonnetfmt
pkgver=0.22.0
pkgrel=1
pkgdesc='The data templating language, formatter'
arch=('x86_64')
url='https://jsonnet.org'
license=('Apache')
depends=('gcc-libs' 'nlohmann-json')
checkdepends=('python')
# conflicts=(jsonnet) but go-jsonnet-git provides jsonnet thus this can not conflict, jsonnet should be a spit for jsonnetfmt
source=("jsonnet-${pkgver}.tar.gz::https://github.com/google/jsonnet/archive/v${pkgver}.tar.gz")
sha512sums=('5f076f741b131bc920d316d2857e58fa9797e8d010104660a07db066cbb1c459c7fcc29f2c5f3e5165ff41c2cc1b57a253dfc4d94bd0127500f00d34ea4d5577')


build() {
  cd "$srcdir/jsonnet-$pkgver"

  mkdir -p build
  cd build
  cmake -DBUILD_JSONNET=OFF -DBUILD_JSONNETFMT=ON -DBUILD_TESTS=OFF -DUSE_SYSTEM_JSON=OFF -DBUILD_MAN_PAGES=OFF -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -Wno-dev -DCMAKE_INSTALL_PREFIX='/usr' ..
  cmake --build .
}

check() {
  cd "$srcdir/jsonnet-$pkgver"

  export JSONNETFMT_BIN="$PWD/build/jsonnetfmt"
  bash test_suite/run_fmt_tests.sh
  bash test_suite/run_fmt_idempotence_tests.sh
}

package() {
  cd "jsonnet-$pkgver"

  install -D -m755 build/jsonnetfmt "$pkgdir/usr/bin/jsonnetfmt"
  install -D -m644 include/libjsonnet_fmt.h "$pkgdir/usr/include/libjsonnet_fmt.h"
}

