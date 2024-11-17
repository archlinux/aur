# Maintainer: haxibami <contact at haxibami dot net>

pkgname=qdrant
pkgver=1.12.3
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
sha256sums=('11b7eabebd49fcb75cad73a2af89c991f6daa24a29274b0ed249aa4f56f18e03')

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
