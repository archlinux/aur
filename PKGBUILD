# Maintainer: orhun <github.com/orhun>

pkgname=pkgtop-git
pkgdesc="Interactive package manager & resource monitor"
pkgver=2.4.r0.g639b2fe
pkgrel=1
arch=('x86_64')
url="https://github.com/orhun/pkgtop"
license=('GPL3')
depends=('git')
makedepends=('go')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}/src"
  go get -d ./...
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o "${pkgname%-git}" .
}

package() {
  cd "$srcdir/${pkgname%-git}/src"
  install -Dm755 "${pkgname%-git}" "$pkgdir/usr/local/bin/${pkgname%-git}"
}