# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=colour-science
pkgname=python-${_base}
pkgdesc="Colour Science for Python"
pkgver=0.4.3
pkgrel=1
arch=(any)
url="https://${_base}.org"
license=('custom:BSD-3-clause')
depends=(python-imageio python-scipy) # graphviz boost openexr libpng libtiff
makedepends=(python-build python-installer python-poetry-core python-wheel)
checkdepends=(python-pytest-xdist python-networkx python-trimesh python-pygraphviz)
optdepends=('python-matplotlib: for plot diagrams'
  'python-networkx: for create a graph with NetworkX'
  'python-pandas: for use dataframes'
  'python-pygraphviz: for plot automatic colour conversion graph using Graphviz'
  'python-tqdm: for compute hull section'
  'python-trimesh: for plot the section contour of given hull along given axis and origin')
source=(${_base//-science/}-${pkgver}.tar.gz::https://github.com/${_base}/${_base//-science/}/archive/v${pkgver}.tar.gz)
sha512sums=('55630444e8d219291a6f24f6bb38d6ae07d1d5ea8ec3a820413d5b88e5841075d5bfbfc1935c8cf2285cd025ab1a3fde9cade29a122f18136444ff75895d36c6')

build() {
  cd ${_base//-science/}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base//-science/}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    -k 'not read_image_Imageio and not read_image and not write_image_Imageio and not write_image and not int_digest'
}

package() {
  cd ${_base//-science/}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
