# Maintainer: David Birks <david@tellus.space>

pkgname=duffle
pkgver=0.3.5_beta.1
pkgrel=1
pkgdesc='A tool to install and manage CNAB bundles'
arch=(x86_64)
url='https://github.com/deislabs/duffle'
license=(MIT)
makedepends=('go' 'dep')
conflicts=('duffle-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/deislabs/duffle/archive/${pkgver/_/-}.tar.gz")
sha512sums=('c0fd95b2e0d8c1202a85f5d617d98963929e5bceec6a8a3450d986ee14bdaf3a8e25d37ebb25fb7d60a6608b5bebc9031967835b3e964c561f408f8d103deedf')

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
