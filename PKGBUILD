# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>

pkgname=hecate-git
pkgver=r122.b2580b1
pkgrel=1
pkgdesc="The Hex Editor from Hell"
url="https://github.com/evanmiller/hecate"
license=('MIT')
provides=("hecate")
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go-pie' 'git')
source=("${pkgname%-git}::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    -o "${pkgname%-git}" .
}

check() {
  cd "${pkgname%-git}"
  go test ./...
}

package() {
  install -Dm755 "${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm644 "${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENCE"
}
