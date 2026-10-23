# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=findiff
pkgname=python-${_base}
pkgdesc="Python package for finite difference derivatives in any number of dimensions"
pkgver=0.16.0
pkgrel=1
arch=(any)
url="https://github.com/maroba/${_base}"
license=(MIT)
depends=(python-scipy python-sympy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('4c38e7c990779c6a2d5360661d719b2e4936a102d5b0265f9cf5f4db7db814235aad9db154d413da6a1f956152e2ab127f56bbe45f1c2695f34105c7b33ce82e')

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
