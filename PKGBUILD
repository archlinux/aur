# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ente-cli
pkgver=0.1.16
pkgrel=1
pkgdesc="A Command Line Utility for exporting data from Ente."
arch=('x86_64' 'aarch64')
url="https://ente.io"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ente-io/ente/archive/refs/tags/cli-v$pkgver.tar.gz")
sha256sums=('c358fd6c2a9ad2394de17bd50bfeaeb3c9153a5cd8af215d902ac09856700e9a')

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
