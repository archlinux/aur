# Maintainer: github.com/lmorg
pkgname=murex
replaces=('murex-git')
pkgver=4.0.11110
pkgrel=1
pkgdesc="A smarter shell designed for greater commandline productivity and safer shell scripts"
arch=('i686' 'x86_64')
url="https://github.com/lmorg/murex"
license=('GPL2')
makedepends=('go')
optdepends=('aspell: inline spell checking')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d3a048cd938247db7078e3eea8827b5351771f0d45b5b39777ebae279fed88de')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o build .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./... || true
  build/murex -c 'g: behavioural/*.mx -> foreach: f { source $f }; try {test: run *}'
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
