# Maintainer: Joop Kiefte <ikojba at gmail dot com>
pkgname=lexington
pkgver=1.26.2
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4c5975c14a95741057d31cdc6f0a1d133c5b02b872f30567f874a8845fe2c4b9')

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
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-linkmode=external -X main.version=$pkgver" -o lexington .
}

check() {
  cd "$pkgname-$pkgver"
  ./lexington -version 2>&1 | grep -q "version $pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 lexington "$pkgdir/usr/bin/lexington"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
}
