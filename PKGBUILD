# Maintainer: Wallun <wallun@disroot.org>
pkgname=prometheus-libvirt-exporter
pkgver=2.5.0
pkgrel=1
pkgdesc="A prometheus exporter for libvirt"
arch=('x86_64')
url="https://github.com/inovex/prometheus-libvirt-exporter"
options=()
license=(MIT)
depends=()
optdepends=()
makedepends=(
  'go'
  'goreleaser'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        prometheus-libvirt-exporter.service)
sha256sums=('2e44aab64c6377a3338fac5b10c87d77276c4f9ecebb240f2a4e085c63a02a7e'
            'fd2852b523324e4b97efbe280b36b615f6d54895280b5ddd30e9fe60152bbec2')

prepare() {
  # Add a template in snapshot to avoid seing version X.Y.Z-SNAPSHOT-rndmhash
  # when running 'prometheus-libvirt-exporter --version'
  echo "snapshot:" | \
  tee -a "${srcdir}/${pkgname}-${pkgver}/.goreleaser.yml"
  echo "  version_template: \"${pkgver}\"" | \
  tee -a "${srcdir}/${pkgname}-${pkgver}/.goreleaser.yml"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || 1

  export GORELEASER_CURRENT_TAG="v${pkgver}"
  export EXPORTER_VERSION="${pkgver}"

  goreleaser build --clean \
                   --single-target \
                   --snapshot
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install binary
  install -D -m0775 "${srcdir}/${pkgname}-${pkgver}/dist/prometheus-libvirt-exporter_linux_amd64_v1/${pkgname}"\
    "${pkgdir}/usr/bin/${pkgname}"

  # Install systemd service file
  install -D -m0644 "${srcdir}/${pkgname}.service" \
   "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
