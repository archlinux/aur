# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>

pkgname=gucci
pkgdesc='A simple CLI templating tool written in golang.'
pkgver=1.5.5
pkgrel=3
url="https://github.com/noqcks/${pkgname}"
license=('MIT')
arch=('x86_64')
makedepends=('go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=("78e43d7f54b1c74641823b391a26015b2ac5f2298c281c8b31326da10bcbe7ec40de307d00d04048d9e17da3bda3c6a1dcfeae6faa342c62dc7e3222c34c94d0")

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
