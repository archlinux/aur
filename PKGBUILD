# Maintainer: linkfrg <linkfrg.dev@proton.me>
pkgname=goignis
pkgver=0.1.0
pkgrel=1
pkgdesc="An optional, high-performance CLI for the Ignis widget framework"
arch=('x86_64')
url="https://github.com/ignis-sh/goignis"
license=('MIT')
makedepends=(go)
provides=('goignis')
conflicts=('goignis-git')
source=("goignis-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5b8b84489113df93297a78572e858548a12546bb36e116d98377296b54af1afb')

prepare(){
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
