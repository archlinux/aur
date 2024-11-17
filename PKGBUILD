# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=conda-pack
pkgname=python-${_base}
pkgdesc="Package conda environments for redistribution"
pkgver=0.8.1
pkgrel=1
arch=(any)
url="https://github.com/${_base/-pack/}/${_base}"
license=(BSD-3-Clause)
depends=(python conda)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('091620b80537342105983ced518a7b1de84207be486f23186bd05aad27aceb0e9ffe342ce7a17985b9aa5b920880e34bbad3db5e91147e3fc19bc3dc30fcb3c7')

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
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
