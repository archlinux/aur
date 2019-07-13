# Maintainer: David Birks <david@tellus.space>

pkgname=kubeval
pkgver=0.11.0
pkgrel=1
pkgdesc='Command line tool to validate your Kubernetes configuration files'
arch=(x86_64)
url='https://github.com/instrumenta/kubeval'
license=(Apache)
conflicts=('kubeval-bin')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/instrumenta/kubeval/archive/$pkgver.tar.gz")
sha512sums=('acaa273c25d370fea0c7b695d50b81f3e727cb93b8ce3d9efb5ac81a93a97d8b4513017c4bb136fa154f25d2a6909c9473fc93bd7135967addf4bb2172c99656')

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
