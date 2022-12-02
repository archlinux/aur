# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=0.30.3
pkgrel=1
pkgdesc='Sophisticated Markdown rendering for the terminal'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/mdcat"
license=('MPL2')
options=(!lto)
depends=('gcc-libs')
makedepends=('asciidoctor'
             'cargo')
optdepends=('less: for mdless'
            'librsvg: used to render SVG images in kitty')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('e4f96b9df490d1a1b11d8a7c84ef5636b242d3f3d5fe5fae1ab53847a80a7eba')

prepare() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  cargo build --frozen --release --target-dir=target
}

check() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgname}-${pkgver}"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  # Hard link binary as mdless. When invoked as mdless mdcat will paginate
  # output by default.
  ( cd "$pkgdir/usr/bin" && ln "$pkgname" mdless )

  # Required until https://github.com/rust-lang/cargo/issues/6790
  # Should never fail with extra-x86_64-build
  OUT_DIR="$(find target/release/build -type d -path "target/release/build/mdcat-*/out")"
  if [ ! "$(echo "$OUT_DIR" | wc -l)" -eq 1 ]; then
    >&2 echo "Error: Unexpected count of out dirs"
    return 1
  fi

  install -Dm644 "$OUT_DIR/completions/_mdcat" "$pkgdir/usr/share/zsh/site-functions/_mdcat"
  install -Dm644 "$OUT_DIR/completions/mdcat.bash" "$pkgdir/usr/share/bash-completion/completions/mdcat"
  install -Dm644 "$OUT_DIR/completions/mdcat.fish" "$pkgdir/usr/share/fish/vendor_completions.d/mdcat.fish"
  install -Dm644 "$OUT_DIR/completions/_mdless" "$pkgdir/usr/share/zsh/site-functions/_mdless"
  install -Dm644 "$OUT_DIR/completions/mdless.bash" "$pkgdir/usr/share/bash-completion/completions/mdless"
  install -Dm644 "$OUT_DIR/completions/mdless.fish" "$pkgdir/usr/share/fish/vendor_completions.d/mdless.fish"

  MANPAGE="$OUT_DIR/mdcat.1"
  gzip -n "$MANPAGE"
  install -Dm644 "$MANPAGE.gz" "$pkgdir/usr/share/man/man1/mdcat.1.gz"
}
