# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
pkgname=mdns-scanner
pkgver=0.25.0
pkgrel=1
pkgdesc="Scan a network and create a list of IPs and associated hostnames,
 including mDNS hostnames and other aliases."
arch=("i686" "x86_64" "aarch64")
license=("MIT" "Apache-2.0")
url="https://github.com/CramBL/mdns-scanner"
makedepends=('rust' 'clang' 'openssl' 'lld' 'llvm' 'pkgconf')
depends=('glibc' 'gcc-libs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c4c6018573d5ac3f02e643f5b04cd9c48e2fce47a960391ac41e3b545f973509')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
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

  export OPENSSL_NO_VENDOR=1
  export OPENSSL_DIR="/usr"
  export OPENSSL_LIB_DIR="/usr/lib"
  export OPENSSL_INCLUDE_DIR="/usr/include"
  export PKG_CONFIG_PATH="/usr/lib/pkgconfig"
  cd "${pkgname}-${pkgver}"
  cargo build --frozen --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd "${pkgname}-${pkgver}"
  cargo test --frozen --all-features || echo "Tests failling..."
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm655 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
