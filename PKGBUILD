# Maintainer: Bao Trinh <qubidt at gmail>

pkgname=prometheus-pve-exporter
pkgver=3.2.2
pkgrel=1
pkgdesc="Proxmox VE exporter for the Prometheus monitoring system"
arch=('any')
url="https://github.com/prometheus-pve/prometheus-pve-exporter"
license=('Apache')
depends=('python'
         'python-prometheus_client'
         'python-proxmoxer'
         'python-yaml'
         'python-requests'
         'python-werkzeug')
backup=("etc/prometheus/pve.yml")
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/prometheus-pve/prometheus-pve-exporter/archive/refs/tags/v${pkgver}.tar.gz"
        "prometheus-pve-exporter.service"
        "prometheus-pve-exporter.sysusers"
        "prometheus-pve-exporter.tmpfiles"
        "https://raw.githubusercontent.com/prometheus-pve/prometheus-pve-exporter/v${pkgver}/pve.yml"
        )
sha256sums=('733071efe5ba6b89fc6bc6ebe1036c1b510a0483c3e4383f24886d915351f219'
            '5d1227b6e2fdaa27d8ec4ceafebc95074e2f5a1c27df313c3f00f2f85ef3ee34'
            'd230b99e6ec3663ba8785cc61b8b8983a04596eaf0271bfea0d64189eabbd97f'
            'c9eb4acf94e5a7851e90e721e1baa9b77ae0a276975a2f21e74c569a159358a7'
            'ce67d32c0ea739662659dae152fc3735f1f6bcb7c761ba09ac7fa14b643a32be')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm644 "pve.yml" "${pkgdir}/etc/prometheus/pve.yml"
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
