# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=protonup-rs
pkgver=0.11.0
pkgrel=1
pkgdesc="Automate the installation and update of Linux Gaming Compatibility tools"
arch=('x86_64')
url="https://github.com/auyer/Protonup-rs"
license=('Apache-2.0')
depends=(
  'glibc'
  'xz'
)
makedepends=('cargo')
source=("Protonup-rs-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'cc-wrap')
sha256sums=('702a8506c0fc22b4d0bc015d75f43ac4ee07cbd424b84684b950869a302a0e0f'
            'd8d5350ef15f04cb18d1f111e7c8787384a7cbb1abd6ea34b18c73dfb966dbe6')

prepare() {
  cd "Protonup-rs-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "Protonup-rs-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # error "The CPU Jitter random number generator must not be compiled with 
  # optimizations. See documentation. Use the compiler switch -O0 for 
  # compiling jitterentropy.c."
  # The wrapper detects jitterentropy source files and forces -O0 at the very end.
  CC="$srcdir/cc-wrap" cargo build --frozen --release
}

package() {
  cd "Protonup-rs-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
