# Maintainer: KingofToasters <dev at sgregoratto dot me>
pkgname=age-git
pkgver=r5.0940f18
pkgrel=2
pkgdesc="A simple and secure encryption based on UNIX-style composability."
url="https://github.com/FiloSottile/age"
license=('custom: BSD')
provides=('age')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go-pie' 'git')
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
  cd "${pkgname%-git}/cmd/age"
  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o "${pkgname%-git}" .
}

check() {
  cd "${pkgname%-git}"
  go test ./...
}

package() {
  install -Dm755 "${pkgname%-git}/cmd/age/age" "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm644 "${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENCE"
}
