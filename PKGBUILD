# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=rojo-git
pkgver=7.6.0.r1.gcd78f5c0
pkgrel=1
pkgdesc="[Latest Git Commit] Rojo enables Roblox developers to use professional-grade software engineering tools"
arch=(x86_64 aarch64)
conflicts=(rojo rojo-bin)
url="https://rojo.space/"
license=(MPL2)
depends=(gcc-libs glibc)
makedepends=(cargo git)
provides=(rojo)
options=(!lto)
source=("git+https://github.com/rojo-rbx/rojo.git")
sha256sums=('SKIP')

pkgver() {
  cd rojo
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd rojo
  git checkout master
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd rojo 
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd rojo 
  export RUSTUP_TOOLCHAIN=stable
  cargo test --locked --verbose
}


package() {
  cd rojo
  install -Dm755 -t ${pkgdir}/usr/bin target/release/rojo
}

