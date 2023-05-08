# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
_base=pyfma
pkgname=python-${_base}
pkgdesc="Fused multiply-add (with a single rounding) for Python"
pkgver=0.1.6
pkgrel=3
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel pybind11)
checkdepends=(python-pytest-codeblocks)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('be7ebe4c86b408d573ead5e72cf9e0336a9a00277b0a4ea7f6b6e0f77f57474aa98bfce4622d90cdf4cb977023d022b8f68c2c74a4907aa361247e8029069c9d')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --codeblocks
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
