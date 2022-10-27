# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=stringly
pkgname=python-${_base}
pkgdesc="Stringly typed command line interface"
pkgver=1.0b3
pkgrel=1
arch=(any)
url="https://github.com/evalf/${_base}"
license=(MIT)
depends=(python-typing_extensions)
makedepends=(python-build python-flit-core python-installer)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('e7268f21fea6dc3ab4320e210dc0e38e084b7a645e37de6b51250c865f15b4a495f90df50d4acbbf9a8d7e4bd4d1dbc543e9c033c151e4ab16d972c092875426')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m unittest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
