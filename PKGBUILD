# Maintainer: Wiktor W. <wykwit@disroot.org>

pkgname=redress
pkgver=0.7.5
pkgrel=1
pkgdesc="A tool for analyzing stripped Go binaries"
arch=('any')
url="https://github.com/goretk/redress"
license=('AGPL')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('d31907e105278fcb33d3418bda780ad2ea904a3bd5d3d01a064d0ad90a08d9fc')

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

