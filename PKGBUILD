# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
pkgname=ddv
pkgver=0.3.0
pkgrel=1
pkgdesc="terminal user interface DynamoDB Viewer"
arch=("i686" "x86_64" "aarch64")
license=("MIT")
url="https://github.com/lusingander/ddv"
makedepends=('rust' 'cargo' 'clang' 'lld' 'llvm' 'pkgconf')
depends=('glibc' 'gcc-libs')
source=("${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b6f594da2cab9af5c5905cdee08770ade9676f4f1158f9038e26f3b39f3a4a19')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  #export RUSTFLAGS="-Z linker-features=-lld"
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  export CC=clang
  export CXX=clang++
  export AR=llvm-ar
  export RANLIB=llvm-ranlib
  export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=clang
  export RUSTFLAGS="-C link-arg=-fuse-ld=lld -C target-feature=-crt-static"

  cd "${pkgname}-${pkgver}"
  cargo build --frozen --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd "${pkgname}-${pkgver}"
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm655 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
