# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=trashy
pkgver=1.0.3
pkgrel=2
pkgdesc='a cli system trash manager, alternative to rm and trash-cli'
url="https://github.com/oberblastmeister/trashy"
license=('MIT' 'Apache')
arch=('x86_64' 'aarch64')
conflicts=('trash-cli')
depends_x86_64=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('1035c43152d6c42340e0d5bf47793531230c51beae28fe579aa5a225a45cbe38')
b2sums=('cf84ae297da891bd6a1011829b0807931a8d3ede948781d1e033ff6196f3aca57f86f8e88d33f8a27f97d3744410a79ccee72e437f45c64e78c75e47c06fc5a9')

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
