# Maintainer: Raphael Nestler (rnestler) <raphael.nestler@gmail.com>

pkgname=nctl
pkgver=1.16.0
pkgrel=1
pkgdesc="A CLI tool to interact with Nine API resources."
arch=('x86_64')
url="https://github.com/ninech/nctl/"
license=('Apache')
makedepends=('go')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ninech/nctl/archive/v${pkgver}.tar.gz")
sha256sums=('f716d38a4a107fbaad2b8377ad4da1a3d341f6395d3b281e6c958b34fefcac60')

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
