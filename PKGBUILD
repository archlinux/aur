# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

_name=executing
pkgname=python38-executing
pkgver=1.2.0
pkgrel=1
pkgdesc='Get the currently executing AST node of a frame, and other information'
arch=('any')
url=https://github.com/alexmojaki/executing
license=('MIT')
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm'
             'python38-wheel')
checkdepends=('python38-asttokens' 'python38-littleutils' 'python38-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('19da64c18d2d851112f09c287f8d3dbbdf725ab0e569077efb6cdcbd3497c107')
b2sums=('662048e98a1eb3128dd57bbd61a8b7d7fb90dcf5adabc532c69f9ecce2a8ca73cf496ce7ba9b19c94d40083be1382b59dd673b36840e004a7cd0add888292ada')

build() {
  cd "$_name-$pkgver"
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python3.8 -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python tests/test_main.py
  test-env/bin/python -m pytest tests/test_pytest.py
}

package() {
  cd "$_name-$pkgver"
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python3.8 -m "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_name-$pkgver.dist-info/LICENSE.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
