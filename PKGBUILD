# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gpbkdf2-git
pkgver=r8.428e2de
pkgrel=1
pkgdesc="PBKDF2 key encoder for use in shell. Single, tiny binary. Written in Go"
arch=('x86_64' 'armv7h')
url="https://github.com/riotkit-org/gpbkdf2"
license=('LGPL3')
makedepends=('git' 'go')
provides=("${pkgname%-git}" "${pkgname-bin}")
conflicts=("${pkgname%-git}" "${pkgname-bin}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname%-git}"

  GOPATH="$srcdir" go mod init go.mod
  GOPATH="$srcdir" go mod tidy
  GOPATH="$srcdir" go mod download
  GOPATH="$srcdir" go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-s -w" \
    -o ${pkgname%-git} .

}

package() {
  cd "${pkgname%-git}"

  install -Dm 755 ${pkgname%-git} "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm 644 -t "$pkgdir/usr/share/doc/${pkgname%-git}/" README.md

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
