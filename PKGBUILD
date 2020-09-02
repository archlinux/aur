# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=0.21.1
pkgrel=1
pkgdesc='Sophisticated Markdown rendering for the terminal'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/mdcat"
license=('MPL2')
depends=('openssl')
conflicts=('mdcat-git')
makedepends=('cargo' 'jq')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('243fb64d72f4eee2350ab0db62c807b0e5092a4d39fb76f6d566c10687b723f1')

build() {
  cd "$pkgname-$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgname-$pkgver"

  OUT_DIR="$(cargo build --release --locked --message-format=json-render-diagnostics | \
    jq -r 'select(.out_dir) | select(.package_id | startswith("mdcat ")) | .out_dir')"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  # Hard link binary as mdless. When invoked as mdless mdcat will paginate
  # output by default.
  ( cd "$pkgdir/usr/bin" && ln "$pkgname" mdless )
  install -Dm644 "$OUT_DIR/completions/_mdcat" \
    "$pkgdir/usr/share/zsh/site-functions/_mdcat"
  install -Dm644 "$OUT_DIR/completions/mdcat.bash" \
    "$pkgdir/usr/share/bash-completion/completions/mdcat"
  install -Dm644 "$OUT_DIR/completions/mdcat.fish" \
    "$pkgdir/usr/share/fish/vendor_completions.d/mdcat.fish"
}
