# Maintainer: haxibami <contact at haxibami dot net>

pkgname=qdrant
pkgver=1.14.1
pkgrel=1
pkgdesc="Vector Database for the next generation of AI applications"
arch=('x86_64')
url="https://github.com/qdrant/qdrant"
license=('Apache')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'cmake' 'mold' 'clang' 'protobuf')
source=(
  "${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('e029eeeb4dc303d531fd5d553b7351f50de97c27732a939f4bee9815580edc02')

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
