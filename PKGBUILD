# Maintainer: Mees Fatels
pkgname=emm-git
pkgver=r16.a8ab61d
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

build() {
  cd "$pkgname"
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
}
