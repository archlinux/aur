# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=('python-jaraco.packaging' 'python-jaraco.packaging-docs')
pkgbase=python-jaraco.packaging
_name=${pkgname#python-}
pkgver=9.2.0
pkgrel=1
pkgdesc="Tools to supplement packaging Python releases"
arch=('any')
url="https://github.com/jaraco/jaraco.packaging"
license=('MIT')
depends=('python' 'python-build' 'python-jaraco.context')
makedepends=('python-installer' 'python-setuptools-scm' 'python-wheel'
             'python-rst.linker' 'python-sphinx-furo' 'python-sphinx-lint') # for building docs
checkdepends=('python-pip' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1b06a2a700975c298e793264f07ca522cfec778c03eeae28395af97c3b1b23e3')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation

  # generate html docs
  # this package requires itself to build docs :/
  PYTHONPATH=./ sphinx-build docs html

  # remove the sphinx-build leftovers
  rm -rf html/.{doctrees,buildinfo}
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package_python-jaraco.packaging() {
  optdepends=('python-jaraco.packaging-docs: offline docs')

  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python-jaraco.packaging-docs() {
  pkgdesc+=" (docs)"
  depends=()

  cd "$_name-$pkgver"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -r html/* "$pkgdir/usr/share/doc/$pkgname/"
}
