# Maintainer: Mirco Tischler <mt-ml at gmx dot de>
# Contributor: Mirco Tischler <mt-ml at gmx dot de>

pkgname=actor-framework
pkgver=0.16.3
pkgrel=1
pkgdesc="An Open Source Implementation of the Actor Model in C++"
arch=(i686 x86_64)
url="http://actor-framework.org"
license=('custom:"BSD-3-Clause"',
	 'custom:"Boost Software License"')
depends=()
makedepends=('cmake' 'opencl-headers' 'git' 'python' 'opencl-icd-loader' 'chrpath')
optdepends=(
	'python: caf-python'
	'ipython: caf-python'
	'opencl-icd-loader: opencl support'
	'openssl: openssl support'
	)

source=(
	"git+https://github.com/actor-framework/actor-framework#commit=903f801cc479a1dcbc9cc7a0ebdf5f920b981f0c"
	"git+https://github.com/pybind/pybind11.git"
	)
sha256sums=(
	'SKIP'
	'SKIP'
	)

prepare(){
	cd ${pkgname}
	git submodule init libcaf_python/third_party/pybind
	git config submodule.libcaf_python/third_party/pybind.url "${srcdir}/pybind11"
	git submodule update

	# Disable opencl test, it can't work in a clean chroot
	rm libcaf_opencl/test/opencl.cpp


	LDFLAGS=$LDFLAGS CXXFLAGS=$CXXFLAGS \
		./configure   \
		--prefix=/usr \
		--no-examples
}

build() {
	cd ${pkgname}
	make
}

check() {
	cd ${pkgname}
	make test
}

package() {
	cd ${pkgname}
	make DESTDIR="${pkgdir}" install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 LICENSE_ALTERNATIVE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_ALTERNATIVE"

	chrpath -d "${pkgdir}/usr/bin/caf-python"
}
