# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=colour-science
pkgname=python-${_base}
pkgdesc="Colour Science for Python"
pkgver=0.4.5
pkgrel=1
arch=(any)
url="https://${_base}.org"
license=(BSD-3-Clause)
depends=(python-imageio python-scipy python-trimesh) # boost openexr libpng libtiff
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest-xdist python-networkx python-pydot python-av) # openimageio
optdepends=('python-matplotlib: for plot diagrams'
  'python-networkx: for create a graph with NetworkX'
  # 'opencolorio: '
  'python-pandas: for use dataframes'
  'python-pydot: for plot automatic colour conversion graph using Graphviz'
  'python-tqdm: for compute hull section'
  # 'python-xxhash: '
)
source=(${_base//-science/}-${pkgver}.tar.gz::https://github.com/${_base}/${_base//-science/}/archive/v${pkgver}.tar.gz)
sha512sums=('5e4198d2f2412e7766daecfd75913a0c1e21efcab8a7977507322a79e2adef442be0e683e42d55820becbae409df3795b3864bee2254978807166497215f3c0c')

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
