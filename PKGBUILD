# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=uncalled-for
pkgname=python-$_name
pkgver=0.4.1
pkgrel=1
pkgdesc="Async dependency injection for Python functions."
arch=('any')
license=('MIT')
url="https://github.com/chrisguidry/uncalled-for/"
depends=('python')
makedepends=('python-hatchling'
             'python-hatch-vcs'
             'python-build'
             'python-installer'
             'python-wheel')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-pytest-randomly'
              'python-pytest-timeout')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('6412b19d1b1e7d431981fee01f8b47be7802f48328a48cbe9603acee757ec553')

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
