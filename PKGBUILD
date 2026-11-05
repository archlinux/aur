# Maintainer: Michael Gates <michael at belowthesalt . us>
pkgname=python-ciscoisesdk
_name=ciscoisesdk
pkgver=2.4.7
pkgrel=2
pkgdesc="Cisco Identity Services Engine SDK for Python"
arch=('any')
url="https://github.com/CiscoISE/${_name}"
license=('MIT')
depends=('python' 'python-requests' 'python-requests-toolbelt' 'python-fastjsonschema' 'python-xmltodict')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
options=('!strip')
source=("v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('31e20de50788eac69c891440161d626931a30e99d2a6edc4b255d85dcf8a53eb')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir=test_dir dist/*.whl
  local site_packages
  site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="test_dir/${site_packages}" python -c "import ${_name}; from ${_name} import IdentityServicesEngineAPI; print('Import check passed')"
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
