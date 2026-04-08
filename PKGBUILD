# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

pkgbase=apache-tvm-ffi
pkgname=('tvm-ffi' 'python-tvm-ffi')
pkgver=0.1.10
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
	python-scikit-build-core
	python-installer
)

_pypi="https://files.pythonhosted.org/packages"
source=(
	"${_pypi}/source/a/apache_tvm_ffi/apache_tvm_ffi-${pkgver}.tar.gz"
	libbacktrace.patch
)
sha256sums=(
	'974c208766c304c780c17c6d405449e862f83b22c7b6b2b8c28b29d55a806ae3'
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
	python3 -m installer --prefix ${pkgdir}/usr dist/*.whl
}

package_tvm-ffi() {
	install -d ${pkgdir}/usr/lib/cmake
	cd ${srcdir}/${pkgbase//-/_}-${pkgver}
	cp -r build/lib/* ${pkgdir}/usr/lib
	cp -r include ${pkgdir}/usr/include
	cp -r cmake/ ${pkgdir}/usr/lib/cmake/tvm-ffi/
}
