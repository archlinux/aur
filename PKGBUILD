# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=kibi-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A tiny text editor, written in Rust"
url="https://github.com/ilai-deutel/kibi"
makedepends=('slsa-verifier')
depends=('gcc-libs' 'glibc')
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
sha256sums_x86_64=('8039228b5231a0c925b8948aecc24d0e22b2ae58a73f8da25384fb18376abbd1'
                   'SKIP'
                   'be0358f92b0e49304ab5bf4766a6e4b9b440cf4b360167bb80b87ce106d33c88')
sha256sums_i686=('77f83de4007ce38a4c4cc159675355ceadbd2a35e4c716922190e9a2d609d5cb'
                 'SKIP'
                 '20ed3bb1c7a5fd1edb45591cc2f2a7a90da6c14418b31412a123da4221277134')
sha256sums_aarch64=('77f83de4007ce38a4c4cc159675355ceadbd2a35e4c716922190e9a2d609d5cb'
                    'SKIP'
                    '20ed3bb1c7a5fd1edb45591cc2f2a7a90da6c14418b31412a123da4221277134')
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
  cd "kibi-v${pkgver}-$CARCH-unknown-linux-gnu"

  # Install binary
  install -Dm755 "kibi" -t "$pkgdir/usr/bin"

  # Install configuration files
  install -Dm644 "config_example.ini" "$pkgdir/etc/kibi/config.ini"
  install -Dm644 syntax.d/* -t "$pkgdir/usr/share/kibi/syntax.d"

  # Install license
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
