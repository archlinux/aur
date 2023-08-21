# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=colour-science
pkgname=python-${_base}
pkgdesc="Colour Science for Python"
pkgver=0.4.2
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
sha512sums=('952a7ced5528bc61f94889531e98ed9c66f3cb2d64a7b9269f844c414caef1565e6e4d921f358b70ddad5fe29492589ffd93ab8c8463114367c0ca58cba11854')

build() {
  cd ${_base//-science/}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base//-science/}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    --ignore=${_base//-science/}/io/luts/tests/test_lut.py \
    --ignore=${_base//-science/}/io/tests/test_image.py \
    --ignore=${_base//-science/}/notation/tests/test_munsell.py \
    --ignore=${_base//-science/}/plotting/tests/test_colorimetry.py \
    --ignore=${_base//-science/}/temperature/tests/test_cie_d.py \
    --ignore=${_base//-science/}/recovery/tests/test_jiang2013.py \
    --ignore=${_base//-science/}/recovery/tests/test_otsu2018.py \
    --ignore=${_base//-science/}/characterisation/tests/test_correction.py \
    --ignore=${_base//-science/}/utilities/tests/test_array.py \
    --ignore=${_base//-science/}/plotting/tests/test_models.py
}

package() {
  cd ${_base//-science/}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
