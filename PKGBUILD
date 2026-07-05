# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Eric Hugoson
pkgname=python-requirements-detector
_name=${pkgname#python-}
pkgver=1.5.0
pkgrel=2
pkgdesc="Python tool to find and list requirements of a Python project"
arch=('any')
url="https://github.com/prospector-dev/requirements-detector"
license=('MIT')
depends=(
  'python-astroid'
  'python-packaging'
  'python-semver'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-benchmark'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f110c5f3a7b84e6378a514b7a9e22832002ded696468be809f6dba2f4c5bafc3')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python -m venv --clear --without-pip --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "$_name-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
