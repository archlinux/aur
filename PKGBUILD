# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=napf
pkgname=python-${_base}
pkgver=0.3.0
pkgrel=1
pkgdesc="nanoflann python bindings for kdtree"
url="https://tataratat.github.io/${_base}"
license=(MIT)
arch=(any)
depends=(python-numpy)
makedepends=(python-build python-installer python-scikit-build-core pybind11 nanoflann)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('48794730c8cdb76d3cb0b7c07ab902a98e9936e5bef3527459ee39a818771d1bb453527bb01c9cb2f2c35738a1cc50f93951eaf92c28df9e79a620d77d200f57')

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
