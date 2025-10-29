# Maintainer: Amolith <amolith@secluded.site>

pkgname=ggc
pkgver=7.0.4
pkgrel=1
pkgdesc="A modern Git CLI tool with both traditional command-line and interactive incremental-search UI"
arch=('x86_64' 'aarch64')
url="https://github.com/bmf-san/ggc"
license=('MIT')
makedepends=('go')
provides=('ggc')
conflicts=('ggc-bin' 'ggc-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bmf-san/ggc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('495f5f443986862e86bb95edbcbab36d3acb1a96c4a46945c43c2b461a40f47f')

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
