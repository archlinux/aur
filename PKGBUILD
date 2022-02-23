# Maintainer: Wiktor W. <wykwit@disroot.org>

pkgname=redress
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool for analyzing stripped Go binaries"
arch=('any')
url="https://github.com/goretk/redress"
license=('AGPL')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('687024d91a18ea1097137e29d804f3b605130dd75ec7d8598c837b1f40876ff5')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  cd "$pkgname-$pkgver"
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags="-s -w -X main.redressVersion=$pkgver -extldflags $LDFLAGS" \
    -o $pkgname
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}

