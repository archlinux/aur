# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-quaternionic
pkgver=1.0.3
pkgrel=1
pkgdesc="Interpret NumPy arrays as quaternionic arrays with Numba acceleration"
url="https://quaternionic.readthedocs.io"
arch=('any')
license=('MIT')
depends=('python-numba' 'python-numpy' 'python-scipy')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov')

_pypi="quaternionic"
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '94a458b1628c7fe2a7d8d184bd2010efbdb8d85e631be7bf88c47630e930a213'
)

build() {
	cd "$_pypi-$pkgver"
	python setup.py build
}

check() {
	cd "$_pypi-$pkgver"

	# The library uses importlib_metadata to load its version info, so we need
	# the metadata available before we can run the tests.
	python setup.py egg_info -e build/lib
	PYTHONPATH=$PWD/build/lib python -m pytest --no-cov

	# This metadata is not properly versioned (neither project nor Python
	# version). Remove it and let the install command create the final version.
	rm -r build/lib/quaternionic.egg-info
}

package() {
	cd "$_pypi-$pkgver"
	python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
