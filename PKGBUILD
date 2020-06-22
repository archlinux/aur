# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=0.19.0
pkgrel=1
pkgdesc='Sophisticated Markdown rendering for the terminal'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/mdcat"
license=('MPL2')
depends=('openssl')
conflicts=('mdcat-git')
makedepends=('cargo' 'jq')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('2e50dbb8f80b74dbed1cc69c731d8c782df35f2e968fc833b11640272d00f3cf')

build() {
  cd "$pkgname-$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable \
    cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgname-$pkgver"

  RUSTUP_TOOLCHAIN=stable
  OUT_DIR="$(cargo build --release --locked --message-format=json-render-diagnostics | \
    jq -r 'select(.out_dir) | select(.package_id | startswith("mdcat ")) | .out_dir')"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$OUT_DIR/completions/_mdcat" \
    "$pkgdir/usr/share/zsh/site-functions/_mdcat"
  install -Dm644 "$OUT_DIR/completions/mdcat.bash" \
    "$pkgdir/usr/share/bash-completion/completions/mdcat"
  install -Dm644 "$OUT_DIR/completions/mdcat.fish" \
    "$pkgdir/usr/share/fish/vendor_completions.d/mdcat.fish"
}
