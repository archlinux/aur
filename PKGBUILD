pkgname=tlstunnel-git
pkgver=r49.09d28676a6b0
pkgrel=1
pkgdesc='A TLS reverse proxy'
arch=('x86_64')
url="https://sr.ht/~emersion/tlstunnel"
license=('MIT')
makedepends=('go' 'scdoc')
source=(
  "$pkgname::git+https://git.sr.ht/~emersion/tlstunnel"
  'tlstunnel.service'
)
sha256sums=(
  'SKIP'
  '8d55cc467d36555b97aa6238724bcb02a96e5f0406c40885d0d743c9bbcb5690'
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
  make
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  make install PREFIX=/usr DESTDIR="$pkgdir"
  install -Dm644 "$srcdir/tlstunnel.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
