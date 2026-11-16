# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

pkgbase=apache-tvm-ffi
pkgname=('tvm-ffi' 'python-tvm-ffi')
pkgver=0.1.16
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
sha256sums=('2e8926324a69779d1447f1b04d5b0268caefe7353bfa67a9aa56989d45e5aab3'
            '05a20b2ff4fddaaead9c8d7581cf416ea6ebfb860c940395a4ec9c9dbbd215db')

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
