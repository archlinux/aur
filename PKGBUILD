# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Gaël Donval <gdonval+aur at google mail>
_base=odo
pkgname=python-${_base}
pkgver=0.5.1
pkgrel=2
pkgdesc="Data Migration for the Blaze Project"
arch=('any')
url="https://github.com/blaze/${_base}"
license=('BSD')
makedepends=(python-setuptools)
depends=(python-datashape python-pandas python-dask python-networkx)
source=(${_base}-${pkgver}::${url}/archive/${pkgver}.tar.gz)
sha512sums=('20d4660cae170699440bf629568d8170ee69386c4d01eeafd7a5db6b1338202f76b8d6c618cafed966893bb04e7b6b97674e923c6ddfc5a3c16f6e2bd011e2d8')

prepare() {
  # https://github.com/blaze/odo/issues/621#issuecomment-485161314
  sed -i 's/^@convert.register((pd.Timestamp, pd.Timedelta), (pd.tslib.NaTType, type(None)))/@convert.register((pd.Timestamp, pd.Timedelta), (type(pd.NaT), type(None)))/' "${_base}-${pkgver}/${_base}/backends/pandas.py"
}

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package_python-odo() {
  cd "${_base}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
