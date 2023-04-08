# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pyrsistent
pkgver=0.19.3
pkgrel=3
pkgdesc="Persistent/Functional/Immutable data structures"
arch=('x86_64')
license=('MIT')
url="https://github.com/tobgu/pyrsistent"
depends=('glibc' 'python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest' 'python-hypothesis')
source=("https://github.com/tobgu/pyrsistent/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('045d9ca4a2a5c5525887fbbcae77b2bc0271e6a596686ad6281c74fb1f6c8d8a4b0c9444cbd951900d953c61d51cf9452290f1e63e9107f7828bfea6e6b34545')

build() {
  cd pyrsistent-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd pyrsistent-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd pyrsistent-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.mit -t "$pkgdir"/usr/share/licenses/$pkgname/
}
