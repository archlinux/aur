# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=conda-pack
pkgname=python-${_base}
pkgdesc="Package conda environments for redistribution"
pkgver=0.9.1
pkgrel=1
arch=(any)
url="https://github.com/${_base/-pack/}/${_base}"
license=(BSD-3-Clause)
depends=(python conda)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('db80587fd3c5325cad025da8bbc959ce2e2db25ae9b8e91b8268a2f57931bfc11ee4ef4dfb2189e44bf657f3e0f0603cb45231fbbc7449b61b0af2e2a56e3142')

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
