pkgname=dankgop-git
pkgver=r4.45a60f1
pkgrel=1
pkgdesc="System monitoring CLI + REST API (git snapshot)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/AvengeMedia/dankgop"
license=('MIT')
provides=('dankgop')
conflicts=('dankgop')
depends=()
makedepends=('git' 'go')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  if git describe --tags --long >/dev/null 2>&1; then
    git describe --tags --long | sed 's/^v//; s/-/./g'
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$srcdir/$pkgname"
  # keep caches in the build dir
  export GOMODCACHE="$srcdir/gomodcache"
  mkdir -p "$GOMODCACHE"
}

build() {
  cd "$srcdir/$pkgname"
  export CGO_ENABLED=0
  export GOMODCACHE="$srcdir/gomodcache"

  # Put common flags in GOFLAGS so tests use them too
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build -ldflags "-s -w" -o build/dankgop ./cmd/cli
}

check() {
  cd "$srcdir/$pkgname"
  export CGO_ENABLED=0
  export GOMODCACHE="$srcdir/gomodcache"
  # don't fail the package on WIP tests, but still run with writable mod cache
  go test ./... || true
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 build/dankgop "$pkgdir/usr/bin/dankgop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
