# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
_base=flake8-import-order
pkgname=python-${_base}
pkgver=0.18.1
pkgrel=2
pkgdesc="Flake8 and pylama plugin that checks the ordering of import statements"
arch=('any')
url="https://github.com/PyCQA/${_base}"
license=(LGPL3)
depends=(python-pycodestyle)
makedepends=(python-setuptools)
checkdepends=(flake8 pylama python-pytest)
provides=('flake8-import-order')
replaces=('flake8-import-order')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('47e1ef1708a329b93a64cd4223af36bf82b2f0213bd9d5770da2445ce2b2859b333817306e9116075fbc0f83fb0b7c53e0c5f352d4439cfbd41805b9017175d8')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PATH="${PWD}/tmp_install/usr/bin:$PATH" PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest tests
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
