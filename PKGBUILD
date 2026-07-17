# Maintainer: Jason Landbridge <JasonLandbridge at aur dot archlinux dot org>
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/qdrant

pkgname=qdrant
pkgver=1.18.3 # renovate: datasource=github-tags depName=qdrant/qdrant versioning=semver-coerced extractVersion=^v?(?<version>.*)$
pkgrel=1
pkgdesc="Vector Database for the next generation of AI applications"
arch=('x86_64')
url="https://qdrant.tech"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'cmake' 'mold' 'clang' 'protobuf')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/qdrant/qdrant/archive/v${pkgver}.tar.gz"
)
sha256sums=('c5f918b4f37279ec00b22b718ca54bca7b43c9d17628b28b8eba363beceb0c96')

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
