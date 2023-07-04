# Maintainer: David McInnis <dave@dave3.xyz>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyamg
pkgname=python-${_base}
pkgdesc="Algebraic Multigrid Solvers in Python"
_gitcommit=425f80070eefc7f4fcc6246a3b6f815f5fdbb507
pkgver=5.0.1
pkgrel=1
arch=(x86_64)
url="https://github.com/${_base}/${_base}"
license=(MIT)
depends=(python-scipy python-setuptools)
makedepends=(python-build python-installer python-setuptools-scm python-wheel pybind11 git) # python-matplotlib
# checkdepends=(python-pytest)
source=("${_base}-${pkgver}::git+${url}.git?signed#commit=${_gitcommit}")
validpgpkeys=('4DDCC34E24417C71C667DC2850BBE7E24BA62FF7') # Luke Olson <luke.olson@gmail.com>
sha512sums=('SKIP')

# https://bbs.archlinux.org/viewtopic.php?id=249188
build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest
#   local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}{sys.version_info.minor}')")
#   PYTHONPATH="${srcdir}/${_base}-${pkgver}/build/lib.linux-${CARCH}-cpython-${_pyversion}:${PYTHONPATH}"
#   python -c "import pyamg; pyamg.test()"
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
