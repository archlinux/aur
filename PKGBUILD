# Maintainer: Michael Gates <michael at belowthesalt . us>
pkgname=python-pan-os-python
_name=pan-os-python
pkgver=1.13.1
pkgrel=1
pkgdesc="Framework for interacting with Palo Alto Networks devices via API"
arch=('any')
url="https://github.com/PaloAltoNetworks/${_name}"
license=('ISC')
depends=('python' 'python-pan-python')
makedepends=('python-build' 'python-installer' 'python-poetry' 'python-httpx')
checkdepends=('python-pytest')
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1785bce918591b156078f221b9ef445d17676f8b563fd47ce7959a5225c1f739')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir=test_dir dist/*.whl
  local site_packages
  site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="test_dir/${site_packages}" python -c "import panos; from panos.firewall import Firewall; print('Import check passed')"
  PYTHONPATH="test_dir/${site_packages}" pytest --deselect=tests/live/ --deselect=tests/test_standards.py -o addopts="" -x --tb=short
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
