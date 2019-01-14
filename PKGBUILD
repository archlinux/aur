# Maintainer: Valentin Elovskiy <evvsoft@gmail.com>

pkgname=prometheus-sphinx-exporter
pkgver=0.0.6
pkgrel=1
pkgdesc="Prometheus exporter for Sphinx search"
arch=('x86_64' 'i686')
url="https://github.com/foxdalas/sphinx_exporter"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("https://github.com/foxdalas/sphinx_exporter/archive/${pkgver}.tar.gz"
        "prometheus-sphinx-exporter@.service")
sha256sums=('58109db34786759920a384909abafde0e4714a0a0dad304b3fdfe94a8fc6644d'
            '735282734fcf7dacd516ebb4433cc4c4cb1a42c64f3db7289c0bea27d9ceafa7')

prepare() {
  cd "${srcdir}/sphinx_exporter-${pkgver}"

  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/github.com/foxdalas"
  ln -snf "${srcdir}/sphinx_exporter-${pkgver}" "${GOPATH}/src/github.com/foxdalas/sphinx_exporter"
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/foxdalas/sphinx_exporter"

  go build
}

package() {
  cd "${srcdir}/sphinx_exporter-${pkgver}"

  install -Dm755 "sphinx_exporter" "${pkgdir}/usr/bin/prometheus_sphinx_exporter"
  install -Dm644 "${srcdir}/prometheus-sphinx-exporter@.service" \
    "${pkgdir}/usr/lib/systemd/system/prometheus-sphinx-exporter@.service"
}
