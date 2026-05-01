# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=morethemes
pkgname=python-${_base}
pkgdesc="More themes for matplotlib"
pkgver=0.6.0
pkgrel=1
arch=(x86_64)
url="https://github.com/y-sunflower/${_base}"
license=(MIT)
depends=(python-pyfonts)
makedepends=(python-build python-installer python-setuptools-scm)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('cb857cf9b450c64d57ca22603f684a2be02cb45f1702f4f55eee71d3728a669010f327c6b2f4b88e99dc91f04d0c46f528af73aae385e716f8ea9c4d2cc2ec75')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
