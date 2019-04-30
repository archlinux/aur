# Maintainer: David Birks <david@tellus.space>

pkgname=docker-app
pkgver=0.8.0_beta2
pkgrel=1
pkgdesc="A utility to help make Compose files more reusable and sharable"
arch=(x86_64)
url="https://github.com/docker/app"
license=(Apache)
depends=('docker')
makedepends=('go')
source=("https://github.com/docker/app/archive/v${pkgver//_/-}.tar.gz")
sha512sums=('8987462f125e91355e02a34e8f82ec019975c7e7bb1fd37f52aab058dc81a7c27f781ab2c608e6739abd6caed27e08407739fc5acb346ed3fa4a5c9cf810d31b')

prepare() {
  mkdir -p gopath/src/github.com/docker
  ln -rTsf app-${pkgver//_/-} gopath/src/github.com/docker/app
}

build() {
  # LDFLAGS into the GOFLAGS env variable.
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/docker/app
  make bin/docker-app-standalone
}

package() {
  install -Dm 755 "$srcdir/gopath/src/github.com/docker/app/bin/$pkgname-standalone" "$pkgdir/usr/bin/$pkgname"
}
