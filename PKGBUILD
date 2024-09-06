pkgname=redpanda-connect
_pkgname=connect
pkgver=4.35.0
pkgrel=1
pkgdesc='Redpanda Connect is a declarative data streaming service'
arch=('aarch64' 'armv5h' 'armv6h' 'armv7h' 'x86_64')
url="https://docs.redpanda.com/redpanda-connect/about/"
license=('Apache-2.0')
makedepends=('go')
source=("https://github.com/redpanda-data/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b5739b526ae47dd50474a6042096ce953a95d47302c5f8cd76cc48ef9b3ff93a')

prepare(){
  cd "$_pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$_pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/redpanda-connect/...
}

check() {
  cd "$_pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
