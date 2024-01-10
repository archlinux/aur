# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=quicktions
pkgname=python-${_base}
pkgver=1.16
pkgrel=1
pkgdesc="Fast fractions data type for rational numbers"
arch=(x86_64)
url="https://github.com/scoder/${_base}"
license=(Python)
depends=(python glibc)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('4fc9f083bbc4f0a2bc18d020ff0d66765e03ff4049069892ab47439d6efd01c40d68f4d56596effd9118ee97cae8e0513698bb2e0e0881218093da3983c20554')

build() {
  cd ${_base}-${pkgver}
  # needs to build src/quicktions.c first
  python setup.py build_ext --inplace --with-cython
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
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
