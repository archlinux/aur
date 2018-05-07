# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=kubesec
pkgver=0.8.0
pkgrel=1
pkgdesc="Secure Secret management for Kubernetes."
arch=(x86_64)
url="https://github.com/shyiko/kubesec"
license=(Apache)
makedepends=('glide')
source=("https://github.com/shyiko/kubesec/archive/$pkgver.tar.gz")
sha256sums=('41acf9f60ecb8edf4df5d61b8bc6df11cab7ee253b50fc8a0a426b4eca312089')

prepare() {
  mkdir -p build/go && cd build/go
  for f in "/usr/lib/go/"*; do ln -s "$f"; done
  rm pkg && mkdir pkg && cd pkg
  for f in "/usr/lib/go/pkg/"*; do ln -s "$f"; done

  export GOPATH="$srcdir/build"
  export GOROOT="$GOPATH/go"

  mkdir -p "$GOPATH/src/${url#https://}"
  mv "$srcdir/$pkgname-$pkgver"/* "$GOPATH/src/${url#https://}"

  cd "$GOPATH/src/${url#https://}"
  glide install
}

build() {
  cd "$GOPATH/src/${url#https://}"
  make build
}

package() {
  cd "$GOPATH/src/${url#https://}"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
