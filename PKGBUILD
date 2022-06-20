# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=autodiff
pkgver=0.6.8
pkgrel=2
pkgdesc="Automatic differentiation made easier for C++"
arch=('x86_64')
url="https://github.com/autodiff/autodiff"
license=('MIT')
depends=('gcc-libs')
makedepends=(
	'cmake'
	'eigen'
	'catch2'
	'pybind11'
	'python'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel')
optdepends=('ccache: faster compilations')
provides=('python-autodiff')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('680fc476ed218a3a0eeb0de017d427921189b50c99e1c509395f10957627fb1a')

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

package() {
	DESTDIR="$pkgdir/" cmake --build build --target install
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	python -m installer --destdir="$pkgdir/" "$srcdir"/build/python/package/dist/*.whl
}
