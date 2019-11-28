# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=pptk
pkgname=python-$_name-git
pkgver=r49.697c09a
pkgrel=4
pkgdesc="Python package for visualizing and processing 2-d/3-d point clouds"
arch=('x86_64')
url="https://github.com/heremaps/pptk.git"
license=('MIT')
depends=(
	'eigen'
	'intel-tbb'
	'python-numpy'
	'qt5-base'
)
makedepends=(
	'cmake'
	'git'
	'patchelf'
	'python-pip'
	'python-setuptools'
	'python-wheel'
)
provides=('python-pptk')
source=(
	git+https://github.com/heremaps/pptk.git
)
sha256sums=(
	'SKIP'
)

pkgver() {
	cd "$srcdir/$_name"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_name"
	sed -i 's,.*,,g' pptk/libs/CMakeLists.txt
	sed -i 's,PythonLibs 2.7 REQUIRED,PythonLibs 3.5 REQUIRED,' CMakeLists.txt
	sed -i 's,../libs/qt_plugins,/usr/lib/qt/plugins,' pptk/viewer/qt.conf
	cmake . \
		-DEigen_INCLUDE_DIR:FILEPATH="/usr/include/eigen3" \
		-DNumpy_INCLUDE_DIR="$(python -c 'import numpy; print("%s/numpy" % numpy.get_include())')" \
		-DPPTK_PATCHELF:FILEPATH="/usr/bin/patchelf" \
		-DTBB_INCLUDE_DIR:FILEPATH="/usr/include/tbb" \
		-DTBB_tbb_LIBRARY:FILEPATH="/usr/lib/libtbb.so" \
		-DTBB_tbb_RUNTIME:FILEPATH="/usr/lib/libtbb.so" \
		-DTBB_tbbmalloc_LIBRARY:FILEPATH="/usr/lib/libtbbmalloc.so" \
		-DTBB_tbbmalloc_RUNTIME:FILEPATH="/usr/lib/libtbbmalloc.so"
}

build() {
	cd "$srcdir/$_name"
	make
	python setup.py bdist_wheel
}

package() {
	cd "$srcdir/$_name"
	_py_version=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ./dist/*.whl
	python -O -m compileall "${pkgdir}/usr/lib/python${_py_version}/site-packages/$_name"
}

