# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Based on https://gitlab.archlinux.org/archlinux/packaging/packages/python-mpi4py/-/raw/main/PKGBUILD
_base=numba-mpi
pkgname=python-${_base}
pkgdesc="Numba @njittable MPI wrappers tested on Linux, macOS and Windows"
pkgver=1.4.2
pkgrel=1
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(GPL-3.0-or-later)
depends=(python-numba python-mpi4py python-psutil)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest python-matplotlib)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('163fc66c469603742a2f497a05a488d09ce6e35b9cd03837d211c673281a4bb7a632871fcada30d61951734f13f84f8816e4fc9e07861300627aabc75eb0ebdf')

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
