# Maintainer: 9M2PJU <9m2pju@gmail.com>
# Nib development snapshot, built from upstream git HEAD.
# Upstream: https://github.com/daniel-alexander4/nib
pkgname=nib-pdf-git
pkgver=2.50.4.r0.g0000000
pkgrel=1
pkgdesc='Complete PDF toolkit that runs entirely on your own machine (fill, OCR, redact, compare, sign, PDF/A) — git snapshot'
arch=('x86_64' 'aarch64')
url='https://github.com/daniel-alexander4/nib'
license=('AGPL3')
depends=('hicolor-icon-theme')
makedepends=('go' 'git')
optdepends=(
  'chromium: UI in app mode (or any Chromium-family browser / firefox via xdg-open)'
  'xdg-utils: open-in-browser fallback'
  'libreoffice: Office → PDF conversion'
  'ghostscript: PDF/A conversion and PostScript import'
  'poppler: export the current page as SVG (pdftocairo)'
  'libheif: HEIC/HEIF photo import (heif-dec/heif-convert)'
)
provides=('nib')
conflicts=('nib' 'nib-bin' 'nib-git')
source=('git+https://github.com/daniel-alexander4/nib.git')
sha256sums=('SKIP')

pkgver() {
  cd nib
  base="$(cat VERSION 2>/dev/null || echo 0.0.0)"
  printf '%s.r%s.g%s' "$base" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd nib
  CGO_ENABLED=0 go build -trimpath -ldflags "-s -w -X main.version=$(cat VERSION 2>/dev/null || echo dev)" -o nib ./cmd/nib
}

package() {
  cd nib
  install -Dm0755 nib "$pkgdir/usr/bin/nib"
  install -Dm0644 build/nib.desktop "$pkgdir/usr/share/applications/nib.desktop"
  install -Dm0644 build/nib.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/nib.svg"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 THIRD-PARTY-NOTICES.md "$pkgdir/usr/share/doc/$pkgname/THIRD-PARTY-NOTICES.md"
}
