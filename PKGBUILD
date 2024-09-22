# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Leo Mao <leomaoyw at gmail dot com>
_base=pymanopt
pkgname=python-${_base}
pkgdesc="Toolbox for optimization on Riemannian manifolds with support for automatic differentiation"
pkgver=2.2.1
pkgrel=1
arch=(x86_64)
url="https://${_base}.github.io"
license=(BSD-3-Clause)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
# checkdepends=(python-pytest python-autograd python-tensorflow python-pytorch python-jax)
optdepends=('python-autograd: for cost function support'
  'python-jax: for cost function support'
  'python-tensorflow: for cost function support'
  'python-pytorch: for cost function support')
source=(${_base}-${pkgver}.tar.gz::https://github.com/${_base}/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('99ca3a35e5a9fc2e9d4a09440fda6c74af97f779218115325e5743f16ad33f64edda67ea0b83c14c081943ba412bb19ea118ee5fe1c9afbc2fb2058d7860549c')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest \
#     -k 'not multiexpm_conjugate_symmetric and not SpecialOrthogonalGroup and not UnitaryGroup and not TestSingleStiefelManifold and not TestMultiStiefelManifold' \
#     --ignore=tests/manifolds/test_positive_definite.py
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
