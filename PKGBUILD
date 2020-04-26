# Maintainer: Sam Whited <sam@samwhited.com>

_pkgname=xmpp-blackbox-exporter
pkgname=prometheus-${_pkgname}
pkgver=0.5.0
pkgrel=1
pkgdesc='A Prometheus exporter which probes XMPP based services.'
arch=(x86_64)
url='https://github.com/horazont/xmpp-blackbox-exporter'
license=('Apache')
depends=(glibc)
makedepends=(go)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/horazont/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e9675b6128817479adeec4235d009657055a18155936b214a5955bf079db861c')

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
    ./cmd/xmpp_blackbox_exporter
}

package() {
  cd "${_pkgname}-${pkgver}/"
  install -Dm755 xmpp_blackbox_exporter -t "${pkgdir}"/usr/bin/
  install -Dm644 example.yml -t "${pkgdir}"/etc/${_pkgname}
}

# vim: ts=2 sw=2 et:
