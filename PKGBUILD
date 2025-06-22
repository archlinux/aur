# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=betterspy
pkgname=python-${_base}
pkgdesc="Show sparsity patterns of sparse matrices"
pkgver=0.1.6
pkgrel=1
arch=(any)
url="https://github.com/nschloe/${_base}"
license=(GPL-3.0-or-later)
depends=(python-matplotlib python-scipy python-pypng)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-imageio)
optdepends=('python-networkx: for creation of graphs')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('322045cdf95a260ef55c478aa9c20b75a2294b8e8843d7cc76de969de4e597ea1a5f45b61b661b901a5f35a4f83f7bc1e3b350d4f8a49ae7bfb827d23d76aa8a')

prepare() {
  sed -i 's/purepng/pypng/' ${_base}-${pkgver}/setup.cfg
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  MPLBACKEND=Agg test-env/bin/python -m pytest \
    --ignore=test/test_readme.py \
    -k 'not readme_images and not png[6875310-kwargs0] and not cli'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
