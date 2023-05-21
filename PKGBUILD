# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=quicktions
pkgname=python-${_base}
pkgver=1.14
pkgrel=1
pkgdesc="Fast fractions data type for rational numbers"
arch=(x86_64)
url="https://github.com/scoder/${_base}"
license=(Python)
depends=(glibc)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
# checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('e3fc652919b1eb95783d7860ba2481238b72e86ecc71ab5431fde4ec9e51d281d66f2f5f97d5b42089dde384b04bf92eea2edca859ce680cf16483224b7c0513')

prepare() {
  sed -i 's/format_spec, \//format_spec/' ${_base}-${pkgver}/src/quicktions.pyx
}

build() {
  cd ${_base}-${pkgver}
  # needs to build src/quicktions.c first
  python setup.py build_ext --inplace --with-cython
  python -m build --wheel --skip-dependency-check --no-isolation
}

# # tests segfault
# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
