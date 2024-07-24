# Maintainer: CEUK <ceuk.dev@gmail.com>
pkgname=git-file-history
pkgver=0.0.4
pkgrel=1
pkgdesc='Easily view the history of a file in a git repository'
arch=('x86_64')
url="https://github.com/ceuk/$pkgname"
license=('MIT')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3633f89b329c528fcf29bcf278275c41d8bebfe03b126c7890036b63e2231a2b')

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
  go build -o build/$pkgname
}

check() {
  cd "$pkgname-$pkgver"
  go test ./
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
