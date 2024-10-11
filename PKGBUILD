# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=colour-science
pkgname=python-${_base}
pkgdesc="Colour Science for Python"
pkgver=0.4.6
pkgrel=1
arch=(any)
url="https://${_base}.org"
license=(BSD-3-Clause)
depends=(python-imageio python-scipy) # boost openexr libpng libtiff
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest-xdist python-networkx python-pydot python-av python-trimesh) # openimageio
optdepends=('python-matplotlib: for plot diagrams'
  'python-networkx: for create a graph with NetworkX'
  # 'opencolorio: '
  'python-pandas: for use dataframes'
  'python-pydot: for plot automatic colour conversion graph using Graphviz'
  'python-tqdm: for compute hull section'
  'python-trimesh: for plot the section contour of given hull along given axis and origin')
  # 'python-xxhash: '
source=(${_base//-science/}-${pkgver}.tar.gz::https://github.com/${_base}/${_base//-science/}/archive/v${pkgver}.tar.gz)
sha512sums=('074262ba14ce66e833d3780e2ddf74e77ea915609f8a92bb94916f9b03d9b3a6a7e058d86f50e84542883bb7beca5c57e3fe75dc5f7f5f576411a270390f4935')

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
