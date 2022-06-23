# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname=nanobind-git
pkgver=8555cf8
pkgrel=1
pkgdesc="Seamless operability between C++17 and Python"
arch=('x86_64')
url="https://github.com/wjakob/nanobind"
license=('BSD')
groups=()
depends=('gcc-libs')
makedepends=('cmake' 'python')
optdepends=('python: for python bindings')
checkdepends=('python-pytest')
install=
source=(
	'git+https://github.com/wjakob/nanobind.git'
	'git+https://github.com/Tessil/robin-map'
	'global_cmake_config.patch'
)
md5sums=(
	'SKIP'
	'SKIP'
	'9f801d2a4c27b91ea1c3cb290838d0c3'
)

pkgver() {
	git -C "$srcdir/${pkgname%-git}" describe --long --tags --always | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	git config submodule.ext/robin-map.url $srcdir/robin-map
	git submodule update --init ext/robin_map
}

build() {
	cmake \
		-S "$srcdir/${pkgname%-git}" \
		-B "$srcdir/build" \
		-DCMAKE_BUILD_TYPE="Release"
	make -C "$srcdir/build"

	# python bindings
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

check() {
	pytest "$srcdir/build/tests"
}

package() {
	# python bindings and license
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir" --skip-build --optimize='1'
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

	# built library
	cd "$srcdir/build"
	install -Dm644 tests/libnanobind.so -t "$pkgdir/usr/lib"

	cd "$srcdir/${pkgname%-git}"
	install -Dm644 cmake/nanobind-config.cmake -t "$pkgdir/usr/lib/cmake/${pkgname%-git}"
	cd "$pkgdir/usr/lib/cmake/${pkgname%-git}"
	patch nanobind-config.cmake "$srcdir/global_cmake_config.patch"

	# include files into /usr/lib/cmake/nanobind/include/{nanobind,tsl}
	cd "$srcdir/${pkgname%-git}"
	find include -type f -exec install -Dm 644 "{}" -T "$pkgdir/usr/lib/cmake/${pkgname%-git}/{}" \;
	find src -type f -exec install -Dm 644 "{}" -T "$pkgdir/usr/lib/cmake/${pkgname%-git}/{}" \;
	cd ext/robin_map
	find include -type f -exec install -Dm 644 "{}" -T "$pkgdir/usr/lib/cmake/${pkgname%-git}/{}" \;
}
