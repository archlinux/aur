# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=anycable-go
pkgdesc="AnyCable WebSocket Server written in Go"
pkgver=1.0.2
pkgrel=1
arch=('i686' 'x86_64')
url="http://anycable.io"
license=('MIT')
makedepends=('go' 'rsync')
source=("https://github.com/anycable/anycable-go/archive/v${pkgver}.tar.gz")
sha256sums=('bf2304768b1ca032d4413c567bfb7e445650c491b0d8471fb4cc78d4746287ef')

# See https://wiki.archlinux.org/index.php/Go_package_guidelines
prepare(){
  mkdir -p gopath/src/github.com/anycable
  ln -rTsf $pkgname-$pkgver gopath/src/github.com/anycable/$pkgname
  cd gopath/src/github.com/anycable/$pkgname
  export GOPATH="$srcdir"/gopath
}

build() {
  cd gopath/src/github.com/anycable/$pkgname
  export GOPATH="$srcdir"/gopath
  export CGO_ENABLED=0
  export GO111MODULE=on
  export GOFLAGS=-mod=vendor
  go build \
    -ldflags "-s -w -X main.version=$pkgver" \
    -gcflags "all=-trimpath=$GOPATH" \
    -asmflags "all=-trimpath=$GOPATH" \
    -a -o $GOPATH/bin/anycable-go cmd/anycable-go/main.go
}

package() {
  install -Dm755 gopath/bin/$pkgname "$pkgdir"/usr/bin/$pkgname
}
