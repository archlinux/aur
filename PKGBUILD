# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=muffet-git
pkgdesc="Fast website link checker (git)"
pkgver=2.3.2.r1.ged40e3a
pkgrel=1
arch=('x86_64')
url="https://github.com/raviqqe/muffet"
license=('MIT')
makedepends=('git' 'go')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "${pkgname%-git}" .
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
