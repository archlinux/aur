# Maintainer: Alex D'Andrea <alex at dandrea dot io>
pkgname=json-log-viewer
pkgver=1.2.1
pkgrel=1
pkgdesc='Interactive viewer for JSON logs.'
arch=('x86_64')
url="https://github.com/hedhyw/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver")
sha256sums=('71596ce805c90a132dd7036426e70c24ac39edf064fb1ca547f41a002cd9ad3a')
options=('!lto')

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

  go build -o ./build/jlv \
		--ldflags "-s -w -X main.version=${pkgver}" \
		./cmd/jlv
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 build/jlv "$pkgdir"/usr/bin/jlv
  install -Dm644 example.jlv.jsonc "$pkgdir"/usr/share/"$pkgname"/example.jlv.jsonc
}
