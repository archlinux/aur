# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=0.21.1
pkgrel=2
pkgdesc='Sophisticated Markdown rendering for the terminal'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/mdcat"
license=('MPL2')
depends=('openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('243fb64d72f4eee2350ab0db62c807b0e5092a4d39fb76f6d566c10687b723f1')

build() {
  cd "$pkgname-$pkgname-$pkgver"
  cargo build --release --locked --target-dir=target
}

check() {
  cd "$pkgname-$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  # Hard link binary as mdless. When invoked as mdless mdcat will paginate
  # output by default.
  ( cd "$pkgdir/usr/bin" && ln "$pkgname" mdless )

  # Required until https://github.com/rust-lang/cargo/issues/6790
  # Should never fail with extra-x86_64-build
  COMPLETIONS_DIR="$(find target/release/build -type d -path "target/release/build/mdcat-*/out/completions")"
  if [ ! "$(echo "$COMPLETIONS_DIR" | wc -l)" -eq 1 ]; then
    >&2 echo "Error: Unexpected count of completions dirs"
    return 1
  fi

  install -Dm644 "$COMPLETIONS_DIR/_mdcat" \
    "$pkgdir/usr/share/zsh/site-functions/_mdcat"
  install -Dm644 "$COMPLETIONS_DIR/mdcat.bash" \
    "$pkgdir/usr/share/bash-completion/completions/mdcat"
  install -Dm644 "$COMPLETIONS_DIR/mdcat.fish" \
    "$pkgdir/usr/share/fish/vendor_completions.d/mdcat.fish"
}
