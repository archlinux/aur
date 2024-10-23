# Maintainer: haxibami <contact at haxibami dot net>

pkgname=qdrant
pkgver=1.12.1
pkgrel=1
pkgdesc="Vector Database for the next generation of AI applications"
arch=('any')
url="https://github.com/qdrant/qdrant"
license=('Apache')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'cmake' 'mold' 'clang' 'protobuf')
source=(
  "${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('d0a7bcd891ac0ff71e5a4cf53567b3334394d7c03ce513d3a3e466966dd49957')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # note: (GCC +) mold or (Clang +) lld are required to build with LTO
  export RUSTFLAGS="${RUSTFLAGS} -Clink-arg=-fuse-ld=mold"
  # export CC=clang CXX=clang++ RUSTFLAGS="${RUSTFLAGS} -Clink-arg=-fuse-ld=lld"
  cargo build --release --bin qdrant
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
