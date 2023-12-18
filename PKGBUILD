# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=colour-science
pkgname=python-${_base}
pkgdesc="Colour Science for Python"
pkgver=0.4.4
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
sha512sums=('339dc5a33a953f9a2af106a11ff03ad9258e449ab1cd22355ac90c8b080f95a6250a347c07c8e7beeb64ad9bd02dab5cf042c5fc6968d80a46acded39d3397b5')

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
