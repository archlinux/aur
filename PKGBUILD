# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=colour-science
pkgname=python-${_base}
pkgdesc="Colour Science for Python"
pkgver=0.4.7
pkgrel=1
arch=(any)
url="https://${_base}.org"
license=(BSD-3-Clause)
depends=(python-numpy) # boost openexr libpng libtiff
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest-xdist python-networkx python-pydot python-av python-trimesh) # openimageio
optdepends=('python-matplotlib: for plot diagrams'
  'python-networkx: for create a graph with NetworkX'
  # 'opencolorio: '
  'python-pandas: for use dataframes'
  'python-pydot: for plot automatic colour conversion graph using Graphviz'
  'python-tqdm: for compute hull section'
  'python-imageio'
  'python-trimesh: for plot the section contour of given hull along given axis and origin')
  # 'python-xxhash: '
source=(${_base//-science/}-${pkgver}.tar.gz::https://github.com/${_base}/${_base//-science/}/archive/v${pkgver}.tar.gz)
sha512sums=('25a484be6750e5acc08c59a92532b1fe567ab59ed12e602559d3e28a4fa68ef0820e57a7f3db879911b5df157d4425465b8e346fa30342fdfcdbc32b24142dc3')

build() {
  cd ${_base//-science/}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base//-science/}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    -k 'not write_image_Imageio and not read_image_Imageio and not read_image and not write_image and not int_digest'
}

package() {
  cd ${_base//-science/}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
