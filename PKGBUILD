# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=kibi-bin
pkgver=0.3.3
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
b2sums_x86_64=('6c93e60611030f5786d9e26be22f6481c22085852d789614c732afb3d255cec1388c4a689093c2c0caecbfb54c4a33f4be3a0b1798a7b1adfffc101790adb94e'
               'SKIP'
               '62d6454b10216f63aa86b7c2473098c7ae5fefd96e8bc6f8e1c2a87821c699752fabd3ed7a8500fe85ecffe30cc0bab1c7b94a072184e51af50066a59fc2d371')
b2sums_i686=('daab578a49e251403b0ae8440546c6844cc8613e1e733f456bc8cd6a718abb62e5b03858df694ca9e738eaae654c826eb99300e1a27a6f7151b3a97f957218f3'
             'SKIP'
             'd329eb7e0f35111c2f23cbd6a651f35637252bdc7377b3527b9d14d4f3b3caedc60dc9840115c1c0b46f77a6f3c0201050f0dc4d44ed7a312ea702df21a5729c')
b2sums_aarch64=('daab578a49e251403b0ae8440546c6844cc8613e1e733f456bc8cd6a718abb62e5b03858df694ca9e738eaae654c826eb99300e1a27a6f7151b3a97f957218f3'
                'SKIP'
                'd329eb7e0f35111c2f23cbd6a651f35637252bdc7377b3527b9d14d4f3b3caedc60dc9840115c1c0b46f77a6f3c0201050f0dc4d44ed7a312ea702df21a5729c')
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
  cd "kibi-v${pkgver}-$CARCH-unknown-linux-gnu/"

  # Install binary
  install -Dm755 kibi -t "$pkgdir/usr/bin"

  # Install configuration files
  install -Dm644 config_example.ini "$pkgdir/etc/kibi/config.ini"
  install -Dm644 syntax.d/* -t "$pkgdir/usr/share/kibi/syntax.d"

  # Install desktop file and logo
  install -Dm644 kibi.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 kibi.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/kibi.svg"

  # Install license
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
