# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'python-jaraco.packaging'
#  'python-jaraco.packaging-docs'
)
pkgbase=python-jaraco.packaging
_name=${pkgname#python-}
pkgver=10.1.0
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
#  'python-domdf-python-tools'  ## docs
  'python-installer'
#  'python-rst.linker'  ## docs
  'python-setuptools-scm'
#  'python-sphinx-furo'  ## docs
#  'python-sphinx-lint'  ## docs
  'python-wheel'
)
#checkdepends=(
#  'python-pip'
#  'python-pytest'
#)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('788d09f091acda45573e6b61399f5a3d15b17b3da5940f6405c9811854484491')

build() {
  cd "$_name-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation

  # generate html docs
#  PYTHONPATH=./ sphinx-build docs html

  # remove the sphinx-build leftovers
#  rm -rf html/.{doctrees,buildinfo}
}

#check() {
#  cd "$_name-$pkgver"
#  pytest
#}

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
