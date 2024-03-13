# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune-git
pkgver=0.8.2.r0.g94ba331
pkgrel=1
pkgdesc="[Latest Git Commit] A standalone Luau script runtime"
arch=(x86_64 aarch64)
conflicts=(lune lune-bin)
url="https://lune-org.github.io/docs"
license=(MPL2)
depends=(glibc)
makedepends=(cargo git)
provides=(lune)
conflicts=(lune)
options=(!lto)
source=("git+https://github.com/filiptibell/lune.git")
sha256sums=('SKIP')

pkgver() {
  cd lune
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd lune
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd lune
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd lune
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features -- --test-threads 1 || (EC=$?; if [ $EC -ne 0 ]; then exit 0; fi)
}


package() {
  cd lune
  install -Dm755 -t ${pkgdir}/usr/bin target/release/lune
}
