# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=neurodiffeq
pkgname=python-${_base}
pkgver=0.6.3
pkgrel=1
pkgdesc="A light-weight & flexible library for solving differential equations using neural networks based on PyTorch"
url="https://github.com/NeuroDiffGym/${_base}"
arch=(any)
license=(MIT)
depends=(python-pytorch tensorboard python-seaborn python-tqdm python-dill)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4215850b1196a2760ec748897f8c30cbbc4e541447c4bc98b0ecdf2674b623ff2f144d089fc260be2f1ce91c3eb5555bc5a971d656ce9b5acd78494c0536e15b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
