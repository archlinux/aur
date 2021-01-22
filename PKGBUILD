# Maintainer: David Birks <david@tellus.space>

pkgname=oras
pkgver=0.9.0
pkgrel=1
pkgdesc='A command line tool that allows you to push and pull files from any OCI registry'
arch=(x86_64)
url='https://github.com/deislabs/oras'
license=(MIT)
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/deislabs/oras/archive/v$pkgver.tar.gz")
sha512sums=('2bd3538eb250e41ac2ebd198cb7ca33971a63e7107808a09391ed1b67eae163d9c2f60d2aeef5dcdcd3b9f423820bc00841a5a120b6e0dce018dafadc88e0d6d')

build() {
  # Flags to trim path from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  export VERSION=$pkgver

  cd $pkgname-$pkgver
  GOARCH=amd64 CGO_ENABLED=0 GOOS=linux go build -v  \
        -o bin/linux/amd64/oras github.com/deislabs/oras/cmd/oras
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/bin/linux/amd64/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
