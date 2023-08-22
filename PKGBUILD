# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=bezier
pkgname=python-${_base}
pkgver=2023.7.28
pkgrel=1
pkgdesc="Helper for Bézier Curves, Triangles, and Higher Order Objects"
arch=(x86_64)
url="https://github.com/dhermes/${_base}"
license=(Apache)
depends=(${_base} python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-scipy python-sympy python-matplotlib python-seaborn)
optdepends=('python-matplotlib: for plot helper support'
  'python-seaborn: for plot helper support'
  'python-scipy: for convex hull support'
  'python-sympy: for symbolic support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('beec5c3c9f903a81f02cb491a6c0abdf5d0ad8fb0b9a19a30403113b68b4eee1968c2a4ed1e1dbd4b90e9b35316865cbc6350a6799251a1b087c333117dc5492')

build() {
  cd ${_base}-${pkgver}
  BEZIER_INSTALL_PREFIX=/usr \
    TARGET_NATIVE_ARCH=OFF \
    python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests/unit
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
