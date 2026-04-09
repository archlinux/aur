# Maintainer: Mees Fatels
pkgname=emm-git
pkgver=r27.4256744
pkgrel=1
pkgdesc="Eidolon Minion Manager - Modular Go-based CLI/TUI for AI"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/meesfatels/EMM"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=('emm')
conflicts=('emm')
source=("$pkgname::git+https://github.com/meesfatels/EMM.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  export GOPATH="$srcdir/gopath"
  go mod download
}

build() {
  cd "$pkgname"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -ldflags="-s -w -X main.version=$pkgver" -o emm ./cmd/emm
}

package() {
  cd "$pkgname"
  install -Dm755 emm "$pkgdir/usr/bin/emm"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Remove the Go module cache so yay can clean the build dir next time.
  # go clean -modcache handles the read-only permissions Go sets on module files.
  GOPATH="$srcdir/gopath" go clean -modcache
}
