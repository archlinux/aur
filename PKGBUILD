# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=agent-deck
pkgver=1.16.12
pkgrel=1
pkgdesc="Terminal session manager for AI coding agents. Built with Go + Bubble Tea."
arch=('x86_64' 'aarch64')
url="https://github.com/asheshgoplani/agent-deck"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='ca7b608f2ff4a586be28173d313c9a9438c630e8'
source=("git+https://github.com/asheshgoplani/agent-deck.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname" || exit
  go mod download -modcacherw
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  cd "$pkgname" || exit
  go build -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    ./cmd/agent-deck
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
