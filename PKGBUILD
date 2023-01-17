# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michael Duell <dev _at_ akurei _._ me>
# Contributor: Jian Zeng <anonymousknight96 at gmail dot com>
_base=telegram-send
pkgname=python-${_base}
pkgdesc="Send messages and files over Telegram from the command-line"
pkgver=0.34
pkgrel=2
arch=(any)
url="https://github.com/rahiel/${_base}"
license=(GPL3)
depends=(python-telegram-bot python-colorama python-appdirs)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz
  MAX_MESSAGE_LENGTH.patch::${url}/pull/117.patch)
sha512sums=('9d9ed3db7950d68700686dc79cdd7e84547c50d5dabca2f007dba5de72c6e3f54562f252ff6ddebc1a390dbb84aec54b9c5e8fe770ce8aa2a894c194ea9c8904'
  '7d33dedfc870e5f5c31500362da3cd252800a5a667336155948557ea1887c2e92c583a39c1232e135f879ac9cd6a080eaabda702e9b461daf7f2cd6beb7eb408')

prepare() {
  cd ${_base}-${pkgver}
  # https://github.com/rahiel/telegram-send/issues/115
  patch -p1 -i ../MAX_MESSAGE_LENGTH.patch
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
