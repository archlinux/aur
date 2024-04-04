# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=quicktions
pkgname=python-${_base}
pkgver=1.18
pkgrel=1
pkgdesc="Fast fractions data type for rational numbers"
arch=(x86_64)
url="https://github.com/scoder/${_base}"
license=(PSF-2.0)
depends=(python glibc)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('7c25e44f7be0219900405775c83167500b39e4070bf7950e45f8bc6d0b60e1322e3b8ea7837e4eacf4afeb44a378aaa866ca92d872a89f4143ce91d45b58f4b5')

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
