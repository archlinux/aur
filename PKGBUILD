# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=morethemes
pkgname=python-${_base}
pkgdesc="More themes for matplotlib"
pkgver=0.7.0
pkgrel=1
arch=(x86_64)
url="https://github.com/y-sunflower/${_base}"
license=(MIT)
depends=(python-pyfonts)
makedepends=(python-build python-installer python-setuptools-scm)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4701f3a569d3b10f15915fd9ba581d988c42d766ecad91c40a2af513a5de4075122f0ecf10035e1cd1ef222c7ff6df28e3c1fdc716e08e820f2eed193ff61e23')

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
