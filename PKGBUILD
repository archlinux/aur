# Maintainer: xscriptor <x@xscriptor.com>
pkgname=xtop-git
_pkgname=xtop
pkgver=r7.37fae84
pkgrel=1
pkgdesc="A btop-like system monitor written in Rust for X"
arch=('x86_64')
url="https://github.com/xscriptordev/xtop"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgname"
  
  # Instalar binario
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # Instalar licencia y readme
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
