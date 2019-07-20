# Maintainer: David Birks <david@tellus.space>

pkgname=kubeval
pkgver=0.12.0
pkgrel=1
pkgdesc='Command line tool to validate your Kubernetes configuration files'
arch=(x86_64)
url='https://github.com/instrumenta/kubeval'
license=(Apache)
conflicts=('kubeval-bin')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/instrumenta/kubeval/archive/$pkgver.tar.gz")
sha512sums=('2f10bec8dddefbc09bcfff9468e2408ad928edd8f2bc3a31668d97e18776f1eac95ff9147f042d1346f7e46c17d2ade61c80f25fb943b04e28939cbcc74ed52b')

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
