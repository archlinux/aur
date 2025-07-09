# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=neurodiffeq
pkgname=python-${_base}
pkgver=0.7.0
pkgrel=1
pkgdesc="A light-weight & flexible library for solving differential equations using neural networks based on PyTorch"
url="https://github.com/NeuroDiffGym/${_base}"
arch=(any)
license=(MIT)
depends=(python-pytorch tensorboard python-seaborn python-tqdm python-dill python-ordered-set)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7e4e470daa9427dcb18a95c7e0c3ec8278323e822f87a19593f4d13e447c78ca9cf2a6b669ab498b8b0b32c841451d4f052bc1e2778c71c16b33fbdef235292e')

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
