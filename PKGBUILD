# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ashwin <ashwinvis+arch_@t_Pr0t0nM4il_c0m>
_base=transonic
pkgname=python-${_base}
pkgver=0.5.0
pkgrel=2
pkgdesc="Make your Python code fly at transonic speeds!"
arch=(any)
url="https://foss.heptapod.net/fluiddyn/${_base}"
license=('custom:BSD-3-clause')
depends=(python-beniget autopep8 python-numpy)
optdepends=(
  'python-pythran: compiler backend'
  'python-numba: compiler backend'
  'cython: compiler backend'
  'python-rich: colourful logs'
)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
provides=(${_base})
source=(${url}/-/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('2cc2b9a358436fbeec6418b702cc9efbedf5bf5f88aa4feb9630fc90ff0496af09e9c4c8877e6cc41265281d529f6ee5d4dc20087c81cf42a86633920c6441cf')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest tests -k 'not justintime and not init'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
