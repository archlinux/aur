# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='restic-exporter'
pkgname="prometheus-${pkgbase}"
pkgver='2.1.2'
pkgrel='1'
pkgdesc='Prometheus exporter for the Restic backup system'
arch=('x86_64' 'aarch64')
_uri='github.com/ngosang'
url="https://${_uri}/${pkgbase}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-mock' 'python-pytest')
depends=('python-prometheus_client' 'restic')
source=("${pkgbase}-${pkgver}.tar.gz::https://codeload.${_uri}/${pkgbase}/tar.gz/refs/tags/${pkgver}")
sha256sums=('cc1b1259d5e7c3fcff596aaf07e66ea707760107f2fe25685c1631687507bed7')
backup=("etc/prometheus/${pkgname}.env")

prepare() {
  cd "${pkgbase}-${pkgver}"
  sed --in-place \
    --expression 's|User='${pkgbase}'|User='${pkgname}'|g' \
    --expression 's|Group='${pkgbase}'|Group='${pkgname}'|g' \
    --expression 's|EnvironmentFile=-/etc/default/'${pkgbase}'|EnvironmentFile=-/etc/prometheus/'${pkgname}'.env|g' \
    --expression 's|ExecStart=/usr/local/bin/'${pkgbase}'|ExecStart=/usr/bin/'${pkgbase}'|g' \
    "systemd/${pkgbase}.service"

  sed --in-place \
    --expression 's|'${pkgbase}'|'${pkgname}'|g' "systemd/${pkgbase}.sysusers"
}

build() {
  cd "${pkgbase}-${pkgver}"
  export PYTHONWARNINGS="ignore:No GlobalOverrides context is active:UserWarning, ignore:pkg_resources is deprecated as an API:UserWarning"
  python -m build --wheel --no-isolation
}

package() {
  pushd "${pkgbase}-${pkgver}"
  python -m installer --destdir="${pkgdir}" "dist/"*".whl"
  install -Dm0644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0644 "systemd/${pkgbase}" "${pkgdir}/etc/prometheus/${pkgname}"
  install -Dm0644 "systemd/${pkgbase}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm0644 "systemd/${pkgbase}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
