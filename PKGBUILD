# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Ishan Arora <ishanarora@gmail.com>
_base=oct2py
pkgname=python-${_base}
pkgver=5.7.2
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
b2sums=('824c28c81ee6fd1770a37799c7e231be0877e4cf74b3af770a5d1c6f69a11ebfbfaface435ebcb99b02b8fc33abb3402c57b984d40e48418ff543cd5c8a2242f')

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
