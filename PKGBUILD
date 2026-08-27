# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=fudelab
pkgname=python-${_base}-git
pkgver=r16.fbc7e4b
pkgrel=1
pkgdesc="Fuzzy Differential Equations Laboratory"
arch=(any)
url="https://gitlab.com/lizethsilveraquispe988/${_base}"
license=(GPL-3.0-only)
depends=(python-matplotlib python-scipy python-click)
makedepends=(python-build python-installer python-setuptools-scm git)
checkdepends=(python-pytest)
provides=(python-${_base})
conflicts=(python-${_base})
source=(git+${url}.git#branch=main)
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
