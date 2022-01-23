# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pythonfinder
pkgname=python-pythonfinder
pkgver=1.2.9
pkgrel=3
pkgdesc="Cross Platform Search Tool for Finding Pythons"
arch=(any)
url="https://github.com/sarugaku/pythonfinder"
license=(MIT)
depends=(python-attrs python-cached-property python-click python-packaging python-six)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
# no tests in sdist tarballs on pypi.org
# https://github.com/sarugaku/pythonfinder/issues/115
# source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=("${_name}-${pkgver}.tar.gz::https://github.com/sarugaku/pythonfinder/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('9f8b68308b55c6ca036cebb4bfc2051944354ce57dc29c2531b19dbbee2d7f184093b0c76516c4fc74c41c493fd92179d3c07c089e0ad23a1783a4b8e0408720')
b2sums=('b71268f844a2b41e10b80633469e1aa83c0ec790ad43ccea7c2f0c8057021cb3762664491e48193c09b064ac0f2022d948c1125cfc72c282e24fac77171dffba')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_name}-${pkgver}"
  export PYTHONPATH="$(pwd)/build/lib:${PYTHONPATH}"
  # disable tests that rely on git cloning: https://github.com/sarugaku/pythonfinder/issues/116
  pytest -v -c /dev/null -k "not test_shims_are_kept and not test_shims_are_removed"
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --optimize=1 --root="${pkgdir}"
  install -vDm 644 {CHANGELOG,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
