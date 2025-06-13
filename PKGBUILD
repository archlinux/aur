# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
_base=flake8-import-order
pkgname=python-${_base}
pkgver=0.19.0
pkgrel=1
pkgdesc="Flake8 and pylama plugin that checks the ordering of import statements"
arch=('any')
url="https://github.com/PyCQA/${_base}"
license=(LGPL3)
depends=(python-pycodestyle)
makedepends=(python-setuptools)
checkdepends=(flake8 pylama python-pytest)
provides=('flake8-import-order')
replaces=('flake8-import-order')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('12a8145daf6a7d2d45dc57edefe9b43a5c5584064d7fdabc351f8fd290bd5e12da1c511cdcfe4118dbfb1f81c709b7a99c180215675e98bcbff6158f1f84f1fb')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PATH="${PWD}/tmp_install/usr/bin:$PATH" PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
