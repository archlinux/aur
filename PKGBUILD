# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=claude-history
pkgver=0.1.68
pkgrel=1
pkgdesc="Fuzzy-search Claude Code conversation history from the terminal"
arch=('x86_64')
url="https://github.com/raine/claude-history"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/raine/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c7ad4c68337df872f12bad177a1b1d1c81599ae5ffd7569a8e0d17dec7eb6ed0')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # ring's C/asm objects produce undefined symbols when CFLAGS has -flto=auto
  # (Arch makepkg default). Disable LTO for ring's native compilation.
  export CFLAGS="${CFLAGS} -fno-lto"
  export CXXFLAGS="${CXXFLAGS} -fno-lto"
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
