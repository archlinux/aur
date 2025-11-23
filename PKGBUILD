# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=kibi-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="A tiny text editor, written in Rust"
url="https://github.com/ilai-deutel/kibi"
makedepends=('slsa-verifier')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme')
conflicts=('kibi')
provides=('kibi')
arch=('x86_64' 'i686' 'aarch64')
license=('MIT OR Apache-2.0')
backup=('etc/kibi/config.ini')
source_x86_64=(
  "https://github.com/ilai-deutel/kibi/releases/download/v${pkgver}/kibi-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
  "https://github.com/ilai-deutel/kibi/releases/download/v${pkgver}/kibi-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz.asc"
  "https://github.com/ilai-deutel/kibi/releases/download/v${pkgver}/kibi-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz.intoto.jsonl"
)
source_i686=(
  "https://github.com/ilai-deutel/kibi/releases/download/v${pkgver}/kibi-v${pkgver}-i686-unknown-linux-gnu.tar.gz"
  "https://github.com/ilai-deutel/kibi/releases/download/v${pkgver}/kibi-v${pkgver}-i686-unknown-linux-gnu.tar.gz.asc"
  "https://github.com/ilai-deutel/kibi/releases/download/v${pkgver}/kibi-v${pkgver}-i686-unknown-linux-gnu.tar.gz.intoto.jsonl"
)
source_aarch64=(
  "https://github.com/ilai-deutel/kibi/releases/download/v${pkgver}/kibi-v${pkgver}-i686-unknown-linux-gnu.tar.gz"
  "https://github.com/ilai-deutel/kibi/releases/download/v${pkgver}/kibi-v${pkgver}-i686-unknown-linux-gnu.tar.gz.asc"
  "https://github.com/ilai-deutel/kibi/releases/download/v${pkgver}/kibi-v${pkgver}-i686-unknown-linux-gnu.tar.gz.intoto.jsonl"
)
source=(
  "kibi-v${pkgver}.desktop::https://raw.githubusercontent.com/ilai-deutel/kibi/refs/tags/v${pkgver}/kibi.desktop"
  "kibi-v${pkgver}-logo.svg::https://raw.githubusercontent.com/ilai-deutel/kibi/refs/tags/v${pkgver}/assets/logo.svg"
)
b2sums_x86_64=('0c8f5b26c65bb37e3e8af22c3b6952748bfb3f0ffb9ac28f8e1fba962cb16b686bff5d945bf8b8a464b6a7cf3bb800eecb140f2086b806be37b50b9a164d8f16'
               'SKIP'
               '8e33f4ff24c901a5ce32d37e2871afb924a41e0c617a2b6458abff379715b09d385febbd630877e755e7f8a0d318491f8f8614d8f4558df635401ffe34839267')
b2sums_i686=('aeec9516213773c5ff8b2301d22022122e6f1bb20c99f0b1b6395380a77efaf3f5daeadfa18d2bf7178f4c0f90665c4a21d4c8357487204988451ff5e80deba7'
             'SKIP'
             'd8666d5b39dabb82a97ad7a98e0b11447d824f6ac5b40a896180e471b0587bbb213e15d762fa0a66068f32add9f0d37c6e53f00315f1729ccbcbb4d3c7b57096')
b2sums_aarch64=('aeec9516213773c5ff8b2301d22022122e6f1bb20c99f0b1b6395380a77efaf3f5daeadfa18d2bf7178f4c0f90665c4a21d4c8357487204988451ff5e80deba7'
                'SKIP'
                'd8666d5b39dabb82a97ad7a98e0b11447d824f6ac5b40a896180e471b0587bbb213e15d762fa0a66068f32add9f0d37c6e53f00315f1729ccbcbb4d3c7b57096')
b2sums=('ca4e7f576b5de45da07697f59313fdcc9c2ac249816ca2260a509939ec28c085f4fcf607b3ff7cdc9d4a5f5cf7f7bb94486b09a9d8374c48dc2af0d2a0fb973c'
        '1a322e1f15404ec19f733f3880289b33e40609bd2ab29dd660bfe58740a3609cfa2c0a3bd1311711e10936a5d6e3177eb7d905c74d7d51a130a01a5f7fd4361c')
validpgpkeys=(
  '102588418FF7E165696490A206E8A973494808A2'  # Ilaï Deutel
)
options=(
  "!strip"  # Symbols already stripped upstream
)

verify() {
  slsa-verifier verify-artifact \
    "kibi-v${pkgver}-$CARCH-unknown-linux-gnu.tar.gz" \
    --provenance-path "kibi-v${pkgver}-$CARCH-unknown-linux-gnu.tar.gz.intoto.jsonl" \
    --source-uri "github.com/ilai-deutel/kibi" \
    --source-versioned-tag "v${pkgver}"
}

package() {
  # Install binary
  install -Dm755 "kibi-v${pkgver}-$CARCH-unknown-linux-gnu/kibi" -t "$pkgdir/usr/bin"

  # Install configuration files
  install -Dm644 "kibi-v${pkgver}-$CARCH-unknown-linux-gnu/config_example.ini" "$pkgdir/etc/kibi/config.ini"
  install -Dm644 "kibi-v${pkgver}-$CARCH-unknown-linux-gnu/syntax.d"/* -t "$pkgdir/usr/share/kibi/syntax.d"

  # Install desktop file and logo
  install -Dm644 "kibi-v${pkgver}.desktop" "$pkgdir/usr/share/applications/kibi.desktop"
  install -Dm644 "kibi-v${pkgver}-logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/kibi.svg"

  # Install license
  install -Dm644 "kibi-v${pkgver}-$CARCH-unknown-linux-gnu/LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname"
}
