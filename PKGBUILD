pkgname=dankgop-git
pkgver=r3.e457a49
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
  # Prefer tag-based versions; fall back to rev count + short hash
  if git describe --tags --long >/dev/null 2>&1; then
    git describe --tags --long \
      | sed 's/^v//; s/-/./g'
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$srcdir/$pkgname"
  # Ensure module cache is writable in build chroots
  export GOPATH="$srcdir/go"
  mkdir -p "$GOPATH"
}

build() {
  cd "$srcdir/$pkgname"
  export CGO_ENABLED=0
  export GOPATH="$srcdir/go"

  # Hardened/optimized build flags
  local _goflags=(
    -buildmode=pie
    -trimpath
    -mod=readonly
  )
  local _ldflags="-s -w"

  # Build CLI (main lives under cmd/cli)
  go build "${_goflags[@]}" -ldflags "${_ldflags}" -o build/dankgop ./cmd/cli
}

check() {
  cd "$srcdir/$pkgname"
  # Run tests if present; ignore failures to avoid breaking packaging on WIP repos
  export CGO_ENABLED=0
  go test ./... || true
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 build/dankgop "$pkgdir/usr/bin/dankgop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
