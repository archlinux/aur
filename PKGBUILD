# Maintainer: Kuba Ellwart <kuba@hop.io>

pkgname=hop-cli
pkgver=0.2.40
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Interact with Hop in your terminal"
url="https://hop.io"
license=('MPL-2.0')
source=("hop_cli-$pkgver.tar.gz::https://github.com/hopinc/cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("a91a8c7c69bea528c9c97a0324ef9572e3e61b648f6daa617718a7e5cd70ec0a")

prepare() {
  cd "$srcdir/cli-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-musl"
}

build() {
  cd "$srcdir/cli-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$srcdir/cli-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$srcdir/cli-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/hop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/hop" 
  
  # generate completions
  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir"/usr/bin/hop completions bash > "$pkgdir/usr/share/bash-completion/completions/hop"
  chmod 644 "$pkgdir/usr/share/bash-completion/completions/hop"

  mkdir -p "$pkgdir/usr/share/fish/completions"
  "$pkgdir"/usr/bin/hop completions fish > "$pkgdir/usr/share/fish/completions/hop.fish"
  chmod 644 $pkgdir/usr/share/fish/completions/hop.fish

  mkdir -p "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir"/usr/bin/hop completions zsh > "$pkgdir/usr/share/zsh/site-functions/_hop"
  chmod 644 $pkgdir/usr/share/zsh/site-functions/_hop
}
