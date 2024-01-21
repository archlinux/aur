# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=('python-jaraco.packaging' 'python-jaraco.packaging-docs')
pkgbase=python-jaraco.packaging
_name=${pkgname#python-}
pkgver=9.4.0
pkgrel=1
pkgdesc="Tools to supplement packaging Python releases"
arch=('any')
url="https://github.com/jaraco/jaraco.packaging"
license=('MIT')
depends=(
  'python-build'
  'python-jaraco.context'
)
makedepends=(
  'python-domdf-python-tools'
  'python-installer'
  'python-rst.linker'
  'python-setuptools-scm'
  'python-sphinx-furo'
  'python-sphinx-lint'
  'python-wheel'
)
checkdepends=(
  'python-pip'
  'python-pytest'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2690ca1c40ea9edfd3a2aa4887f573714f8a09a484ade0578a66d52778e557b6')

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
