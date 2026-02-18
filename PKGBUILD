# Maintainer: Juan <hello@v4rgas.com>

pkgname=beads-git
pkgver=r28.g00b0292
pkgrel=1
pkgdesc="A memory upgrade for your coding agent (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/steveyegge/beads"
license=('MIT')
depends=('glibc' 'icu' 'zstd')
makedepends=('go>=1.24' 'git')
provides=('beads' 'bd')
conflicts=('beads' 'beads-bin')
source=()
sha256sums=()

_giturl="https://github.com/steveyegge/beads.git"

pkgver() {
  cd "$srcdir/beads"
  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir"
  if [ -d beads ]; then
    cd beads
    git fetch --filter=blob:none origin
    git reset --hard origin/HEAD
  else
    git clone --filter=blob:none "$_giturl"
  fi
  cd "$srcdir/beads"
  go mod download
}

build() {
  cd "$srcdir/beads"

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  # Build with version information
  local ldflags="-linkmode=external -X main.version=${pkgver}"
  go build -ldflags="${ldflags}" -o bd ./cmd/bd
}

check() {
  cd "$srcdir/beads"
  go test ./... || true
}

package() {
  cd "$srcdir/beads"

  # Install binary
  install -Dm755 bd "$pkgdir/usr/bin/bd"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  if [ -f QUICKSTART.md ]; then
    install -Dm644 QUICKSTART.md "$pkgdir/usr/share/doc/$pkgname/QUICKSTART.md"
  fi
  if [ -f WORKFLOW.md ]; then
    install -Dm644 WORKFLOW.md "$pkgdir/usr/share/doc/$pkgname/WORKFLOW.md"
  fi

  # Install examples if they exist
  if [ -d examples ]; then
    install -dm755 "$pkgdir/usr/share/doc/$pkgname/examples"
    cp -r examples/* "$pkgdir/usr/share/doc/$pkgname/examples/"
  fi
}
