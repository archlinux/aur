# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=control
pkgname=python-$_name
pkgver=0.10.2
pkgrel=6
pkgdesc="Python Control Systems Library."
arch=('any')
license=('BSD-3-Clause')
url="https://github.com/python-control/python-control"
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib')
optdepends=('python-slycot: slycot' 'python-cvxopt: cvxopt' 'python-pandas: pandas')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-numpydoc' 'python-slycot' 'python-cvxopt' 'python-pandas')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
        "https://github.com/python-control/python-control/commit/ae4915c4.patch"
        "https://github.com/python-control/python-control/commit/3b70cb41.patch")
sha256sums=('d0cf63f6cfb68a4c8e827c26c3744d129e9777fedc9a5d86ca4740548f23a98b'
            'a0eafedd5cd870e54ab8df87c1e60291a3d500db6845cf3271f261fa650dee77'
            'b4785175d407d85493935d15746adc086c7158a4873932f16ab7349384af0398')

prepare(){
  cd "$srcdir"/$_name-$pkgver
  patch -Np1 -i ../ae4915c4.patch
  patch -Np1 -i ../3b70cb41.patch
  if ! pacman -Qq blas-openblas &>/dev/null; then
    sed -i "s/('shooting', 3, None, 'xfail')/('shooting', 3, None, 'endpoint')/g" control/tests/optimal_test.py
    sed -i "s/('shooting', 3, 'zero', 'xfail')/('shooting', 3, 'zero', 'endpoint')/g" control/tests/optimal_test.py
    sed -i "s/# ('shooting', 3, 'u0', None)/('shooting', 3, 'u0', None)/g" control/tests/optimal_test.py
  fi
}

build() {
    cd "$srcdir"/$_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" ${_name}/tests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
