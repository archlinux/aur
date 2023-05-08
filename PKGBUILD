# Maintainer: haxibami <contact at haxibami dot net>

pkgname=qdrant
pkgver=1.1.3
pkgrel=1
pkgdesc="Vector Database for the next generation of AI applications"
arch=('any')
url="https://github.com/qdrant/qdrant"
license=('Apache')
depends=('protobuf' 'clang' 'rocksdb')
makedepends=('cargo' 'cmake')
options=('!lto')
source=(
  "${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('6e83ed560aee4252cdc44808212ad7618a60c2c1248ebb3c02e4d08aa4254722')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch
}

build() {
  # librocksdb-sys 6.20.3 doesn't compile with gcc13, so instead use system rocksdb
  export ROCKSDB_LIB_DIR=/usr/lib
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "target/release/schema_generator" "${pkgdir}/usr/bin/schema_generator"
}
