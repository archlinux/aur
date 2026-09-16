# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

pkgbase=apache-tvm-ffi
pkgname=('tvm-ffi' 'python-tvm-ffi')
pkgver=0.1.14
pkgrel=1
arch=('any')
pkgdesc='Open ABI and FFI for Machine Learning Systems'
url="https://tvm.apache.org/ffi/"
license=('Apache-2.0')
depends=(
	libbacktrace
)

makedepends=(
	cmake
	ninja
	cython
	python-build
	python-setuptools-scm
	python-scikit-build-core
	python-installer
)

_pypi="https://files.pythonhosted.org/packages"
source=(
	"${_pypi}/source/a/apache_tvm_ffi/apache_tvm_ffi-${pkgver}.tar.gz"
	libbacktrace.patch
)
sha256sums=('1a54bf6188b233ff3926388f95b5f3f424119ff4ec64b833e3ee0e1b620e9da1'
            '9aa106513a511a1bdc1a5c7c9d8ae0beaf9420d70deb630d31e83e7a6e690352')

options=('!strip')
prepare() {
	cd ${pkgbase//-/_}-${pkgver}
	rm -rf 3rdparty/libbacktrace
	cp CMakeLists.txt CMakeLists.bak
	patch CMakeLists.txt < ../libbacktrace.patch
}

build() {
	cd ${pkgbase//-/_}-${pkgver}
	python -m build -wn
}

package_python-tvm-ffi() {
	depends=('libbacktrace' 'python')

	cd ${srcdir}/${pkgbase//-/_}-${pkgver}
	python3 -m installer --prefix ${pkgdir}/usr dist/*${pkgver}*.whl
}

package_tvm-ffi() {
	install -d ${pkgdir}/usr/lib/cmake
	cd ${srcdir}/${pkgbase//-/_}-${pkgver}
	cp -r build/lib/* ${pkgdir}/usr/lib
	cp -r include ${pkgdir}/usr/include
	cp -r cmake/ ${pkgdir}/usr/lib/cmake/tvm-ffi/
}
