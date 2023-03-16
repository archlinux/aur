# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=cui
pkgver=0.4.0
pkgrel=1
pkgdesc="http request/response tui"
arch=(x86_64)
url=https://github.com/mfinelli/cui
license=(GPL3)
depends=(glibc)
makedepends=(go)
source=(${url}/releases/download/v${pkgver}/${pkgname}_v${pkgver}.tar.gz{,.asc})
validpgpkeys=(7A701FCB0E832A8CDADADA907C3ACA9DD0C33A05)
sha256sums=('5eba334c68ef5c2578b2620eafb6c7c0a9d21814f317eec4ee5626d18d90e55d'
            'SKIP')

check() {
  cd ${pkgname}_v${pkgver}
  go test -mod=vendor ./...
}

build() {
  cd ${pkgname}_v${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"
  go build -o $pkgname .
}

package() {
  cd ${pkgname}_v${pkgver}
  make install DESTDIR="$pkgdir" PREFIX=/usr
}

# vim: set ts=2 sw=2 et:
