# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=npx
pkgname=python-${_base}
pkgdesc="Some useful extensions for NumPy"
pkgver=0.1.8
pkgrel=1
arch=(any)
url="https://github.com/sigma-py/${_base}"
license=(BSD-3-Clause)
depends=(python-numpy)
makedepends=(python-build python-setuptools python-installer python-wheel)
checkdepends=(python-pytest-codeblocks)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('fcb0d960ba1e3d9702c5037ba730a17da8131dfdda5ab5dd645e4eb4bf3d7b4fe5aee3d654113d8da94581ca17e66e1940773d3b6d6c11b55f9c5c6d450c4f3c')

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

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-$pkgver.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
