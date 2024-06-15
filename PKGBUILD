pkgname=nucleus
pkgver=0.2.12
pkgrel=1
pkgdesc='CLI for interfacing with Nucleus'
arch=('any')
url="https://nucleuscloud.com"
license=('Apache-2.0')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nucleuscloud/cli/archive/v$pkgver.tar.gz")
sha256sums=('2ef2f4ce52b84dc5454ef0003480a453d86871ed26f7b2b53e7a6aebd1f0cd9d')

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
  go build -o build ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}

