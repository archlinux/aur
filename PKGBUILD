# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=passwall-server-git
pkgdesc="Core backend infrastructure of the PassWall platform (git)"
pkgver=1.1.2.r5.g11d7778
pkgrel=1
arch=('x86_64')
url="https://github.com/passwall/passwall-server"
license=('AGPL3')
depends=('git')
makedepends=('go')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}/cmd/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}/cmd/${pkgname%-git}"
  go get -d ./...
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o "${pkgname%-git}" .
}

package() {
  cd "$srcdir/${pkgname%-git}/cmd/${pkgname%-git}"
  install -Dm 755 "${pkgname%-git}" "$pkgdir/usr/local/bin/${pkgname%-git}"
}
