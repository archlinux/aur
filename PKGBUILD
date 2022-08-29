# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>
_base=hvplot
pkgname=python-${_base}
pkgver=0.8.1
pkgrel=1
pkgdesc="A high-level plotting API for pandas, dask, xarray, and networkx built on HoloViews"
arch=(any)
url="https://${_base}.holoviz.org"
depends=(python-holoviews)
license=('custom:BSD-3-clause')
# makedepends=(python-setuptools)
checkdepends=(python-pytest python-parameterized python-xarray python-pooch python-scipy python-netcdf4 python-streamz python-matplotlib) # python-plotly python-geoviews
optdepends=('python-xarray: for datetime handled as xarray data')
source=(${_base}-${pkgver}.tar.gz::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('a3c6e8d51212bcc8b798f0ce754241a270270fcdfe0ea89e1be84b48ace5d0d87410aa28fbc4abf4a8765ac8e2227ae9fecd1879778f3d44600ae8bd7bbdaf7a')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  # https://stackoverflow.com/a/58440525/9302545
  python -m pytest -k 'not help_style_extension_output and not plotly'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  rm "${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")"/${_base}/.version
}
