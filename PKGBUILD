# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=dmarc-cat
pkgver=0.15.0
pkgrel=14
pkgdesc='Decode the report sent by various email providers following the DMARC spec'
arch=('x86_64')
url='https://github.com/keltia/dmarc-cat'
license=('BSD-2-Clause')
conflicts=("${pkgname}-git")
depends=(glibc gpgme)
makedepends=(go)
source=("dmarc-cat-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('886bf33ba60d601de74a1e9d437a8e09eea5c03a05b09c0f685fa02d1c174bba')

prepare(){
    cd "$pkgname-$pkgver"
    export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
    go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o $pkgname

  # Clean up deps
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE.md -t "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
