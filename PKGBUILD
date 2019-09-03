# Maintainer: David Birks <david@tellus.space>

pkgname=kubeval
pkgver=0.14.0
pkgrel=1
pkgdesc='Command line tool to validate your Kubernetes configuration files'
arch=(x86_64)
url='https://github.com/instrumenta/kubeval'
license=(Apache)
conflicts=('kubeval-bin')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/instrumenta/kubeval/archive/$pkgver.tar.gz")
sha512sums=('bb0f83a15fdd04df9fa9b45ff2ab9493b8c554347ea0e1dbce2519a493c49301d4f18d84d90a37e8cc34102bbcae89f1f42b52645722fbf6adbc4d6207b35080')

build() {
  # Flags to trim path from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd $pkgname-$pkgver
  go mod vendor
  go build -ldflags "-X main.version=$pkgver" -o bin/kubeval .
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/bin/kubeval" "$pkgdir/usr/bin/kubeval"
}
