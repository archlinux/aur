# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='restic-exporter'
pkgname="prometheus-${pkgbase}"
pkgver='2.1.0'
pkgrel='1'
pkgdesc='Prometheus exporter for the Restic backup system'
arch=('x86_64' 'aarch64')
_uri='github.com/ngosang'
url="https://${_uri}/${pkgbase}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-sphinx'
	     'python-mock' 'python-pytest')
depends=('restic')
source=("${pkgbase}-${pkgver}.tar.gz::https://codeload.${_uri}/${pkgbase}/tar.gz/refs/tags/${pkgver}"
	"${pkgname}.sysusers")
sha256sums=('0be9139ab174a20fc4b549e6d45326664a77b02b2a2554be22ad636aef019448'
            '87216fd93e8320a1456ba3cc97d655a0fd1a823b33bb19654ba940082685639c')
backup=("etc/conf.d/${pkgname}")

prepare() {
  cd "${pkgbase}-${pkgver}"
  sed -i \
    -e 's|User='${pkgbase}'|User='${pkgname}'|g' \
    -e 's|Group='${pkgbase}'|Group='${pkgname}'|g' \
  "systemd/${pkgbase}.service"
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
  install -Dm0644 "systemd/${pkgbase}" "${pkgdir}/etc/conf.d/${pkgname}"
  install -Dm0644 "systemd/${pkgbase}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  popd
  install -Dm0644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
