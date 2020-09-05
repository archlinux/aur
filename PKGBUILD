# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-quaternionic
pkgver=0.1.10
pkgrel=2
pkgdesc="Interpret NumPy arrays as quaternionic arrays with Numba acceleration"
url="https://quaternionic.readthedocs.io"
arch=('any')
license=('MIT')
depends=('python-numba' 'python-numpy' 'python-scipy')
makedepends=('python-dephell')
checkdepends=('python-pytest' 'python-pytest-cov')

source=(
  "quaternionic-$pkgver.tar.gz::https://github.com/moble/quaternionic/archive/v$pkgver.tar.gz"
)
sha256sums=(
  'dbc0125a94458e6f2a62b00a79ce61f495f798aaebb44e17c0eba5988cee4080'
)

prepare() {
	cd "quaternionic-$pkgver"

	# The release is tagged as 0.1.10 on PyPI and GitHub but the version number
	# in pyproject.toml says 0.1.9.
	sed -i -e 's/^version = "0.1.9"$/version = "0.1.10"/' pyproject.toml

	# The archive from GitHub doesn't include a setup.py (the project uses
	# python-poetry for development). The source on PyPI does have a setup.py
	# but does not include the tests. Until they can be included, we'll use the
	# GitHub archive and generare our own setup.py.
	dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "quaternionic-$pkgver"
	python setup.py build
}

check() {
	cd "quaternionic-$pkgver"

	# The library uses importlib_metadata to load its version info, so we need
	# the metadata available before we can run the tests.
	python setup.py egg_info -e build/lib
	PYTHONPATH=$PWD/build/lib python -m pytest

	# This metadata is not properly versioned (neither project nor Python
	# version). Remove it and let the install command create the final version.
	rm -r build/lib/quaternionic.egg-info
}


package() {
	cd "quaternionic-$pkgver"
	python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
