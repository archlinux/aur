# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>

pkgname=gucci
pkgdesc='A simple CLI templating tool written in golang.'
pkgver=1.6.6
pkgrel=1
url="https://github.com/noqcks/${pkgname}"
license=('MIT')
arch=('x86_64')
makedepends=('go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=("325269c4dad69e7095b2b00606464b94f78f3312cbeb132840afdfb38f53cdc3b2f886fc9ff79ba08a3bc44921eed2d94ca43fbfe4605b2f4a9a277e87eae8c5")

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
