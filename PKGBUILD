# Code Author: Clelia Astra Bertelli
# Packager : Razgak

pkgname=arxiv-cli-opt
pkgver=1.0.0
pkgrel=1
pkgdesc='A Rust CLI to download papers from arXiv'
arch=('x86_64')
url='https://github.com/AstraBert/arxiv-cli'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo'  'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
options=('!lto' '!debug')
sha256sums=('31c0d15787e9f8b0afb9e434136c600cf5999eee78da64c0f09357acae505ff4')

prepare() {
  cd "$pkgname-$pkgver"

  #if [ ! -f Cargo.lock ]; then
    cargo generate-lockfile
  #fi

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # Binary
  export CARGO_PROFILE_RELEASE_LTO=fat
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  export CARGO_PROFILE_RELEASE_PANIC=abort
  export CARGO_PROFILE_RELEASE_OPT_LEVEL=3

  # Linker / CPU
  cargo clean
  RUSTFLAGS="${RUSTFLAGS} -C target-cpu=native -C link-arg=-Wl,-z,pack-relative-relocs" \
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
