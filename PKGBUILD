# Maintainer: Your Name <your.email@example.com>

pkgname=nmtui-go
pkgver=0.2.5
pkgrel=1
pkgdesc="A TUI for managing NetworkManager Wi-Fi connections on Linux"
arch=('x86_64')
url="https://github.com/doeixd/nmtui-go"
license=('MIT')
depends=('networkmanager')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/doeixd/nmtui-go/archive/v$pkgver.tar.gz")
sha256sums=('d4d366d221e9d6073e8c47fc1799e0ff1a0441217c69287ed14d2869a92f89d8')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/nmtui-go ./cmd
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/nmtui-go "$pkgdir/usr/bin/nmtui-go"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
