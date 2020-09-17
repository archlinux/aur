# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-quaternionic
pkgver=0.2.0
pkgrel=1
pkgdesc="Interpret NumPy arrays as quaternionic arrays with Numba acceleration"
url="https://quaternionic.readthedocs.io"
arch=('any')
license=('MIT')
depends=('python-numba' 'python-numpy' 'python-scipy')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov')

source=(
  "https://files.pythonhosted.org/packages/source/q/quaternionic/quaternionic-$pkgver.tar.gz"
)
sha256sums=(
  'bf17cb455eb9717f82b5670d037ebb6c0f18985848151bb4a3e783ca48503686'
)

build() {
	cd "quaternionic-$pkgver"
	python setup.py build
}

check() {
	cd "quaternionic-$pkgver"

	# The library uses importlib_metadata to load its version info, so we need
	# the metadata available before we can run the tests.
	python setup.py egg_info -e build/lib
	PYTHONPATH=$PWD/build/lib python -m pytest --no-cov

	# This metadata is not properly versioned (neither project nor Python
	# version). Remove it and let the install command create the final version.
	rm -r build/lib/quaternionic.egg-info
}


package() {
	cd "quaternionic-$pkgver"
	python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
