# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>

pkgname=gucci
pkgdesc='A simple CLI templating tool written in golang.'
pkgver=1.6.12
pkgrel=1
url="https://github.com/noqcks/${pkgname}"
license=('MIT')
arch=('x86_64')
makedepends=('go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("ac5e87555f66d8a49659634cecc38c67d8b512b1bc6ecf7f3ec6d2b74621011e553d4e00a9c09040449fe66a6286c032f5fae7afdeb69872717a44e79ca91ba4")

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
