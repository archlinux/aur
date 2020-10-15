# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=python-akro
_name=${pkgname#python-}
pkgver=0.0.8
pkgrel=1
pkgdesc="Spaces types for reinforcement learning"
arch=('any')
url="https://github.com/rlworkgroup/akro"
license=('MIT')
depends=(
	'python'
	'python-gym'
	'python-numpy'
)
optdepends=()
makedepends=('python-setuptools')
checkdepends=(
	'python-pytest'
	'python-pytest-cov'
	'python-pytest-xdist'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "$_name-fix-test-imports.patch")
sha256sums=('4fc0dc1acf35db19b39a209e20ce14dc8197723c73d3adf3ba7f8cdc1dbf6e58'
            '7fa5b22dec473c540c9962143ab90f6dbf3487f1909b7aa7cdd2d34fb7e2343d')

prepare() {
	cd "$_name-$pkgver"
	patch -p1 -i "$srcdir/$_name-fix-test-imports.patch"
}

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

check() {
	cd "$_name-$pkgver/build/lib"
	# Test excludes:
	#   _tf: Requires tensorflow < 2, a large dependency
	#   _theano: Requires theano, a large dependency
	#   test_hash: Python hashes are not reproducible...
	#   TestBox::test_invalid_env: Tests gym.Box.__init__, and gym's error
	#       seems to have changed from what they expected.
	python -m pytest "$srcdir/$_name-$pkgver/tests" \
		-k 'not _tf and not _theano and not test_hash and not test_invalid_env'
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
