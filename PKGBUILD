# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=kubesec
pkgver=0.7.0
pkgrel=1
pkgdesc="Secure Secret management for Kubernetes."
arch=(x86_64)
url="https://github.com/shyiko/kubesec"
license=(MIT)
makedepends=('glide')
source=("https://github.com/shyiko/kubesec/archive/$pkgver.tar.gz")
sha256sums=('15ed7c9cf8c9126259b874a148864186016191fa888340d344c43fafb42549cc')

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
