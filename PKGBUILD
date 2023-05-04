# Maintainer: haxibami <contact at haxibami dot net>

pkgname=qdrant
pkgver=1.1.2
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
sha256sums=('8847dc7fe3336b2ed601772c966d6bac642bff87fe97da046122d2ef351ea284')

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
