# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=anycable-go
pkgdesc="AnyCable WebSocket Server written in Go"
pkgver=1.4.2
pkgrel=1
arch=('i686' 'x86_64')
url="http://anycable.io"
license=('MIT')
makedepends=('go' 'rsync')
source=("https://github.com/anycable/anycable-go/archive/v${pkgver}.tar.gz")
sha256sums=('8407b0e6eefa5ba0a114a6da450f4987def47da26fd2775e5c55be0b5e594df0')

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
