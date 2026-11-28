# Maintainer: Joop Kiefte <ikojba at gmail dot com>
pkgname=lexington
pkgver=1.67.3
pkgrel=1
pkgdesc="Screenplay converter: Fountain, Final Draft, PDF, HTML, LaTeX, DOCX/ODT and more"
arch=('x86_64' 'aarch64')
url="https://github.com/LaPingvino/lexington"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('pandoc-cli: EPUB and other pandoc output formats'
            'wkhtmltopdf: HTML-to-PDF conversion (-to htmlpdf)'
            'texlive-latex: LaTeX-to-PDF conversion (-to latexpdf)'
            'calibre: e-book formats through ebook-convert'
            'tesseract: reading scanned PDFs with OCR')
# the tag's commit and its time, as the release builds stamp them
_commit=5547d6e63d76d96c44d774895520695c9c47d445
_date=2026-11-28T15:50:12Z
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8e91d15f0c5bde77aacc82c4b533c3e57b31fb6a74830552b54ab3410abb0ae7')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -buildvcs=false"
  go build -ldflags "-linkmode=external -X main.version=v$pkgver -X main.commit=$_commit -X main.date=$_date" \
    -o lexington .
}

check() {
  cd "$pkgname-$pkgver"
  ./lexington -version 2>&1 | grep -qF "Lexington version v$pkgver (commit: $_commit"
  printf 'INT. KITCHEN - DAY\n\nANNA\nHello.\n' > check.fountain
  ./lexington check.fountain check.celtx
  ./lexington check.celtx check-back.fountain
  grep -qx 'INT. KITCHEN - DAY' check-back.fountain
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 lexington "$pkgdir/usr/bin/lexington"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
}
