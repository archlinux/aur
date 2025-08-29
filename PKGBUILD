# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-caerus
pkgdesc='Detection of favorable moments in time series data'
pkgver=1.0.0
pkgrel=1
url='https://github.com/erdogant/caerus'
arch=('any')
license=('MIT')

depends=(
  'python-matplotlib'
  'python-numpy'
  'python-pandas'
  'python-requests'
  'python-tqdm'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)

_pypi=caerus
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '6b8db65b1d27be4472a9e73aa9dc3c19cce9b7e78bfc872633eeebc3ba4d8717'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --no-isolation --wheel
}

check() {
  rm -rf test-env
  python -m venv --system-site-packages test-env

  cd test-env
  bin/python -m installer "$srcdir/$_pypi-$pkgver/dist/caerus-$pkgver"-*.whl
  bin/python -m pytest "$srcdir/$_pypi-$pkgver/tests"
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/"caerus-$pkgver"-*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
