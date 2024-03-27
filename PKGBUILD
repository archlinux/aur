# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=('python-jaraco.packaging' 'python-jaraco.packaging-docs')
pkgbase=python-jaraco.packaging
_name=${pkgname#python-}
pkgver=9.4.0
pkgrel=2
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
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9055ceb3dc03ecb069df5459669b80a6890780602be933fb9e21f4dc79b7a923')

build() {
  cd "$_name-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
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
