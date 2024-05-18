# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=napf
pkgname=python-${_base}
pkgver=0.0.8
pkgrel=1
pkgdesc="nanoflann python bindings for kdtree"
url="https://tataratat.github.io/${_base}"
license=(MIT)
arch=(any)
depends=(python-numpy nanoflann)
makedepends=(python-build python-installer python-setuptools python-wheel pybind11)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('399ff195fe3a300320959944453e330c5e067a4970029e302166bb485073fc05bc39c077f4118fcfefa3ec4349f77f64f7cdc0cc059584845aa8dd443766eb19')

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
