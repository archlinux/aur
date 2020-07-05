# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=0.20.0
pkgrel=1
pkgdesc='Sophisticated Markdown rendering for the terminal'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/mdcat"
license=('MPL2')
depends=('openssl')
conflicts=('mdcat-git')
makedepends=('cargo' 'jq')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('c62e3fbe7461410b72b3fd27dcaa543aa0bec99cbfd78c87aa8fe441972e79ff')

build() {
  cd "$pkgname-$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgname-$pkgver"

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
