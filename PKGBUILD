# Maintainer: David McInnis <dave@dave3.xyz>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyamg
pkgname=python-${_base}
pkgdesc="Algebraic Multigrid Solvers in Python"
pkgver=5.3.0
pkgrel=1
arch=(x86_64)
url="https://github.com/${_base}/${_base}"
license=(MIT)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel pybind11) # python-matplotlib
# checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f2e11705cfbcd28a59a7ec226eb9d5f4ef978adb9104953c6f5f01868d82c9e4f7605ecc57664e467cf78733f5ebc2ec80859a7136cd5c1c4351c603a978a5fc')

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
