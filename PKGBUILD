# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=colour-science
pkgname=python-${_base}
pkgdesc="Colour Science for Python"
pkgver=0.4.1
pkgrel=1
arch=('x86_64')
url="https://${_base}.org"
license=('custom:BSD-3-clause')
depends=(python-imageio python-scipy python-six) # graphviz boost openexr libpng libtiff
makedepends=(python-build python-install python-poetry)
checkdepends=(python-pytest python-pygraphviz python-trimesh python-networkx python-scikit-learn)
optdepends=('python-pygraphviz: for plot automatic colour conversion graph using Graphviz'
  'python-trimesh: for plot the section contour of given hull along given axis and origin'
  'python-networkx: for create a graph with NetworkX')
source=(https://github.com/${_base}/${_base//-science/}/archive/v${pkgver}.tar.gz)
sha512sums=('15679f75b65b219bd4e28e02832fb79098ecd79315119bfb2f15ad6277d256575bcac2dc57c6dbf8b09efe95c8b39cf7ccf16d392cbac3f15759bd0c4b64a25f')

build() {
  cd ${_base//-science/}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base//-science/}-${pkgver}
  MPLBACKEND=Agg python -m pytest -k 'not jakob2019 and not otsu2018 and not read_image_Imageio and not write_image_Imageio and not read_image and not write_image' #--ignore=${_base//-science/}/graph/tests
}

package() {
  cd ${_base//-science/}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
