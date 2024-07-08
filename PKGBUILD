# Maintainer: David McInnis <dave@dave3.xyz>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyamg
pkgname=python-${_base}
pkgdesc="Algebraic Multigrid Solvers in Python"
pkgver=5.2.1
pkgrel=1
arch=(x86_64)
url="https://github.com/${_base}/${_base}"
license=(MIT)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel pybind11) # python-matplotlib
# checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('469a5675bb65ff9eadfdbf344c35cb01bebe09c987b493aaeaf5aa98273ebd8071534e25edac82ffc26f39eb3877e1a69cd2a3894de70bcb5396b6cf723aa3b6')

# https://bbs.archlinux.org/viewtopic.php?id=249188
build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -c "import pyamg; pyamg.test()"
#   test-env/bin/python -m pytest
#   local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}{sys.version_info.minor}')")
#   PYTHONPATH="${srcdir}/${_base}-${pkgver}/build/lib.linux-${CARCH}-cpython-${_pyversion}:${PYTHONPATH}"
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
