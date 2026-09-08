# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=uncalled-for
pkgname=python-$_name
pkgver=0.4.0
pkgrel=1
pkgdesc="Async dependency injection for Python functions."
arch=('any')
license=('MIT')
url="https://github.com/chrisguidry/uncalled-for/"
depends=('python')
makedepends=('python-hatchling' 'python-hatch-vcs' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-randomly' 'python-pytest-timeout')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('335b95bd2422332ec210d518f314a16e4c640921c39fc8bf2ad095bd3538f4af')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --override-ini="addopts="
    --timeout=30
    --import-mode=importlib
  )
  cd "$srcdir"/${_name//-/_}-$pkgver
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
