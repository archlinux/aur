# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-quaternionic
pkgver=1.0.13
pkgrel=1
pkgdesc="Interpret NumPy arrays as quaternionic arrays with Numba acceleration"
url="https://quaternionic.readthedocs.io"
arch=('any')
license=('MIT')
depends=('python-numba' 'python-numpy' 'python-scipy')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov')

_pypi="quaternionic"
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  'd44f7a539b9363f0c9c65acc08a7db8861acbceffb012b79ed291d1a20cfd3b2'
)

build() {
	cd "$_pypi-$pkgver"
	python -m build --no-isolation --wheel
}

check() {
	cd "$_pypi-$pkgver/tests"
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer "../dist/$_pypi-$pkgver-"*.whl
	test-env/bin/python -m pytest
}

package() {
	cd "$_pypi-$pkgver"
	python -m installer --destdir="$pkgdir" "dist/$_pypi-$pkgver-"*.whl
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
