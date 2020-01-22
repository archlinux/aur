# Maintainer: Forud <fzero@rubi.gd>
# Maintainer: David Birks <david@tellus.space>

pkgname=kail
pkgver=0.13.0
pkgrel=1
pkgdesc='Kubernetes log viewer'
url='https://github.com/boz/kail'
arch=('x86_64')
license=('MIT')
makedepends=('go')
source=("https://github.com/boz/kail/archive/v${pkgver}.tar.gz")

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
sha256sums=('181d001d55f621c6e65a7864f17fc605097afcf1c653c1e9960c0451be469b32')
sha256sums=('7f362162266b5b28f2df33ff2601f59162ce420ac3fcf74db48feb0809b63b6c')
