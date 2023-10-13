# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=pkgtop-git
pkgdesc="Interactive package manager & resource monitor (git)"
pkgver=2.5.1.r0.ga367254
pkgrel=1
arch=('x86_64')
url="https://github.com/orhun/pkgtop"
license=('GPL3')
depends=('glibc')
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
  cd "${pkgname%-git}/cmd"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "${pkgname%-git}" .
}

package() {
  cd "${pkgname%-git}/cmd"
  install -Dm 755 "${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm 644 "../README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
