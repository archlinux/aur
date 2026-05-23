# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com

pkgname=perplexityai-bumblebee
pkgver=0.1.1
pkgrel=1
pkgdesc="Read-only inventory collector for package, extension, and developer-tool metadata on developer endpoints, built for fast supply-chain exposure checks"
arch=(x86_64 aarch64)
url="https://github.com/perplexityai/bumblebee"
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('559a5fa9ca48128fb113644e7800048b0b6c2ff3a33bc56fe5236582ba1686b0')

build() {
  cd "bumblebee-$pkgver"
  export CGO_ENABLED=0
  go build \
    -trimpath \
    -ldflags "-s -w -X main.Version=v$pkgver" \
    -o bumblebee \
    ./cmd/bumblebee
}

check() {
  cd "bumblebee-$pkgver"
  go test ./...
}

package() {
  cd "bumblebee-$pkgver"
  install -Dm755 bumblebee "$pkgdir/usr/bin/bumblebee"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 SECURITY.md "$pkgdir/usr/share/doc/$pkgname/SECURITY.md"
  cp -r docs "$pkgdir/usr/share/doc/$pkgname/docs"
  cp -r threat_intel "$pkgdir/usr/share/doc/$pkgname/threat_intel"
}
