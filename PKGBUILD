# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'python-jaraco.packaging'
#  'python-jaraco.packaging-docs'
)
pkgbase=python-jaraco.packaging
_name=${pkgbase#python-}
pkgver=10.2.2
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
checkdepends=(
  'python-docutils'
  'python-domdf-python-tools'
  'python-pip'
  'python-pytest'
  'python-sphinx'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d7adf9e4be8a4f3dd669f146450ede2f6a04f79c208f5e742ba41784a536d3ed')

build() {
  cd "$_name-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation

  # generate html docs
#  PYTHONPATH=./ sphinx-build docs html

  # remove the sphinx-build leftovers
#  rm -rf html/.{doctrees,buildinfo}
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH=./ pytest
}

package_python-jaraco.packaging() {
  optdepends=(
  'python-docutils: Sphinx plugin'
  'python-domdf-python-tools: Sphinx plugin'
#  'python-jaraco.packaging-docs: offline docs'
  'python-sphinx: Sphinx plugin'
  'python-virtualenv: pypa/build#266'
)

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
