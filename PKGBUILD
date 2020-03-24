# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='nginx-vts-exporter'
pkgver='0.10.7'
pkgrel='1'
pkgdesc='Simple server that scrapes Nginx vts stats and exports them via HTTP for Prometheus consumption'
arch=('x86_64' 'i686')
url="https://github.com/hnlq715/${pkgname}"
license=('MIT')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.service")
sha256sums=('242760318d4d22fc9bc81f3a8702ae26f08f4f5344aea312b2763f59c7f753a5'
            '7838c08b3299d2d6d5bb0b6c281f1fcee8f9dc254bfb5e1a8d59699e52495f06')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/github.com/hnlq715"
  ln -snf "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/github.com/hnlq715/${pkgname}"
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/hnlq715/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
