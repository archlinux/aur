# Maintainer: David Birks <david@tellus.space>

pkgname=sanic
pkgdesc='Command line tool for creating clusters on Amazon EKS'
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/weaveworks/eksctl'
depends=('kubectl' 'docker')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/distributed-containers-inc/sanic/archive/v$pkgver.tar.gz")
sha256sums=('4754b9392ae6f73f77249a1fa2d16672301375f3035a56f115a79043647a2dff')

prepare() {
  # Make fake gopath
  mkdir -p gopath/src/github.com/distributed-containers-inc
  ln -rTsf $pkgname-$pkgver gopath/src/github.com/distributed-containers-inc/sanic
}

build() {
  # Trim PWD from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  export GOPATH="$srcdir"/gopath
  export GO111MODULE=on
  cd gopath/src/github.com/distributed-containers-inc/sanic
  go install
}

package() {
  install -Dm 755 "$srcdir/gopath/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
