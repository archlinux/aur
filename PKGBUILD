# Maintainer: Kristyan Carvalho <kristyancarvalho@hotmail.com>
pkgname=tux-letter
pkgver=3.1.1
pkgrel=1
pkgdesc="AI-assisted Linux and open-source newsletter service"
arch=('x86_64' 'aarch64')
url="https://github.com/kristyancarvalho/tux-letter"
license=('MIT')
makedepends=('go')
options=('!debug' '!lto')
source=("$pkgname-$pkgver-src.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver-src.tar.gz")
sha256sums=('0771952c015be4c0b934b4cec16fb025423c8b161801741ed381c7bec6d063dc')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  local ldflags="-s -w"
  ldflags+=" -X ${url#https://}/internal/version.Version=$pkgver"
  ldflags+=" -X ${url#https://}/internal/version.Commit=aur"
  ldflags+=" -X ${url#https://}/internal/version.Date=unknown"
  go build -ldflags "$ldflags" -o tux-letter ./cmd/tux-letter
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 tux-letter "$pkgdir/usr/bin/tux-letter"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 tux-letter.example.toml "$pkgdir/usr/share/doc/$pkgname/tux-letter.example.toml"
}
