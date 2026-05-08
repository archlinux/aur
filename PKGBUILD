# Maintainer: Raphael Nestler (rnestler) <raphael.nestler@gmail.com>

pkgname=nctl
pkgver=1.18.0
pkgrel=1
pkgdesc="A CLI tool to interact with Nine API resources."
arch=('x86_64')
url="https://github.com/ninech/nctl/"
license=('Apache')
makedepends=('go')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ninech/nctl/archive/v${pkgver}.tar.gz")
sha256sums=('bc96db65516d0466635c495d44b41f6c75f53bcd2a8eb523e1d48b5fbb06861a')

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
  go build -buildvcs=false -ldflags "-s -w -X main.version=${pkgver}-arch" -o build
}


package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
