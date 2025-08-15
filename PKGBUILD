# Maintainer: gilcu3
# Contributor: gilcu3

pkgname=cariddi
pkgver=1.4.1
pkgrel=1
pkgdesc='Take a list of domains, crawl urls and scan for endpoints, secrets, api keys, file extensions, tokens and more'
arch=('any')
url="https://github.com/edoardottt/cariddi"
license=('GPL-3.0')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d5870e294b7d9831fd95c19592bc5e5b615a6e07e9bba1139e288b42ddf5005f')

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
