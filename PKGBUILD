# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-rst.linker
_name=${pkgname#python-}
pkgver=2.6.0
pkgrel=2
pkgdesc="Tools for adding metadata and hyperlinks to reStructuredText"
arch=('any')
url="https://github.com/jaraco/rst.linker"
license=('MIT')
depends=(
  'python-jaraco.vcs'
  'python-jaraco.context'
  'python-six'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-path'
  'python-pytest'
#  'pytest-checkdocs'  ## TODO, optional
#  'python-pytest-enabler'  ## optional
#  'python-pytest-mypy'  ## optional
#  'python-pytest-ruff'  ## optional
  'python-pytest-subprocess'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0f45f2542e0888ebc6b611291ad7ee80448d3cf70b24cf587dabe5ca189cc8b5')

prepare() {
  cd "${_name}-$pkgver"

  # Skip coverage 
  sed -i '/pytest-cov/d' pyproject.toml
}

build() {
  cd "$_name-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH=. pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
