# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Based on https://gitlab.archlinux.org/archlinux/packaging/packages/python-mpi4py/-/raw/main/PKGBUILD
_base=numba-mpi
pkgname=python-${_base}
pkgdesc="Numba @njittable MPI wrappers tested on Linux, macOS and Windows"
pkgver=1.3.0
pkgrel=3
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(GPL-3.0-or-later)
depends=(python-numba python-mpi4py python-psutil)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest python-matplotlib)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('aad15e36f1547ded082c5cbf7bbbf5650aacf2563c9ab3a53a1a46e6c085ae6e3f933f12d8b96a8722e3348ca97b22daaecc2b4652f82e8fd8896b5888a63cab')

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
