# Maintainer: Bao Trinh <qubidt at gmail>

pkgname=prometheus-pve-exporter
pkgver=3.2.5
pkgrel=1
pkgdesc="Proxmox VE exporter for the Prometheus monitoring system"
arch=('any')
url="https://github.com/prometheus-pve/prometheus-pve-exporter"
license=('Apache-2.0')
depends=('python'
         'python-prometheus_client'
         'python-proxmoxer'
         'python-yaml'
         'python-werkzeug'
         'gunicorn')
backup=("etc/prometheus/pve.yml")
makedepends=('git'
             'python-setuptools')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}"
        "prometheus-pve-exporter.service"
        "prometheus-pve-exporter.sysusers"
        "prometheus-pve-exporter.tmpfiles")
sha256sums=('d76941c855edd35ae0a894f89ccbd3c8c6c3cd836964a037d3a49ee9f8420d7e'
            '5d1227b6e2fdaa27d8ec4ceafebc95074e2f5a1c27df313c3f00f2f85ef3ee34'
            'd230b99e6ec3663ba8785cc61b8b8983a04596eaf0271bfea0d64189eabbd97f'
            'c9eb4acf94e5a7851e90e721e1baa9b77ae0a276975a2f21e74c569a159358a7')

build() {
  cd "${pkgname}"
  python setup.py build
}

package() {
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  cd "${pkgname}"
  install -Dm644 "pve.yml" "${pkgdir}/etc/prometheus/pve.yml"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
