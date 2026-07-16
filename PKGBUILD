# Maintainer: Adrià Arrufat <swiftscythe@gmail.com>
pkgname=panobble-git
pkgver=r14.0000000
pkgrel=1
pkgdesc="Minimal MPRIS to Last.fm scrobbler daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/arrufat/panobble"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('xdg-utils: open the Last.fm authorization page during auth')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${pkgname%-git}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-linkmode external -X main.version=$pkgver" -o panobble ./cmd/panobble
  sed 's|%h/.local/bin/panobble|/usr/bin/panobble|' contrib/panobble.service > panobble.service
}

check() {
  cd "${pkgname%-git}"
  go test ./...
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 panobble "$pkgdir/usr/bin/panobble"
  install -Dm644 panobble.service "$pkgdir/usr/lib/systemd/user/panobble.service"
  install -Dm644 contrib/config.example.toml "$pkgdir/usr/share/doc/${pkgname%-git}/config.example.toml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
