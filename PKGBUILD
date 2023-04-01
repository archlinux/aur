# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=torchdyn
pkgname=python-${_base}
pkgdesc="A PyTorch library entirely dedicated to neural differential equations, implicit models and related numerical methods"
pkgver=1.4.0.1
pkgrel=1
arch=(any)
url="https://github.com/DiffEqML/${_base}"
license=(Apache)
depends=(python-torchcde python-scikit-learn python-pytorch-lightning python-torchvision python-matplotlib)
makedepends=(python-build python-installer python-poetry)
checkdepends=(python-pytest) # python-poethepoet
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('119632764113c7c03300202c3b4bdde138c6b450f60aedf054ba57257e726f011d94638ebb800e4375c54ad1db5c94b14e9bd77d7add86c12a77e500c04196b6')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest test
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
