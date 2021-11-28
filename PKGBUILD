# Maintainer: Sebastian Krebs <sebastian[at]krebs.one>

pkgname=prometheus-process-exporter
pkgver=0.7.10
pkgrel=1
pkgdesc="Prometheus exporter that mines /proc to report on selected processes"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ncabatoff/process-exporter"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("https://github.com/ncabatoff/process-exporter/archive/v${pkgver}.tar.gz")
sha256sums=('197a950879f90d36e3979ab412c60ec35eec5942451a0105e070a670474d730a')

prepare() {
  cd "${srcdir}/process-exporter-${pkgver}"

  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/github.com/ncabatoff"
  ln -snf "${srcdir}/process-exporter-${pkgver}" "${GOPATH}/src/github.com/ncabatoff/process-exporter"
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/ncabatoff/process-exporter"

  make build
}

check() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/ncabatoff/process-exporter"

  make test
}

package() {
  install -Dm755 "${srcdir}/process-exporter-${pkgver}/process-exporter" "${pkgdir}/usr/bin/process-exporter"
  install -Dm644 "${srcdir}/process-exporter-${pkgver}/packaging/process-exporter.service" \
      "${pkgdir}/usr/lib/systemd/system/process-exporter.service"
  install -Dm644 "${srcdir}/process-exporter-${pkgver}/packaging/conf/all.yaml" \
      "${pkgdir}/etc/process-exporter/all.yaml"
}
