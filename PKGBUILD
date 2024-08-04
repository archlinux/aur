# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=2.3.1
pkgrel=1
pkgdesc='Sophisticated Markdown rendering for the terminal'
arch=('i686' 'x86_64')
url="https://github.com/swsnr/mdcat"
license=('MPL-2.0')
options=(!lto)
depends=('gcc-libs' 'openssl')
makedepends=('asciidoctor'
             'cargo')
optdepends=('less: for mdless')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('5dbee35f8b582bb3a023133fc564103e49d16f10a62e7a07ddf29a06fa2d48f5')

prepare() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  cargo build --frozen --release --target-dir=target
  asciidoctor -b manpage -a reproducible -o mdcat.1 mdcat.1.adoc
}

check() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgname}-${pkgver}"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  # Link binary as mdless. When invoked as mdless mdcat will paginate
  # output by default.
  ln -sf mdcat "$pkgdir/usr/bin/mdless"

  mkdir -p "$pkgdir/usr/share/bash-completion/completions" \
    "$pkgdir/usr/share/zsh/site-functions/" \
    "$pkgdir/usr/share/fish/vendor_completions.d/"
  for binary in mdcat mdless; do
    "$pkgdir/usr/bin/$binary" --completions bash > "$pkgdir/usr/share/bash-completion/completions/$binary"
    "$pkgdir/usr/bin/$binary" --completions zsh > "$pkgdir/usr/share/zsh/site-functions/_$binary"
    "$pkgdir/usr/bin/$binary" --completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/$binary.fish"
  done

  gzip -n mdcat.1
  install -Dm644 mdcat.1.gz "$pkgdir/usr/share/man/man1/mdcat.1.gz"
  ln -sf mdcat.1.gz "$pkgdir/usr/share/man/man1/mdless.1.gz"
}
