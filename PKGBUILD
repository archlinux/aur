# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>
_base=hvplot
pkgname=python-${_base}
pkgver=0.7.3
pkgrel=2
pkgdesc="A high-level plotting API for pandas, dask, xarray, and networkx built on HoloViews"
arch=('any')
url="https://${_base}.holoviz.org"
depends=(python-holoviews)
license=('custom:BSD-3-clause')
# makedepends=(python-setuptools)
checkdepends=(python-nose python-parameterized) # python-pytest python-xarray
# optdepends=()
source=(${_base}-${pkgver}::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('3b74cff253c489e74aa54bba5faee33618e1e254ba6487874524171fb0025063bec2629bfc98ee8b0a19237dbb7c28226a6816eaeb388d50457b92a2be94eee2')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  # https://stackoverflow.com/a/58440525/9302545
  nosetests -v "${_base}" -a '!test_pandas_series_plot_returns_holoviews_object_7_barh'
}

package() {
  cd "${_base}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
