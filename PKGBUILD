# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=napf
pkgname=python-${_base}
pkgver=0.0.7
pkgrel=1
pkgdesc="nanoflann python bindings for kdtree"
url="https://tataratat.github.io/${_base}"
license=(MIT)
arch=(any)
depends=(python-numpy nanoflann)
makedepends=(python-build python-installer python-setuptools python-wheel pybind11)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('daaece5d2799c3a86260f7a9fc90310e05a078714ede30bd387f787b9e93ed9f4644f8d0063e7688c996a1a2a7f1e2296f685c57a134741a034e2f2216614032')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer ${_base}-${pkgver}/dist/*.whl
  test-env/bin/python -m pytest ${_base}-${pkgver}
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
