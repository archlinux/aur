# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PyFinitDiff
pkgname=python-${_base,,}
pkgdesc="A package for generating finite-difference matrices, particularly suited for physics and engineering applications"
pkgver=2.1.6
pkgrel=1
arch=(any)
url="https://github.com/MartinPdeS/${_base}"
license=(MIT)
depends=(python-scipy python-mpsplots python-tabulate)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4143b7de46e254baa28d536e84555b02ef9688b36dec5679ed7ee5bc040bcfe0ac67d039ecec74ac4d53780206a0008539c41e2105c3a850efeb94cd02bb595e')

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
