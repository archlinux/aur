# Maintainer: David McInnis <dave@dave3.xyz>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyamg
pkgname=python-${_base}
pkgdesc="Algebraic Multigrid Solvers in Python"
pkgver=5.4.1
pkgrel=2
arch=(x86_64)
url="https://github.com/${_base}/${_base}"
license=(MIT)
depends=(python-scipy)
makedepends=(python-build python-installer meson-python pybind11 python-versioningit git)
# checkdepends=(python-pytest) # python-matplotlib
source=(${_base}-${pkgver}::git+${url}.git#tag=v${pkgver})
sha512sums=('a19a7cec58fa834d7262cc2e68db76fa39bac82910a53bb9fee0a6cc55224ddcec98076613a7d09b4c1f8d114d7c2d76722953557a846e527d5de6b19c925c58')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest --pyargs ${_base}
#   test-env/bin/python -c "import pyamg; pyamg.test()"
#   local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}{sys.version_info.minor}')")
#   PYTHONPATH="${srcdir}/${_base}-${pkgver}/build/lib.linux-${CARCH}-cpython-${_pyversion}:${PYTHONPATH}"
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
