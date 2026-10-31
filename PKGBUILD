# Maintainer: uright <admin at uright dot icu>

pkgname=goquark-git
pkgver=1.2.0.r0.g0cbc221
pkgrel=1
pkgdesc='Unofficial Quark Drive CLI/TUI/MCP client (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/ButterFuture/GoQuark'
license=('AGPL-3.0-only')
makedepends=('git' 'go>=1.26')
provides=("goquark=${pkgver}")
conflicts=('goquark')
options=('!lto')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null |
      sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$pkgname"
  export GOPATH="$srcdir"
  export GOTOOLCHAIN=local
  go mod download -modcacherw
}

build() {
  cd "$pkgname"
  # Upstream ships fully static binaries (CGO_ENABLED=0); keep that, but build
  # the executable itself as a PIE with -trimpath for hardening.
  export CGO_ENABLED=0
  export GOPATH="$srcdir"
  export GOTOOLCHAIN=local
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export SOURCE_DATE_EPOCH="${SOURCE_DATE_EPOCH:-$(date +%s)}"

  local _commit _builddate
  _commit="$(git rev-parse --short=7 HEAD)"
  _builddate="$(date -u -d "@${SOURCE_DATE_EPOCH}" +%Y-%m-%dT%H:%M:%SZ)"

  go build -buildvcs=false \
    -ldflags "-s -w -X main.Version=${pkgver} -X main.Commit=${_commit} -X main.BuildDate=${_builddate}" \
    -o goquark ./cmd/goquark
}

check() {
  cd "$pkgname"
  export CGO_ENABLED=0
  export GOPATH="$srcdir"
  export GOTOOLCHAIN=local
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 goquark "$pkgdir/usr/bin/goquark"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -m644 README.md README.en.md docs/CHANGELOG.md docs/ACKNOWLEDGMENTS.md \
    docs/DISCLAIMER.md "$pkgdir/usr/share/doc/$pkgname/"
}
