# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=bottombar
pkgname=python-${_base}
pkgdesc="Context manager that prints a status line at the bottom of a terminal window"
pkgver=1.0
pkgrel=1
arch=(any)
url="https://github.com/evalf/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-flit-core python-install)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('7984bfff6d93e298c1320f76fe6a04243a4e5fcf5425932d5a8f67eeed1b1ad7300da7d43cc09db6b0b79dfeb726508f59283613baac71d3cbf4c3530451de31')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m install --optimize=1 dist/*.whl
#   test-env/bin/python tests.py
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
