# Maintainer: github.com/lmorg
pkgname=murex
replaces=('murex-git')
pkgver=5.0.9200
pkgrel=24
pkgdesc="A smarter shell and scripting environment with advanced features designed for usability, safety and productivity (eg smarter DevOps tooling)"
arch=('i686' 'x86_64')
url="https://github.com/lmorg/murex"
license=('GPL2')
makedepends=('go')
optdepends=('aspell: inline spell checking' 'git: package management')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('090df13ded73936d884c13dc5ace7badc658744841edb614011ff882d1ac560c')

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
  build/murex -c 'g behavioural/*.mx -> foreach f { source $f }; test run *'
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
