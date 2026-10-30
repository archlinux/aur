# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=opkssh
pkgver=0.19.2
pkgrel=1
pkgdesc="opkssh (OpenPubkey SSH)"
arch=('x86_64')
url="https://github.com/openpubkey/opkssh"
license=('Apache-2.0')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b7b933fa8184070ba230a1a3208620acfe2f85ef8005d0b91c15841584d364f1')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/opkssh .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/opkssh "$pkgdir"/usr/bin/$pkgname
}
