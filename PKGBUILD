# Maintainer: 9M2PJU <9m2pju@gmail.com>
# Source build of Nib — a complete PDF toolkit that runs entirely on your own machine.
# Upstream: https://github.com/daniel-alexander4/nib
pkgname=nib
pkgver=2.50.4
pkgrel=1
pkgdesc='Complete PDF toolkit that runs entirely on your own machine (fill, OCR, redact, compare, sign, PDF/A)'
arch=('x86_64' 'aarch64')
url='https://github.com/daniel-alexander4/nib'
license=('AGPL3')
depends=('hicolor-icon-theme')
makedepends=('go')
optdepends=(
  'chromium: UI in app mode (or any Chromium-family browser / firefox via xdg-open)'
  'xdg-utils: open-in-browser fallback'
  'libreoffice: Office → PDF conversion'
  'ghostscript: PDF/A conversion and PostScript import'
  'poppler: export the current page as SVG (pdftocairo)'
  'libheif: HEIC/HEIF photo import (heif-dec/heif-convert)'
)
provides=('nib')
conflicts=('nib-bin' 'nib-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/daniel-alexander4/nib/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5588bf40bbb19f7e35febe6b2d2713a0e919297d4bcdc966b514f9610694c7a5')

build() {
  cd "$pkgname-$pkgver"
  CGO_ENABLED=0 go build -trimpath -ldflags "-s -w -X main.version=$pkgver" -o nib ./cmd/nib
}

check() {
  cd "$pkgname-$pkgver"
  # Full suite needs optional corpora (veraPDF, producers); the version stamp is the load-bearing check.
  ./nib version
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 nib "$pkgdir/usr/bin/nib"
  install -Dm0644 build/nib.desktop "$pkgdir/usr/share/applications/nib.desktop"
  install -Dm0644 build/nib.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/nib.svg"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 THIRD-PARTY-NOTICES.md "$pkgdir/usr/share/doc/$pkgname/THIRD-PARTY-NOTICES.md"
}
