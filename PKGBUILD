pkgname=blurhash-cli
pkgver=v1.0.1
pkgrel=1
pkgdesc='BlurHash CLI tool'
arch=('x86_64')
url="https://github.com/alersrt/go-blurhash-cli/archive/refs/tags"
license=('MIT')
makedepends=('go')
source=("$url/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

prepare(){
  _dirname=$(tar -tf "${source[0]##*/}" | head -n 1 | cut -d/ -f1)
  mv $_dirname $pkgname-$pkgver

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
  go build -o build/bin/$pkgname ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/bin/$pkgname "$pkgdir"/usr/bin/$pkgname
}