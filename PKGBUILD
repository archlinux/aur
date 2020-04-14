# Maintainer: David Birks <david@birks.dev>

pkgname=kubeval
pkgver=0.15.0
pkgrel=1
pkgdesc='Command line tool to validate your Kubernetes configuration files'
arch=(x86_64)
url='https://github.com/instrumenta/kubeval'
license=(Apache)
conflicts=('kubeval-bin')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/instrumenta/kubeval/archive/$pkgver.tar.gz")
sha512sums=('2f957786614ae25f784d10fa019c580ccc0219658758ad0e992675032537eb60a2c27dd4df33ee57e5dcb381923a29b0f5ac057742f04356eda1af2002ec647e')

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
