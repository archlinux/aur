# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>

pkgname=gucci
pkgdesc='A simple CLI templating tool written in golang.'
pkgver=1.6.10
pkgrel=1
url="https://github.com/noqcks/${pkgname}"
license=('MIT')
arch=('x86_64')
makedepends=('go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=("9aa234e3beebc0b9364c4d39fb29c8de0f7862ce3450bf48f8d518d18b492249eb942485340ee154cb4b3ecc79375c6245d946fe6a0cf929ea289ca68bed56b4")

build() {
  export GO11MODULE=on
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${pkgname}-${pkgver}"
  go mod download golang.org/x/net
  go build -ldflags "-X main.AppVersion=${pkgver}" -o "${pkgname}.bin"
}

package () {
  cd "${pkgname}-${pkgver}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 gucci.bin "${pkgdir}/usr/bin/${pkgname}"
}
