# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

pkgname=alicloud-vault
pkgver=1.1.0
pkgrel=1
pkgdesc='A vault for securely storing and accessing Alibaba Cloud credentials in development environments'
arch=('x86_64')
url="https://github.com/arafato/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('dba764a90d95d444080ae2b225fe4f6042a0ae322465f526d5e4c0463d5015b28f2de83ae1d99d7abb9fcf34bfb25ca690241a78a207c3c2e2cc8ddcffe7b2bc')

build() {
  cd "${pkgname}-${pkgver}"

  go build \
    -trimpath \
    -ldflags="-extldflags ${LDFLAGS} -X main.Version=${pkgver} -s -w" \
    -o "./${pkgname}" .

  go clean --modcache
}

check() {
  cd "${pkgname}-${pkgver}"

  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}
