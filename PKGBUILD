# Maintainer: Stick <stick@stma.is>

pkgname=go-template-lsp
pkgver=0.4.0
pkgrel=1
pkgdesc='LSP for the Go template engine'
arch=('x86_64' 'aarch64')
url='https://github.com/yayolande/go-template-lsp'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('24546b8849cbac45dfe666e94924c46759c3916c98ef0679dd3c9b1c5ca6f033')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  export GOPATH="$srcdir/gopath"
  go mod tidy
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"
  export GOPATH="$srcdir/gopath"
  go build -o build/ .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
