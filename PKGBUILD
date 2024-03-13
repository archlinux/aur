# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Ishan Arora <ishanarora@gmail.com>
_base=oct2py
pkgname=python-${_base}
pkgver=5.6.1
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
b2sums=('f9d1c04b7ff99399de6d32216eabcc2045c79441ce809754948baf67d6a2d88d3d34b33b83b476376dfe773287c43ee62fa9bd9540c2cf917e659c6e9b12a52c')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    --ignore=tests/test_usage.py \
    -k 'not deprecated_return_both'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
