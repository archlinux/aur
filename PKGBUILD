# Maintainer: David Birks <david@tellus.space>

pkgname=duffle
pkgver=0.2.0_beta.2
pkgrel=1
pkgdesc='A tool to install and manage CNAB bundles'
arch=(x86_64)
url='https://github.com/deislabs/duffle'
license=(MIT)
makedepends=('go' 'dep')
source=("$pkgname-$pkgver.tar.gz::https://github.com/deislabs/duffle/archive/${pkgver/_/-}.tar.gz")
sha512sums=('cacff4f5e690bd5bb4d790822d47429dc697e77a773228e42b652d129dbb8e52042533e789e7356bdc9cc0d0d54f7c6ecf7f452ee8f7bdc71554a9f6640e90a4')

prepare(){
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
