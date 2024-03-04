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
sha512sums=('cc77bd7c21cdaf6693ad6d38bc3572b5a078e63f4a0b1af4d0e589cf24307fabc0d46e47bcf6b68e36b4d2782c95d4f459352067f07c20580088d4c6ddf45532')

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
