# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=anycable-go
pkgdesc="AnyCable WebSocket Server written in Go"
pkgver=1.3.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://anycable.io"
license=('MIT')
makedepends=('go' 'rsync')
source=("https://github.com/anycable/anycable-go/archive/v${pkgver}.tar.gz")
sha256sums=('efeae8220a82fa16bfa2c2eacd1e272e82443dbff42f2f2baa43bc70c2c870b0')

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
