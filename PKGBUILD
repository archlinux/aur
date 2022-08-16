# Maintainer: Liam Timms <timms5000@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=triangle
pkgname=python-${_base}
pkgver=20220202
pkgrel=2
pkgdesc="Python bindings to the triangle library"
url="https://github.com/drufat/${_base}"
arch=(any)
license=(LGPL3)
depends=(python-numpy) # triangle
makedepends=(git python-setuptools)
checkdepends=(python-pytest)
optdepends=('python-matplotlib: for Matplotlib rendering')
source=("git+${url}.git?#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  cd ${_base}
  git submodule init && git submodule update
  python setup.py clean --all
  python setup.py build
}

check() {
  local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}{sys.version_info.minor}')")
  cd ${_base}
  PYTHONPATH="build/lib.linux-$CARCH-cpython-${_pyversion}:${PYTHONPATH}" \
    PYTHONDONTWRITEBYTECODE=1 \
    pytest -v tests
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
