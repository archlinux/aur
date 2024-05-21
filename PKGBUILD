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
source=("$pkgname-$pkgver.tar.gz::https://github.com/oberblastmeister/trashy/archive/refs/tags/v$pkgver.tar.gz"
        Cargo.lock)
sha256sums=('efdcb0eb913855b5339d2b464a1944f1c506143d65ecf85771dfe5419ef4f387'
            '7a301a20bb6bc1d45110d44f97dd5e8f889fa60546dcd2529bc0979794fe56d6')
b2sums=('babdf4caeceaff85d481926d0fc872637910e17d9aa7b0a37b26a3e437cc2f950d785a961b399f3eb93c0466134406904b0fca66ac8ba400e29de9e3ef935bf1'
        'b611051264d4cc0467c35e3a4b4f0aa2f657f1c98af9ddc15e1de4c41dea1c8cb407ae07bafadd546f65e0e5b7ddb9620c578fc7fa288c52e2a0374609f47454')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cp -T "$srcdir/Cargo.lock" Cargo.lock
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
