# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=conda-pack
pkgname=python-${_base}
pkgdesc="Package conda environments for redistribution"
pkgver=0.7.1
pkgrel=1
arch=(any)
url="https://github.com/${_base/-pack/}/${_base}"
license=('custom:BSD-3-clause')
depends=(python conda)
makedepends=(python-setuptools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('7bd0e257d98abb200e87a64aa76484fb8cb5749749071566b14cdc1139c07beee56b3a25ff5ef29110d1ba1bbd18d5214af935a0e44df04ed9563bb5ff7e8e12')

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
