# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=foamlib
pkgname=python-${_base}
pkgdesc="A Python interface for interacting with OpenFOAM"
pkgver=0.9.1
pkgrel=1
arch=(any)
url="https://github.com/gerlero/${_base}"
license=(GPL-3.0-or-later)
depends=(python-aioshutil python-numpy python-pyparsing openfoam-com)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('3f5a1ee2b0bed066cec9f731de8fc263470604a5209b9d8f7388985f2b1a071fcb306b51993d872a894195820f38086f3b2789e622fcd41aa728d32fabecd933')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
