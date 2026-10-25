# Maintainer: Michael Gates <michael at belowthesalt . us>
pkgname=python-pan-os-upgrade-assurance
_name=pan-os-upgrade-assurance
pkgver=2.1.1
pkgrel=1
pkgdesc="Libraries for Palo Alto Networks PAN-OS Upgrade Assurance"
arch=('any')
url="https://github.com/PaloAltoNetworks/${_name}"
license=('ISC')
depends=('python' 'python-pan-os-python' 'python-xmltodict' 'python-pyopenssl' 'python-packaging' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-poetry')
checkdepends=('python-pytest' 'python-deepdiff')
source=("v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5b7b1d0cc0c270b74865d1ebc472056372a02c307af99ca5f1faeb4e6ea2bef9')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir=test_dir dist/*.whl
  local site_packages
  site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="test_dir/${site_packages}" python -c "import panos_upgrade_assurance; from panos_upgrade_assurance.firewall_proxy import FirewallProxy; print('Import check passed')"
  PYTHONPATH="test_dir/${site_packages}" pytest --deselect=tests/test_standards.py -o addopts="" -x --tb=short
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
