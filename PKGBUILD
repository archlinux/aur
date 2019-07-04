# Maintainer: David Birks <david@tellus.space>

pkgname=sanic
pkgdesc='An all-in-one tool to develop, build, and deploy your Docker/Kubernetes projects'
pkgver=1.2.6
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/distributed-containers-inc/sanic'
depends=('kubectl' 'docker')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/distributed-containers-inc/sanic/archive/v$pkgver.tar.gz")
sha256sums=('f6f2d0bce48fb80107e7cf40e59f90758f406cb1e45de617be3e5029731e9485')

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
