pkgname=sogogi-git
pkgver=r9.fa03f6548944
pkgrel=1
pkgdesc='WebDAV server'
arch=('x86_64')
url="https://codeberg.org/emersion/sogogi"
license=('MIT')
makedepends=('git' 'go')
source=(
  "$pkgname::git+https://codeberg.org/emersion/sogogi.git"
  'sogogi.service'
)
sha256sums=(
  'SKIP'
  'SKIP'
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
  go build $GOFLAGS ./...
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 sogogi -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/sogogi.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
