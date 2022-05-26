# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-rst.linker
_name=${pkgname#python-}
pkgver=2.3.0
pkgrel=2
pkgdesc="Can add links and perform other custom replacements to rst"
arch=('any')
url="https://github.com/jaraco/rst.linker"
license=('MIT')
depends=('python' 'python-dateutil' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
#makedepends+=('python-jaraco.packaging' 'python-sphinx') # for building docs
checkdepends=('python-path' 'python-pip' 'python-pytest-black' 'python-pytest-checkdocs'
              'python-pytest-cov' 'python-pytest-enabler' 'python-pytest-flake8'
              'python-pytest-mypy' 'python-types-python-dateutil')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9acefd0fdaf64b25ecf00ae85af5d994ee49120199b7e057f1394c7ae7ba2918')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation

  # generate html docs
  # this package requires itself to build docs :/
#  PYTHONPATH=./ sphinx-build docs html

  # remove the sphinx-build leftovers
#  rm -rf html/.{doctrees,buildinfo}
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
