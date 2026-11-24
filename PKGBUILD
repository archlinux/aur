# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Based on https://gitlab.archlinux.org/archlinux/packaging/packages/python-mpi4py/-/raw/main/PKGBUILD
_base=numba-mpi
pkgname=python-${_base}
pkgdesc="Numba @njittable MPI wrappers tested on Linux, macOS and Windows"
pkgver=1.4.1
pkgrel=1
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(GPL-3.0-or-later)
depends=(python-numba python-mpi4py python-psutil)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest python-matplotlib)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('29cbab59bedc0e8fca12d9aa5f09fc02a55117a8c70d3d5e5aee63a5102925fc001d3447c73b9ccd138da9b0762975594b2ec3aa9dd00a5f946377f3ee6b13a0')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  export OMPI_MCA_rmaps_base_oversubscribe=yes

  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  mpiexec -np 2 test-env/bin/python -m pytest -k 'not test_paper_listings[files3] and not test_wall_segfault'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
