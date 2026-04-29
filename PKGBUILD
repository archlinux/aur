# Maintainer: Pascal Lynxon <gfcwfzkm@protonmail.com>

_name=dependency-injector
pkgname=python-dependency-injector
pkgver=4.49.0
pkgrel=1
pkgdesc="Dependency injection framework for Python"
arch=('x86_64')
url="https://github.com/ets-labs/python-dependency-injector"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'cython')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ets-labs/python-dependency-injector/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c3476730a7154ea99f2707121a4667eee00229a82a1703a94ae8afaa0549188e')

build() {
  # 2. Navigate to the GitHub-style extracted directory
  cd "$pkgname-$pkgver"

  # 3. Tell setuptools exactly what version we are building
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

  # Clean up and regenerate C files with modern Cython
  find src -name '*.c' -delete
  cythonize -3 src/dependency_injector/*.pyx

  # Build the wheel
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  # Install the wheel
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install the license
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
