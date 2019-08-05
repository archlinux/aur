# Maintainer: David Birks <david@tellus.space>

pkgname=duffle
pkgver=0.2.0_beta.4
pkgrel=1
pkgdesc='A tool to install and manage CNAB bundles'
arch=(x86_64)
url='https://github.com/deislabs/duffle'
license=(MIT)
makedepends=('go' 'dep')
conflicts=('duffle-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/deislabs/duffle/archive/${pkgver/_/-}.tar.gz")
sha512sums=('631894fd552c120d4b00743b2974d2224dd432cb2536db4057a9b215465782a5fb7697f81c5e6836765e0b98c4e09610730d170a871a11566d099568f17e31ab')

prepare() {
  mkdir -p gopath/src/github.com/deislabs
  ln -rTsf $pkgname-${pkgver/_/-} gopath/src/github.com/deislabs/$pkgname
  export GOPATH="$srcdir"/gopath

  cd gopath/src/github.com/deislabs/$pkgname
  dep ensure -v
}

build() {
  # Flags to trim path from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd gopath/src/github.com/deislabs/$pkgname
  #./scripts/build.sh
  #make build-bin
  go build --ldflags "-X github.com/deislabs/duffle/pkg/version.Version=${pkgver/_/-}" ./cmd/duffle
}

package() {
  install -Dm 755 "$srcdir/$pkgname-${pkgver/_/-}/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
