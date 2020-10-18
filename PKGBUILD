# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=0.22.1
pkgrel=2
pkgdesc='Sophisticated Markdown rendering for the terminal'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/mdcat"
license=('MPL2')
depends=('openssl')
makedepends=('cargo' 'asciidoctor')
optdepends=('librsvg: used to render SVG images in kitty')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('b14846542fb8b60ac0235b399136372df7569aa59ed63f3faf88ff7a485abe5f')

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

  MANPAGE="$COMPLETIONS_DIR/../mdcat.1"
  gzip "$MANPAGE"
  install -Dm 644 "$MANPAGE.gz" \
    "$pkgdir/usr/share/man/man1/mdcat.1.gz"
}
