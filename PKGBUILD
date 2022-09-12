# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=conda-pack
pkgname=python-${_base}
pkgdesc="Package conda environments for redistribution"
pkgver=0.7.0
pkgrel=1
arch=(any)
url="https://github.com/${_base/-pack/}/${_base}"
license=('custom:BSD-3-clause')
depends=(python conda)
makedepends=(python-setuptools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('c2a995ce2d1d7971aa4e86161729dbde759903113ef571f389f52b45c260f006bf46852b604d409311216dd92a93e21e04a7018f9d38a729c2c95629a9bcfb54')

prepare() {
  if hash conda 2>/dev/null; then
    echo "Conda detected."
  else
    echo
    echo -e "\e[1m\e[5m\e[31mPlease make sure that (ana/mini)conda is sourced in bashrc, zshrc, etc.\e[0m"
    echo
    return 1
  fi
}

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
