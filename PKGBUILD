# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=morethemes
pkgname=python-${_base}
pkgdesc="More themes for matplotlib"
pkgver=0.5.1
pkgrel=1
arch=(x86_64)
url="https://github.com/y-sunflower/${_base}"
license=(MIT)
depends=(python-pyfonts)
makedepends=(python-build python-installer python-setuptools-scm)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6b2b9d0ed89cab933f4f9b2f92a1ba37b0528fc0683720b4db7d38cfa56d63fe919061c983e181522d675e2952dd8af7f7c6c4c075a089491daab7ad41d4483f')

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
