# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Eric Hugoson
pkgname=python-requirements-detector
_name=${pkgname#python-}
pkgver=1.6.0
pkgrel=1
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
sha256sums=('f874aa6113a9f7218329afc28caa49ff9842cdb4f3ea0a5d13723d0945ed92cb')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python -m venv --clear --without-pip --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest
}

package() {
  cd "$_name-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
