# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ente-cli
pkgver=0.1.18
pkgrel=1
pkgdesc="A Command Line Utility for exporting data from Ente."
arch=('x86_64' 'aarch64')
url="https://ente.io"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ente-io/ente/archive/refs/tags/cli-v$pkgver.tar.gz")
sha256sums=('438c5478346b9a6ef8f7e073d0061be15dc3831348b6823ca82f784aadcd3bfb')

prepare(){
  cd "$pkgname-v$pkgver/cli"
  mkdir -p build/
}

build() {
  cd "$pkgname-v$pkgver/cli"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath"
  go build -v \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X main.AppVersion=${pkgver} -s -w" \
    -o "build/$pkgname" main.go
}

check() {
  cd "$pkgname-v$pkgver/cli"
  export GOPATH="$srcdir/gopath"
  go test ./...

  # Clean module cache for makepkg -C
  go clean -modcache
}

package() {
  cd "$pkgname-v$pkgver/cli"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin/"
}
