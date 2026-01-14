# Contributor: haxibami <contact at haxibami dot net>
# Contributor: tee < teeaur at duck dot com >

pkgname=qdrant
pkgver=1.16.3
pkgrel=1
pkgdesc="Vector Database for the next generation of AI applications"
arch=('x86_64')
url="https://github.com/qdrant/qdrant"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'cmake' 'mold' 'clang' 'protobuf')
source=(
  "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=('38acd9ad284c8446e82d1d00037d08afa9c347e674a1ed023d62206df6432cb4')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # note: (GCC +) mold or (Clang +) lld are required to build with LTO
  export RUSTFLAGS="${RUSTFLAGS} -Clink-arg=-fuse-ld=mold"
  # export CC=clang CXX=clang++ RUSTFLAGS="${RUSTFLAGS} -Clink-arg=-fuse-ld=lld"
  export CXXFLAGS="$CXXFLAGS -include cstdint"
  cargo build --release --bin qdrant
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
