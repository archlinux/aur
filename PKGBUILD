# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=uncalled-for
pkgname=python-$_name
pkgver=0.2.0
pkgrel=1
pkgdesc="Async dependency injection for Python functions."
arch=('any')
license=('MIT')
url="https://github.com/chrisguidry/uncalled-for/"
depends=('python')
makedepends=('python-hatchling' 'python-hatch-vcs' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-randomly' 'python-pytest-timeout')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('b4f8fdbcec328c5a113807d653e041c5094473dd4afa7c34599ace69ccb7e69f')

prepare(){
  cd "$srcdir"/${_name//-/_}-$pkgver
  sed -i '/--cov/d' pyproject.toml
}

build() {
    cd "$srcdir"/${_name//-/_}-$pkgver
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/${_name//-/_}-$pkgver
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
