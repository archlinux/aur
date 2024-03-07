# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=uvw
pkgname=python-${_base}
pkgver=0.7.0
pkgrel=1
pkgdesc="Universal VTK Writer for Numpy Arrays"
arch=(x86_64)
url="https://github.com/prs513rosewood/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest vtk libpng fmt jsoncpp verdict freetype2 libxt
  glew ospray openxr openvr ffmpeg hdf5-openmpi postgresql-libs netcdf-openmpi
  pdal opencascade mariadb-libs liblas cgns adios2 libharu qt5-tools python-mpi4py)
optdepends=('python-mpi4py: for ')
changelog=CHANGELOG.md
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9bccca28bfad3889c85e669d6076674a5e6892f23cc820bae4c7521f183e73cd59eeb8d1482a06904cbd62678983e04167dfc994b71cb8b999a3e310bed865a7')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    --ignore=tests/test_vtk_files.py \
    --ignore=tests/test_parallel.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
