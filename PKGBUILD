# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=dmarc-cat
pkgver=0.15.0
pkgrel=6
pkgdesc='Small utility to decode the report sent by various email providers following the DMARC spec'
arch=('x86_64')
url='https://github.com/keltia/dmarc-cat'
license=('BSD')
conflicts=("${pkgname}-git")
makedepends=(go)
source=("dmarc-cat-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('886bf33ba60d601de74a1e9d437a8e09eea5c03a05b09c0f685fa02d1c174bba')

prepare(){
    cd "$pkgname-$pkgver"
    export GOPATH="${srcdir}"
    go mod download
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags "-linkmode external -extldflags \"$LDFLAGS\"" \
    -o $pkgname
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE.md -t "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
