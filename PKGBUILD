# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=kubesec
pkgver=0.9.2
pkgrel=1
pkgdesc="Secure Secret management for Kubernetes."
arch=(x86_64)
url="https://github.com/shyiko/kubesec"
license=(Apache)
makedepends=('glide')
source=("https://github.com/shyiko/kubesec/archive/$pkgver.tar.gz")
sha256sums=('49c9a69fc7f4c3d9efba0cbc9110a76f8d3390c4333a97c26e8f868ed84b4078')

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
