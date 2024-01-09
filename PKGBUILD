# Maintainer: VVL <v@minakov.pro>

pkgname=openssl-gost
pkgver=v3.0.3.r0.ge0a500a
pkgrel=1
pkgdesc='A reference implementation of the Russian GOST crypto algorithms for OpenSSL'
url='https://github.com/gost-engine/engine/'
license=('Apache License 2.0')
arch=('x86_64')
depends=('openssl')
makedepends=('cmake' 'git')
source=("${pkgname}::git+https://github.com/gost-engine/engine.git" "openssl-gost.cnf" "openssl-gost.install")
install='openssl-gost.install'
sha256sums=('SKIP'
            '16239e09d47efb7c8c1e9d93e2499b7bbaaf340fac5c8a1581318c5221e920f9'
            '0a6111f2e1a28002ddb365b1241569b874f8f96b0ec49af033bb66240b4bf16e')

pkgver() {
  cd ${pkgname}
  (set -o pipefail
   git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
  cd ${pkgname}
  git submodule update --init
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  cmake --build . --config Release
}
package() {
  install -Dm644 openssl-gost.cnf "$pkgdir/etc/ssl/openssl-gost.cnf"
  install -Dm644 ${srcdir}/${pkgname}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd ${srcdir}/${pkgname}/build/bin
  install -Dm755 gost.so "$pkgdir/usr/lib/ssl/engines/libgost.so"
  install -Dm755 gostsum "$pkgdir/usr/bin/gostsum"
  install -Dm755 gost12sum "$pkgdir/usr/bin/gost12sum"
}
