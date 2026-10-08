# Maintainer: Han <tabularasa8931@gmail.com>
pkgname=gorae
pkgver=2.6.0
pkgrel=1
pkgdesc="Terminal-first knowledge base for PDFs, EPUBs, and Markdown — with a built-in AI assistant"
arch=('x86_64')
url="https://github.com/Han8931/gorae"
license=('MIT')
depends=('poppler')
makedepends=('go>=1.21' 'git')
optdepends=(
  'chafa: ASCII/sixel preview fallback for non-Kitty/iTerm2 terminals'
  'zathura: recommended PDF viewer with vi-style navigation'
  'zathura-pdf-mupdf: MuPDF backend for zathura'
)
# Pinned to the release tag rather than a release tarball: this PKGBUILD is
# itself inside the tag, so a checksum of that tarball would be a checksum of a
# file containing itself and could never be written correctly.
source=("$pkgname::git+https://github.com/Han8931/gorae.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  mkdir -p build/
}

build() {
  cd "$pkgname"
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -buildvcs=false"
  go build -ldflags="-s -w" -o "build/$pkgname" ./cmd/gorae
}

package() {
  cd "$pkgname"
  install -Dm755 "build/$pkgname"   "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md          "$pkgdir/usr/share/doc/$pkgname/README.md"
}
