# Maintainer: Raphael Nestler (rnestler) <raphael.nestler@gmail.com>

pkgname=nctl
pkgver=1.8.7
pkgrel=1
pkgdesc="A CLI tool to interact with Nine API resources."
arch=('x86_64')
url="https://github.com/ninech/nctl/"
license=('Apache')
makedepends=('go')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ninech/nctl/archive/v${pkgver}.tar.gz")
sha256sums=('0f2f7870e249659648011aa68f69b3bd32102c453343cee7e2031690a93822e9')

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
