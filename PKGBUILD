# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=hecate-git
pkgver=r122.b2580b1
pkgrel=2
pkgdesc="The Hex Editor from Hell"
url="https://github.com/evanmiller/hecate"
license=('MIT')
provides=("hecate")
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('glibc')
makedepends=('go' 'git')
source=("${pkgname%-git}::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname%-git}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o "hecate" .
}

check() {
  cd "${pkgname%-git}"
  go test ./...
}

package() {
  install -Dm755 "${pkgname%-git}/hecate"  "$pkgdir/usr/bin/hecate"
  install -Dm644 "${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
