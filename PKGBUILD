# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=conda-pack
pkgname=python-${_base}
pkgdesc="Package conda environments for redistribution"
pkgver=0.9.2
pkgrel=1
arch=(any)
url="https://github.com/${_base/-pack/}/${_base}"
license=(BSD-3-Clause)
depends=(python-setuptools conda)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('2e3740d3e0a9e9787251b5da0b385e66c56a4b3a820e237fb67c528ee7419dc48ac942fe5f9d74b740539b16eef466dde428ea44510102cdbdb48e4a4d50a707')

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
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
