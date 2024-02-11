# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=uvw
pkgname=python-${_base}
pkgver=0.6.0
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
sha512sums=('79fc08914255a3ce7fdac9fccd757f605caf6ae1263aff7ee82a3bfbe61e2a4d2bff9957bb3e96e35a15e053f64d6a2d5efc3afa23e6bd47618ce33e8a1dacea')

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
