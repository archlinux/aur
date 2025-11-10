pkgname=pawfetch-git
pkgver=2.0.6
pkgrel=1
pkgdesc="Neofetch with LGBTQ+ pride flags"
arch=('x86_64' 'aarch64')
url="https://git.pawlickers.org/nataliawolf/pawfetch"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('pawfetch')
conflicts=('pawfetch')
source=("git+https://git.pawlickers.org/nataliawolf/pawfetch.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/pawfetch"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/pawfetch"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/pawfetch"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/pawfetch"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/pawfetch"
  install -Dm755 "target/release/pawfetch" "$pkgdir/usr/bin/pawfetch"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
