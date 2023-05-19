# Maintainer: github.com/lmorg
pkgname=murex
replaces=('murex-git')
pkgver=4.1.6140
pkgrel=13
pkgdesc="A smarter shell and scripting environment with advanced features designed for usability, safety and productivity (eg smarter DevOps tooling)"
arch=('i686' 'x86_64')
url="https://github.com/lmorg/murex"
license=('GPL2')
makedepends=('go')
optdepends=('aspell: inline spell checking')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('34dc05a4f8e50ac4213c82cb91352715d1f0168a19003ce0afc18274ab046071')

prepare() {
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
  build/murex -c 'g: behavioural/*.mx -> foreach: f { source $f }; try {test: run *}'
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
