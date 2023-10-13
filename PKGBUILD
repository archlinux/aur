# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Leo Mao <leomaoyw at gmail dot com>
_base=pymanopt
pkgname=python-${_base}
pkgdesc="Toolbox for optimization on Riemannian manifolds with support for automatic differentiation"
pkgver=2.2.0
pkgrel=1
arch=(x86_64)
url="https://${_base}.github.io"
license=('custom:BSD-3-clause')
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest python-autograd python-tensorflow python-pytorch python-jax)
optdepends=('python-autograd: for support'
  'python-jax: for support'
  'python-tensorflow: for support'
  'python-pytorch: for support')
source=($pkgname-$pkgver.tar.gz::https://github.com/${_base}/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('89ea7055de53bf7cf241c5f5e21f5ac449b3e82fa7c4ecbe572f769c5d75481ff0e8aa0cfbcb4d5666c79ae3dc75eb24bc3426d492998860a60cefa254cc184f')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not multiexpm_conjugate_symmetric and not SpecialOrthogonalGroup and not UnitaryGroup and not TestSingleStiefelManifold and not TestMultiStiefelManifold' \
    --ignore=tests/manifolds/test_positive_definite.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
