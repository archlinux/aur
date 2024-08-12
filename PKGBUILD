# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Ishan Arora <ishanarora@gmail.com>
_base=oct2py
pkgname=python-${_base}
pkgver=5.7.1
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
b2sums=('f920564361fe3efa2159b2d7c8175435716250c548c8a46a110d511311686ca924dc0f6079f5f4796f85ab569dc9e923198f45db93688be3b770786cc8925b20')

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
