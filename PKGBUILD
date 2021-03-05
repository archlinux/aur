pkgname=tlstunnel-git
pkgver=r66.f7d73a65b508
pkgrel=1
pkgdesc='A TLS reverse proxy'
arch=('x86_64')
url="https://sr.ht/~emersion/tlstunnel"
license=('MIT')
makedepends=('git' 'go' 'scdoc')
source=(
  "$pkgname::git+https://git.sr.ht/~emersion/tlstunnel"
  'tlstunnel.service'
  'tlstunnel.tmpfiles'
)
sha256sums=(
  'SKIP'
  '7d08417e0c6bdf3bdcb7dfc8b091405a65c7c82a0aa58a9ea195f3061fb4da3f'
  '0e42fca2bc63f60add7d33e6545375cddce7156c0d6efd057ccac121b7221c23'
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
  install -Dm644 "$srcdir/tlstunnel.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/tlstunnel.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/tlstunnel.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
