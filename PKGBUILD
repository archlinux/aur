# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='nginx-vts-exporter'
pkgver='0.10.8'
pkgrel='1'
pkgdesc='Simple server that scrapes Nginx vts stats and exports them via HTTP for Prometheus consumption'
arch=('x86_64' 'i686' 'aarch64')
_uri='github.com/hnlq715'
url="https://${_uri}/${pkgname}"
license=('MIT')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.service")
sha256sums=('2fc964f1129f732beaf10722380d61754c4f0744c48a2ab11028428eff45ce11'
            '7838c08b3299d2d6d5bb0b6c281f1fcee8f9dc254bfb5e1a8d59699e52495f06')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/${_uri}"
  ln -snf "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/${_uri}/${pkgname}"
}

build() {
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  GOOS=linux go build
}

package() {
  pushd "${GOPATH}/src/${_uri}/${pkgname}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  popd
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
