# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-client
pkgname=python-${_base}
pkgdesc="Internal client of trame"
pkgver=2.7.5
pkgrel=2
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools nodejs-lts-fermium npm)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e72038e020f6bc1e378e4ce4fcd2d2c4ace1bc8dd88ef6bb503cc10052ed81c8566df142ee7e7bae55d93fceec4c03896cce8f9b59777755325b4e15a8265d0d')

build() {
  cd ${srcdir}/${_base}-${pkgver}/vue2-app
  npm install
  npm run build
  cd ${srcdir}/${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
