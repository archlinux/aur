# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=napf
pkgname=python-${_base}
pkgver=0.1.0
pkgrel=2
pkgdesc="nanoflann python bindings for kdtree"
url="https://tataratat.github.io/${_base}"
license=(MIT)
arch=(any)
depends=(python-numpy)
makedepends=(python-build python-installer python-scikit-build-core pybind11 nanoflann)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('0b20762077b8c727264ca31a8806152e2be49ba334774ce80f8c34b580f93258e175b2aa05d6bea14ec8fe1c1165a6ddd7b4545591788e045415306067650c27')

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
