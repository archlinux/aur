# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>
pkgname=oras
pkgver=0.12.0
pkgrel=1
pkgdesc='A command line tool that allows you to push and pull files from any OCI registry'
arch=(x86_64)
url='https://github.com/deislabs/oras'
license=(MIT)
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oras-project/oras/archive/v$pkgver.tar.gz")
sha512sums=('589324805c38f485ecb0122e35984cd6d7b87150c2e67d36bb3ca759750b9ccc9a4803aea9c56c4cbbfb19c914fe7a077d9d091b70b54babc446ac01d3bc2091')

build() {
  # Flags to trim path from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  export VERSION=$pkgver

  cd $pkgname-$pkgver
  GOARCH=amd64 CGO_ENABLED=0 GOOS=linux go build \
        -o bin/linux/amd64/oras github.com/oras-project/oras/cmd/oras
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/bin/linux/amd64/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
