# Maintainer: Agustin Moyano <agustin.moyano@gmail.com>

pkgname=gastown-git
pkgver=r2076.ae61d98
pkgrel=1
pkgdesc="Multi-agent orchestrator for Claude Code instances"
arch=('x86_64')
url="https://github.com/steveyegge/gastown"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.24' 'git')
provides=('gastown')
conflicts=('gastown')
source=("$pkgname::git+https://github.com/steveyegge/gastown.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  export GOPATH="${srcdir}/gopath"
  go mod download
}

build() {
  cd "$pkgname"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o gt ./cmd/gt
}

package() {
  cd "$pkgname"
  install -Dm755 gt "$pkgdir/usr/bin/gt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
