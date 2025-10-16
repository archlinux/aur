# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-pytest-gitconfig
pkgdesc='A gitconfig sandbox for testing'
pkgver=0.8.0
pkgrel=1
url='https://github.com/noirbizarre/pytest-gitconfig'
arch=('any')
license=('MIT')

depends=(
  'python-pytest'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-pdm-backend'
)
checkdepends=(
  'git'
)

_pypi=pytest_gitconfig
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '0dc72c2ce96b1ac6f26cb0375aa882ee017fb4833a864f64d0c11998912418dd'
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
  test-env/bin/python -m pytest
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/$_pypi-$pkgver-"*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
