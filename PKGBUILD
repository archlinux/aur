# Maintainer: github.com/lmorg
pkgname=murex
replaces=('murex-git')
pkgver=5.1.2210
pkgrel=27
pkgdesc="A smarter shell and scripting environment with advanced features designed for usability, safety and productivity (eg smarter DevOps tooling)"
arch=('i686' 'x86_64')
url="https://github.com/lmorg/murex"
license=('GPL2')
makedepends=('go')
optdepends=('aspell: inline spell checking' 'git: package management')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('df32c34138b4fc03ca03339ac3061488e87507cf96fe1aad625f876d27091284')

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
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -tags=opt_select,no_cgo"
  go build -v -o build .
}

check() {
  cd "$pkgname-$pkgver"
  build/murex -c 'out "This message is coming to you from Murex!"'
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
