# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=bezier
pkgname=python-${_base}
pkgver=2024.6.20
pkgrel=1
pkgdesc="Helper for Bézier Curves, Triangles, and Higher Order Objects"
arch=(x86_64)
url="https://github.com/dhermes/${_base}"
license=(Apache-2.0)
depends=(${_base} python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-scipy python-sympy python-matplotlib python-seaborn)
optdepends=('python-matplotlib: for plot helper support'
  'python-seaborn: for plot helper support'
  'python-scipy: for convex hull support'
  'python-sympy: for symbolic support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('add582a0e9724c1952fcb99f2727af71e54f537aeae319b1d9445089423d9d67da599303b190b944a48c155a0e21123861b0506b9aa7f458e689ae0a92c4161a')

build() {
  cd ${_base}-${pkgver}
  CFLAGS="-Wno-incompatible-pointer-types -Wno-implicit-function-declaration -Wno-int-conversion"
  BEZIER_IGNORE_VERSION_CHECK=1 \
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
