# Maintainer: Jeff Wright <jeff @ teamjk.page>
# Contributor: Robin Broda <coderobe @ archlinux.org>

pkgname=nebula-systemd
_pkgname=nebula
provides=('nebula')
conflicts=('nebula')
pkgver=1.1.0
pkgrel=3
pkgdesc='A scalable overlay networking tool with a focus on performance, simplicity and security, patched to add systemd service'
arch=('x86_64')
url='https://github.com/slackhq/nebula'
license=('MIT')
depends=()
makedepends=('go-pie')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz" "service.patch")
md5sums=('9de8388dc9ab4f7787def54c8ec410b4'
         'd36d89cd5caacb037dd238fea28659c4')

prepare() {
 cd "${_pkgname}-${pkgver}"
 patch "${srcdir}/${_pkgname}-${pkgver}/examples/service_scripts/nebula.service" "${srcdir}/service.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"

  go build \
    -trimpath \
    -ldflags "-extldflags ${LDFLAGS} -X main.Build=${pkgver}" \
    -o ./nebula ./cmd/nebula

  go build \
    -trimpath \
    -ldflags "-extldflags ${LDFLAGS} -X main.Build=${pkgver}" \
    -o ./nebula-cert ./cmd/nebula-cert

  go build \
    -trimpath \
    -ldflags "-extldflags ${LDFLAGS} -X main.Build=${pkgver}" \
    -o ./nebula-service ./cmd/nebula-service
}

check() {
  cd "${_pkgname}-${pkgver}"

  go test -v ./...
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/nebula/LICENSE"
  install -Dm755 nebula "${pkgdir}/usr/bin/nebula"
  install -Dm755 nebula-cert "${pkgdir}/usr/bin/nebula-cert"
  install -Dm755 nebula-service "${pkgdir}/usr/bin/nebula-service"
  install -Dm644 examples/service_scripts/nebula.service "${pkgdir}/usr/lib/systemd/system/nebula.service"
}
