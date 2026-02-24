# Maintainer: Raphael Nestler (rnestler) <raphael.nestler@gmail.com>

pkgname=nctl
pkgver=1.14.1
pkgrel=1
pkgdesc="A CLI tool to interact with Nine API resources."
arch=('x86_64')
url="https://github.com/ninech/nctl/"
license=('Apache')
makedepends=('go')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ninech/nctl/archive/v${pkgver}.tar.gz")
sha256sums=('742f95cd04cb1e045324c136d685d52a7bc09d58bbd70d1ae837527cab6513af')

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
