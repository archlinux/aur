# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyoxipng
pkgname=python-${_base}
pkgdesc="Python wrapper for multithreaded .png image file optimizer oxipng"
pkgver=9.0.0
pkgrel=1
arch=(x86_64)
url="https://github.com/nfrasser/${_base}"
license=(MIT)
depends=(python oxipng)
makedepends=(python-build python-installer python-maturin python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9c483b1886906157d2d8e3284fd90ccfd8bc0dbb5f24c9dee8db7fa7cd4ba8c2a878c2685e5fb50f3a3b57f9dda1eea9c9da1cff4d2ad7e8c739cfd0391fce3e')

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
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
