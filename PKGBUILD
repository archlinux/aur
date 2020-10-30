# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=storrent-git
pkgver=r123.e99a05a
pkgrel=1
pkgdesc='An implementation of the BitTorrent protocol that is optimised for streaming media.'
arch=('x86_64')
url="https://github.com/jech/storrent"
license=('MIT')
makedepends=('git' 'go')
source=("storrent::git+${url}.git")
sha256sums=('SKIP')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  local _pkgver
  _pkgver=$(pkgver)
  cd "${pkgname%-git}"
  sed -i "s/STorrent 0.0 by Juliusz Chroboczek/STorrent $_pkgver by Juliusz Chroboczek/g" storrent.go
}

build() {
  cd "${pkgname%-git}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build
}

check() {
  cd "${pkgname%-git}"
  go test ./...
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENCE"
}
