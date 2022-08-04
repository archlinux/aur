# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=autodiff
pkgname=('autodiff' 'python-autodiff')
pkgver=0.6.9
pkgrel=1
pkgdesc="Automatic differentiation made easier for C++"
arch=('any')
url="https://github.com/autodiff/autodiff"
license=('MIT')
makedepends=(
	'catch2'
	'cmake'
	'eigen'
	'pybind11'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('eae26c9dcd8b423ebcecd1a65365c2af2be80cb6cd273602787900939626a961')

build() {
	cmake \
		-B build \
		-S "$pkgname-$pkgver" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON \
		-DAUTODIFF_BUILD_TESTS=ON \
		-DAUTODIFF_BUILD_PYTHON=ON \
		-DAUTODIFF_BUILD_EXAMPLES=OFF
	cmake --build build
	cd build/python/package
	python -m build --wheel --no-isolation
}

check() {
	cmake --build build --target tests
}

package_autodiff() {
	DESTDIR="$pkgdir/" cmake --build build --target install
	install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python-autodiff() {
	depends=('python')
	arch=('x86_64')
	pkgdesc+=' -- Python bindings'

	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" build/python/package/dist/*.whl
	install -Dm644 "$pkgbase-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
