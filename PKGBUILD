# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=trashy
pkgver=2.0.0
pkgrel=1
pkgdesc='a cli system trash manager, alternative to rm and trash-cli'
url="https://github.com/oberblastmeister/trashy"
license=('MIT' 'Apache')
arch=('x86_64' 'aarch64')
conflicts=('trash-cli')
depends_x86_64=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('72d620b4df9c2be0b9d0e17a73a26650afd28120a50180910ecc5e486011b0cb')
b2sums=('3c3d6cad52f7d8944b858cbf0a6aa636a86aa6c209d1fed4de5122b99506f193fd1ad68530bc2394b3f1f51dc27e98a29d0b323b65dc47dfcdfa000ad30f025e')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --all-features

  target/release/trash completions zsh > _trash.zsh
  target/release/trash completions bash > trash.bash
  target/release/trash completions fish > trash.fish
  target/release/trash manpage > trash.1
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/trash

  install -Dm0644 _trash.zsh "$pkgdir/usr/share/zsh/site-functions/_trash"
  install -Dm0644 trash.bash "$pkgdir/usr/share/bash-completion/completions/trash"
  install -Dm0644 trash.fish "$pkgdir/usr/share/fish/vendor_completions.d/trash.fish"
  install -Dm0644 trash.1 "$pkgdir/usr/share/man/man1/trash.1"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-{APACHE,MIT}
}
