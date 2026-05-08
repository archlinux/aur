# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

pkgbase=apache-tvm-ffi
pkgname=('tvm-ffi' 'python-tvm-ffi')
pkgver=0.1.11
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
	gcc
#	dlpack
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
sha256sums=(
	'153cd2c5a9717804cb0bcd9b2709f22a1e5f80ed05b5a490faf5949b136eedba'
	'eb549f83265dd06550672f68daeb5f4bc20c20b41bcfd162710e639248b4e4cc'
)

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
	depends=('python')

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
