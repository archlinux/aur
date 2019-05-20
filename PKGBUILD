# Maintainer: David Birks <david@tellus.space>

pkgname=kail
pkgver=0.10.1
pkgrel=1
pkgdesc='Kubernetes log viewer'
url='https://github.com/boz/kail'
arch=('x86_64')
license=('MIT')
makedepends=('go')
source=("https://github.com/boz/kail/archive/v${pkgver}.tar.gz")
sha256sums=('0f0db93ac947d6d64d3357b8be795a9b682abfd494f06c5afd3b3d8b4920769f')

prepare(){
  mkdir -p gopath/src/github.com/boz
  ln -rTsf $pkgname-$pkgver gopath/src/github.com/boz/$pkgname

  export GOPATH="$srcdir"/gopath
  export PATH="$PATH:$GOPATH/bin"

  # Install dependencies
  cd gopath/src/github.com/boz/$pkgname
  make install-deps
}

build() {
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
  export GOPATH="$srcdir"/gopath
  unset LDFLAGS

  # Build binary
  export VERSION=$pkgver
  cd gopath/src/github.com/boz/$pkgname
  make build
}

package() {
    install -Dm 755 ${srcdir}/gopath/src/github.com/boz/kail/kail ${pkgdir}/usr/bin/kail
}
