# Maintainer: Sam Whited <sam@samwhited.com>

_pkgname=xmpp-blackbox-exporter
pkgname=prometheus-${_pkgname}
pkgver=0.4.0
pkgrel=1
pkgdesc='A Prometheus exporter which probes XMPP based services.'
arch=(x86_64)
url='https://github.com/horazont/xmpp-blackbox-exporter'
license=('Apache')
depends=(glibc)
makedepends=(go)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/horazont/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('fe833dc0062a8d8c82624659fe7986982e6002e0fe90a04001b1dd69b625956c')

check() {
  cd "${_pkgname}-${pkgver}/"
  go test -v ./...
}

build() {
  cd "${_pkgname}-${pkgver}/"
  GOCACHE="${srcdir}/cache" go build \
    -trimpath \
    -ldflags "-extldflags ${LDFLAGS}" \
    -buildmode=pie \
    ./cmd/prometheus-xmpp-blackbox-exporter
}

package() {
  cd "${_pkgname}-${pkgver}/"
  install -Dm755 prometheus-xmpp-blackbox-exporter -t "${pkgdir}"/usr/bin/
  install -Dm644 example.yml -t "${pkgdir}"/etc/${_pkgname}
}

# vim: ts=2 sw=2 et:
