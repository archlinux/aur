# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-lazrs
pkgdesc="Python bindings for laz-rs (LAZ compression)"
pkgver=0.9.0
pkgrel=1
url='https://github.com/laz-rs/laz-rs-python'
arch=('x86_64')
license=('MIT')

depends=(
  'glibc'
  'libgcc'
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-maturin'
)

_pypi=lazrs
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '6a5dfeba24da5544580712f687cf2539f797092baa661f4bf057a1ffa3c88746'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --no-isolation --wheel
}

check() {
  cd "$_pypi-$pkgver"
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pypi-$pkgver-"*.whl
  test-env/bin/python -c 'import lazrs'
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/$_pypi-$pkgver-"*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
