# Maintainer: Raphael Nestler (rnestler) <raphael.nestler@gmail.com>

pkgname=nctl
pkgver=1.11.0
pkgrel=1
pkgdesc="A CLI tool to interact with Nine API resources."
arch=('x86_64')
url="https://github.com/ninech/nctl/"
license=('Apache')
makedepends=('go')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ninech/nctl/archive/v${pkgver}.tar.gz")
sha256sums=('8b459b087dadfadb0af186c15df12c6a1bdc85b6a808d216046c632538b53ab8')

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
