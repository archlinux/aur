# Maintainer: Juan <hello@v4rgas.com>

pkgname=beads-git
pkgver=r28.g00b0292
pkgrel=1
pkgdesc="A memory upgrade for your coding agent (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/steveyegge/beads"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.21' 'git')
provides=('beads' 'bd')
conflicts=('beads' 'beads-bin')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/beads"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/beads"
  # Download Go dependencies
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
  # Run tests
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
