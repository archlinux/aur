# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyfonts
pkgname=python-${_base}
pkgdesc="A simple and reproducible way of using fonts in matplotlib"
pkgver=1.1.1
pkgrel=1
arch=(x86_64)
url="https://github.com/JosephBARBIERDARNAL/${_base}"
license=(MIT)
depends=(python-matplotlib python-requests)
makedepends=(python-build python-installer python-setuptools-scm)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('83340aa8ae81536f1603e0561d396ef1285b0910e9d0f796197eac4fcdc2e14df9462b2158816cbacabab373fea0b2dcfce0d8da85a88fe319d95c4cb8f3339b')

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
