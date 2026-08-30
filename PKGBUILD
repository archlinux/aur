# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=kasetto
pkgver=3.8.0
pkgrel=1
pkgdesc="A declarative AI agent environment manager, written in Rust"
arch=('x86_64')
url="https://github.com/pivoshenko/kasetto"
license=('MIT' 'Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pivoshenko/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5990a88603cfdf705f13439ea6fe9d0ebb45be14bf26ec37b686fb58044e8a47')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # ring's C/asm objects produce undefined symbols when CFLAGS has -flto=auto
  # (Arch makepkg default). Disable LTO for ring's native compilation.
  export CFLAGS="${CFLAGS} -fno-lto"
  export CXXFLAGS="${CXXFLAGS} -fno-lto"
  cargo build --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/kasetto "$pkgdir/usr/bin/kasetto"
  install -Dm755 target/release/kst "$pkgdir/usr/bin/kst"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"

  cd "$pkgdir"
  ./usr/bin/kasetto completions bash | install -Dm644 /dev/stdin usr/share/bash-completion/completions/kasetto
  ./usr/bin/kasetto completions zsh | install -Dm644 /dev/stdin usr/share/zsh/site-functions/_kasetto
  ./usr/bin/kasetto completions fish | install -Dm644 /dev/stdin usr/share/fish/vendor_completions.d/kasetto.fish
}
