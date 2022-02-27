# Maintainer: Forud <fzero@rubi.gd>
# Maintainer: David Birks <david@tellus.space>

pkgname=kail
pkgver=0.15.0
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
  export GOFLAGS="-modcacherw -gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
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
sha256sums=('8f8dd70c5e942474fcfe2e909ddd9198d8636702fe3e5dba8e68b883c1d93372')
