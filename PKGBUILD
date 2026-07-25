# Maintainer: djvu <djvu@noreply.codeberg.org>
pkgname=cosmo-tui-git
pkgver=r183.0f6385a
pkgrel=1
pkgdesc="terminal client for the cosmo app"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/djvu/cosmo-tui"
license=('GPL-3.0-only')
depends=('glibc')
optdepends=('mpv: for viewing replays'
            'ffmpeg: for downloading replays'
            'xdg-utils: for opening URLs and files')
makedepends=('git' 'go')
provides=('cosmo-tui')
conflicts=('cosmo-tui')
source=("$pkgname::git+https://codeberg.org/djvu/cosmo-tui.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-linkmode external -X main.version=${pkgver}-${pkgrel}" -o cosmo-tui ./cmd/cosmo-tui
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 cosmo-tui "$pkgdir/usr/bin/cosmo-tui"
}
