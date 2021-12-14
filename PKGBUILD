# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>
_base=yep
pkgname=python-${_base}
pkgdesc="A module for profiling compiled extensions"
pkgver=0.4
pkgrel=2
arch=('any')
url="https://pypi.python.org/pypi/${_base}/"
depends=(gperftools python)
license=(BSD)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('c27273b64052dd2337b3f47c1e97e0aa1dea6995a554e1d938d128150da357a061e6df3b2a7cead6b6f416b9c1ab7f8f502401ec86574052f6c1fb654daaf170')

prepare() {
  cd "${_base}-${pkgver}"
  sed -n '/License, (C)/p' README.rst >LICENSE
}

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
