pkgname=marxist-quote
pkgver=0.2.1
_wikiquotefetcherver=1.0.1
pkgrel=1
pkgdesc="Graphical settings UI for Marxist Quote"
arch=('x86_64')
url="https://github.com/efebaykaraa/marxist-quote"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'gtk4'
  'libadwaita'
  'pango'
  'cairo'
  'glib2'
  'hicolor-icon-theme'
)
makedepends=('cargo')
optdepends=('desktop-file-utils: update desktop entry cache during install hooks')
install=marxist-quote.install
options=('!lto')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "wikiquote-fetcher-${_wikiquotefetcherver}.tar.gz::https://github.com/efebaykaraa/wikiquote-fetcher/archive/refs/tags/v${_wikiquotefetcherver}.tar.gz"
)
sha256sums=('SKIP'
            'SKIP')

prepare() {
  ln -sfn "$srcdir/wikiquote-fetcher-$_wikiquotefetcherver" "$srcdir/wikiquote-fetcher"
  cd "$srcdir/marxist-quote-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked
}

build() {
  cd "$srcdir/marxist-quote-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  unset RUSTFLAGS
  export RUSTFLAGS=
  unset CARGO_ENCODED_RUSTFLAGS
  export CARGO_ENCODED_RUSTFLAGS=
  export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=/usr/bin/gcc
  export CC=gcc

  cargo build --release --locked --offline
}

package() {
  cd "$srcdir/marxist-quote-$pkgver"

  install -Dm755 target/release/marxist-quote-gui "$pkgdir/usr/bin/marxist-quote-gui"
  install -Dm755 target/release/marxist-quote-background "$pkgdir/usr/bin/marxist-quote-background"
  ln -s marxist-quote-gui "$pkgdir/usr/bin/marxist_quote"

  install -Dm644 assets/marxist_quote.desktop \
    "$pkgdir/usr/share/applications/marxist_quote.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for size in 16 24 32 48 64 128 256; do
    for icon in \
      "assets/icons/hicolor/${size}x${size}/apps/marxist-quote.png" \
      "assets/icons/hicolor/${size}x${size}/apps/marxist_quote_${size}.png" \
      "assets/icons/hicolor/${size}x${size}/marxist-quote.png" \
      "assets/icons/hicolor/${size}x${size}/marxist_quote_${size}.png"; do
      if [ -f "$icon" ]; then
        install -Dm644 "$icon" \
          "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/marxist-quote.png"
        break
      fi
    done
  done

  for icon in \
    assets/icons/hicolor/scalable/apps/marxist-quote.svg \
    assets/icons/hicolor/scalable/apps/marxist_quote.svg \
    assets/icons/hicolor/scalable/marxist-quote.svg \
    assets/icons/hicolor/scalable/marxist_quote.svg; do
    if [ -f "$icon" ]; then
      install -Dm644 "$icon" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/marxist-quote.svg"
      break
    fi
  done

  install -Dm644 assets/desktop-quote.service \
    "$pkgdir/usr/lib/systemd/user/desktop-quote.service"
  install -Dm644 assets/marxist-quote-fetch.service \
    "$pkgdir/usr/lib/systemd/user/marxist-quote-fetch.service"
  install -Dm644 assets/marxist-quote-fetch.timer \
    "$pkgdir/usr/lib/systemd/user/marxist-quote-fetch.timer"
}
