# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Ishan Arora <ishanarora@gmail.com>
_base=oct2py
pkgname=python-${_base}
pkgver=5.8.0
pkgrel=1
pkgdesc="Python to GNU Octave bridge --> run m-files from python"
arch=(any)
url="http://github.com/blink1073/${_base}"
license=(MIT)
depends=(python-scipy jupyter-octave_kernel gnuplot)
makedepends=(python-build python-installer python-setuptools python-hatchling python-wheel)
checkdepends=(python-pytest-timeout octave-signal python-pandas) # jupyter-nbconvert
optdepends=('python-pandas: for Pandas DataFrames and Series support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('799ea74f333e243755b5cb3379b5fb7d6c47f44dc7c0b755ba4260c4549b1fa196f97ee5a81972e1ac1819f857e71cb8b46ff40e0c598860fd9ea80a2bb0ee77')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
