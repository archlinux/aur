# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ashwin <ashwinvis+arch_@t_Pr0t0nM4il_c0m>
_base=transonic
pkgname=python-${_base}
pkgver=0.6.1
pkgrel=1
pkgdesc="Make your Python code fly at transonic speeds!"
arch=(any)
url="https://foss.heptapod.net/fluiddyn/${_base}"
license=('custom:BSD-3-clause')
depends=(autopep8 python-beniget python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
optdepends=('python-pythran: compiler backend'
  'python-numba: compiler backend'
  'cython: compiler backend'
  'python-rich: colourful logs')
provides=(${_base})
source=(${_base}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('f72aa69ffd1cbb4a726e2d01ba42f90800fe6ff2525be2bf766ed8a6f08c55972c40e2e3eb990602db0323efd34a7cd8e487599cbbf329cd199be119fadb985c')
build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests -k 'not justintime and not init'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
