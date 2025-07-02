# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=morethemes
pkgname=python-${_base}
pkgdesc="More themes for matplotlib"
pkgver=0.4.0
pkgrel=1
arch=(x86_64)
url="https://github.com/JosephBARBIERDARNAL/${_base}"
license=(MIT)
depends=(python-pyfonts)
makedepends=(python-build python-installer python-setuptools-scm)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b6ef5e573ac81f0be2931ec2b1c897d1c240994285647a9267288c108da353aaf1dc50a96f012bec58b44b9e9b897b5ec87faf4579ad4821eff0a726d006db30')

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
