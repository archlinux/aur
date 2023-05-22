# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=codepy
pkgname=python-${_base}
pkgdesc="Generate and execute native code at run time"
pkgver=2023.1
pkgrel=1
arch=(x86_64)
url="https://documen.tician.de/${_base}"
license=(MIT)
depends=(python-cgen boost)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('ebc4e6a5e9747176d1ef6e254efe4d81f590ef5486476326383afe133b3b712a38d59d7c9a5cdb576fd19380baa87f9cc9b4874bc051b0f7e70693d8c225406f')

build() {
  cd ${_base}-${pkgver}
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
