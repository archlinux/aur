# Maintainer: Martin Chang <marty188586@gmail.com>

_pkgname=etaler
pkgname=${_pkgname}-git
pkgver=0.1.5.92.ga033b22
pkgrel=1
pkgdesc='A flexable HTM (Hierarchical Temporal Memory) framework with full GPU support.'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/etaler/Etaler'
license=('BSD')

depends=('tbb')
makedepends=('git' 'cmake' 'catch2' 'cereal')
optdepends=('xtensor: xtensor interop capability'
        'arrayfire: arrayfire interpo capability'
        'opencl-headers: GPU computing support via OpenCL'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=("git+https://github.com/${_pkgname}/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}"/${_pkgname}
	git describe --long --tags 2>/dev/null | sed -r 's/^v//;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	git submodule update --init
	# Cannot use the --recursive flag currently. It works but is slow
	mkdir -p "${srcdir}"/build
}

build() {
	cd "${srcdir}"/build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ../${_pkgname}
	make -j$(nproc)
        tests/etaler_tests
}

package() {
	cd "${srcdir}"/build
	make DESTDIR="${pkgdir}" install
}
