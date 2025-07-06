# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=control
pkgname=python-${_name}
pkgver=0.10.2
pkgrel=3
pkgdesc="Python Control Systems Library."
arch=('any')
license=('BSD-3-Clause')
url="https://github.com/python-control/python-control"
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib')
optdepends=('python-slycot: slycot' 'python-cvxopt: cvxopt' 'python-pandas: pandas')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-numpydoc' 'python-slycot' 'python-cvxopt' 'python-pandas')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('d0cf63f6cfb68a4c8e827c26c3744d129e9777fedc9a5d86ca4740548f23a98b')

prepare(){
  cd "${srcdir}"/${_name}-${pkgver}
  sed -i "s/('shooting', 3, None, 'xfail')/('shooting', 3, None, 'endpoint')/g" control/tests/optimal_test.py
  sed -i "s/('shooting', 3, 'zero', 'xfail')/('shooting', 3, 'zero', 'endpoint')/g" control/tests/optimal_test.py
  sed -i "s/# ('shooting', 3, 'u0', None)/('shooting', 3, 'u0', None)/g" control/tests/optimal_test.py
}

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "${srcdir}"/${_name}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" ${_name}/tests
}

package() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
