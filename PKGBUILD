# Maintainer: Raphael Nestler <raphael.nestler@gmail.com>

pkgname=forego
pkgver=1.0.4
pkgrel=2
pkgdesc="Foreman in Go"
arch=('x86_64')
url="https://github.com/jpillora/forego"
license=('UNLICENSED')
makedepends=(go git)
provides=('forego')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('a48edbb93de005409ceeb62606e846fde06384a1f50c5788a089425d940f3e4b')

prepare() {
  cd "$pkgname"
  mkdir -p build/
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -ldflags "-s -w -X main.Version=${pkgver}-arch" -o build
}

check() {
  cd "$pkgname"
  go test -v 
}

package() {
  cd "$pkgname"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
