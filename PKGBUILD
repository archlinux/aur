pkgname=kimchi-server-git
pkgver=r48.f26ac42ad5a8
pkgrel=1
pkgdesc='A bare-bones HTTP server'
arch=('x86_64')
url="https://sr.ht/~emersion/kimchi"
license=('MIT')
makedepends=('git' 'go' 'scdoc')
source=(
  "$pkgname::git+https://git.sr.ht/~emersion/kimchi"
  'kimchi.service'
)
sha256sums=(
  'SKIP'
  '60fb6d3996bb1e428338c96e3cd8ee6fa1aad90d62846cae73204f06ae5ca400'
)

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make GOFLAGS="$GOFLAGS"
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  make install PREFIX=/usr DESTDIR="$pkgdir"
  install -Dm644 "$srcdir/kimchi.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
