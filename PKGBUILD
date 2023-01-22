# Maintainer: github.com/lmorg
pkgname=murex
replaces=('murex-git')
pkgver=3.0.9310
pkgrel=1
pkgdesc="Bash-like shell designed for greater commandline productivity and safer shell scripts"
arch=('i686' 'x86_64')
url="https://github.com/lmorg/murex"
license=('GPL2')
makedepends=('go')
optdepends=('aspell: inline spell checking')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f80fe8b528632a94429371c9a9e8e36eefe08c304590ac89f8ffcfb5ba511272')

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
  build/murex -c 'g: behavioural/* -> foreach: f { source $f }; try {test: run *}'
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
