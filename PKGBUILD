# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=anycable-go
pkgdesc="AnyCable WebSocket Server written in Go"
pkgver=1.4.8
pkgrel=1
arch=('i686' 'x86_64')
url="http://anycable.io"
license=('MIT')
makedepends=('go' 'rsync')
source=("https://github.com/anycable/anycable-go/archive/v${pkgver}.tar.gz")
sha256sums=('9e3e560975e1e377c95c023054d30e10c8209e51e23d92a7a3fc2ec1aa88c6a9')

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
  export GOFLAGS=-mod=mod
  go build \
    -ldflags "-s -w -X main.version=$pkgver" \
    -gcflags "all=-trimpath=$GOPATH" \
    -asmflags "all=-trimpath=$GOPATH" \
    -a -o $GOPATH/bin/anycable-go cmd/anycable-go/main.go
}

package() {
  install -Dm755 gopath/bin/$pkgname "$pkgdir"/usr/bin/$pkgname
}
