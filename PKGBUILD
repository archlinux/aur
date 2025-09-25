# Maintainer: Amolith <amolith@secluded.site>

pkgname=ggc
pkgver=6.0.0
pkgrel=2
pkgdesc="A modern Git CLI tool with both traditional command-line and interactive incremental-search UI"
arch=('x86_64' 'arm64')
url="https://github.com/bmf-san/ggc"
license=('MIT')
makedepends=('go')
provides=('ggc')
conflicts=('ggc-bin' 'ggc-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bmf-san/ggc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8daae2f8ce6690a5e6114e90e2137b240ac464a11f6333ea50dd7be25c3e2ad5')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  
  VERSION="v$pkgver"
  COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo 'unknown')"
  
  go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X main.version=${VERSION} -X main.commit=${COMMIT}" \
      -o "$pkgname"
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
