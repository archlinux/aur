# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=pkgtop-git
pkgdesc="Interactive package manager & resource monitor (git)"
pkgver=2.4.r0.g639b2fe
pkgrel=2
arch=('x86_64')
url="https://github.com/orhun/pkgtop"
license=('GPL3')
makedepends=('git' 'go')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}/src"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "${pkgname%-git}" .
}

package() {
  cd "${pkgname%-git}/src"
  install -Dm 755 "${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm 644 "../README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
