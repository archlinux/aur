# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Ian Naval <ianonavy@gmail.com>

pkgname=go-ipfs
pkgver=0.3.8
pkgrel=1
pkgdesc="global versioned p2p merkledag file system"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/ipfs/$pkgname"
license=('MIT')
makedepends=('go')
optdepends=('fuse: for mounting/advanced use')
conflicts=("$pkgname-git")
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('d991714e8a0ed6111ed5585a59a964f4d16679b0c4d2af335592c742490c420f66ad2454e622dab952230675d336020a0f4747676a463ce2a9cff4dea5827e6b')

build() {
  # Required for go get
  export GOPATH="$srcdir"

  # Make src directory for $GOPATH
  mkdir -p "$GOPATH/src"

  mv "$srcdir/$pkgname-$pkgver" "$GOPATH/src/$pkgname"
  cd "$GOPATH/src/$pkgname/cmd/ipfs"

  msg2 'Installing dependencies...'
  go get -v ./...

  msg2 'Building binary...'
  go install -v
}

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir/usr/bin"
  install -m755 "$srcdir/bin/ipfs" "$pkgdir/usr/bin/ipfs"
}
