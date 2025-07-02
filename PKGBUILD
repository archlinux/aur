# Maintainer: Alex D'Andrea <alex at dandrea dot io>
pkgname=json-log-viewer
pkgver=1.5.0
pkgrel=1
pkgdesc='Interactive viewer for JSON logs.'
arch=('x86_64')
url="https://github.com/hedhyw/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver")
sha256sums=('d043e6085efd6403cc0c1361c0ae0aeeec3f20b9697a709a7d29118de22fdabb')
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
