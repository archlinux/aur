# Maintainer: David Fryer <dfryer1193@gmail.com>

pkgname=sx-cli-git
_pkgname=sx
pkgver=2.3.8.r0.g63a1f94
pkgrel=1
pkgdesc="Your team's private npm for AI assets - skills, MCP configs, commands, and more"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/sleuth-io/sx"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
provides=("${_pkgname}" "${pkgname%-git}")
conflicts=("${_pkgname}" "${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  mkdir -p build
  # Ensure embedded frontend directory exists so go build succeeds on fresh checkout
  mkdir -p app/frontend/dist
  touch app/frontend/dist/.gitkeep
}

build() {
  cd "$srcdir/$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"

  local _commit
  _commit=$(git rev-parse --short HEAD 2>/dev/null || echo "none")
  local _date
  _date=$(date -u -d "@${SOURCE_DATE_EPOCH:-$(date +%s)}" +"%Y-%m-%dT%H:%M:%SZ" 2>/dev/null || date -u +"%Y-%m-%dT%H:%M:%SZ")

  go build -ldflags "-compressdwarf=false -linkmode=external -s -w \
    -X github.com/sleuth-io/sx/v2/internal/buildinfo.Version=v${pkgver} \
    -X github.com/sleuth-io/sx/v2/internal/buildinfo.Commit=${_commit} \
    -X github.com/sleuth-io/sx/v2/internal/buildinfo.Date=${_date}" \
    -o "build/$_pkgname" ./cmd/sx
}

check() {
  cd "$srcdir/$_pkgname"
  go test -short ./internal/buildinfo ./internal/config ./internal/manifest
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim:set ts=2 sw=2 et:
