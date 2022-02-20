# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=colour-science
pkgname=python-${_base}
pkgdesc="Colour Science for Python"
pkgver=0.4.0
pkgrel=1
arch=('x86_64')
url="https://www.${_base}.org"
license=('custom:BSD-3-clause')
depends=(python-imageio python-scipy python-six) # graphviz boost openexr libpng libtiff
makedepends=(python-build python-install python-poetry)
checkdepends=(python-pytest python-pygraphviz python-trimesh python-networkx python-scikit-learn)
optdepends=('python-pygraphviz: for plot automatic colour conversion graph using Graphviz'
  'python-trimesh: for plot the section contour of given hull along given axis and origin'
  'python-networkx: for create a graph with NetworkX')
source=(https://github.com/${_base}/${_base//-science/}/archive/v${pkgver}.tar.gz)
sha512sums=('463f161c34ad2b02e62eb2350b97440a1931f7703706c24b56733b4061893d685eaad1df2820110f4d3be9e96560a57ce15db7c184e40c601d04a3d871ad0d86')

build() {
  cd ${_base//-science/}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base//-science/}-${pkgver}
  MPLBACKEND=Agg python -m pytest -k 'not jakob2019 and not read_image_Imageio and not write_image_Imageio and not read_image and not write_image and not PCA' #--ignore=${_base//-science/}/graph/tests
}

package() {
  cd ${_base//-science/}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
