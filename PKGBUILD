# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyfonts
pkgname=python-${_base}
pkgdesc="A simple and reproducible way of using fonts in matplotlib"
pkgver=1.4.0
pkgrel=1
arch=(x86_64)
url="https://github.com/y-sunflower/${_base}"
license=(MIT)
depends=(python-matplotlib python-requests)
makedepends=(python-build python-installer python-setuptools-scm)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5bb6d3edb8d32a50fe4e021f2e528ced5f531a1fe2db34d7404d14ec0606184839816c0a2bb751d21d75f37a14dca5517f4797a5a28a6c298f2f89ef3fa5c95e')

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
