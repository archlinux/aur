# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>
_base=hvplot
pkgname=python-${_base}
pkgver=0.8.3
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
sha512sums=('7ed3b6d51e5a6e8a37b7bcda019e79355b134bfbbffdf918659d10f03c224d0ba7101e520b38d43cf467052a005f2611b9e421a825b6b5352e361c32f056f6c6')

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
