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
checkdepends=(python-pytest-mpi vtk libpng fmt jsoncpp verdict freetype2 libxt
  glew ospray openxr openvr ffmpeg hdf5-openmpi postgresql-libs netcdf-openmpi
  pdal opencascade mariadb-libs liblas cgns adios2 libharu qt5-tools python-mpi4py)
optdepends=('python-mpi4py: for activate parallel capabilities')
changelog=CHANGELOG.md
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5a36e46065f66b51bee21f76eeed903ec5e07a04c7ffffc6ce65c5566bc5fef80cda2c6e6e73ef12c6b824b587264717049454343315a7f9f44ba560f720028b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  mpirun -np 2 test-env/bin/python -m pytest tests --only-mpi
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
