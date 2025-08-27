# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=duckduckgo-chat-cli
pkgver=1.2.2
pkgrel=1
pkgdesc='A powerful CLI tool to interact with DuckDuckGo’s AI'
url='https://github.com/benoitpetit/duckduckgo-chat-cli'
license=('MIT')
makedepends=('go')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
source=("https://github.com/benoitpetit/duckduckgo-chat-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('c46f8b52802b89f86bcbf94db7f983b5fe870bffd4dad453e356fbd3113a5a85c1e73d4c53e2a7a27e4fe9329890f9f6317b5e30758ef6d6efd6490022867957')

build() {
  export GOPATH="$srcdir"
  cd $pkgname-$pkgver
  PATH="$PATH:$GOPATH/bin"
  ./scripts/generate-docs.sh

  go build \
    -ldflags "-X main.Version=v$pkgver -linkmode external -extldflags \"${LDFLAGS}\"" \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -o "$pkgname" \
    ./cmd/duckchat/main.go
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
