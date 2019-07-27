# Maintainer: Marcel Röthke <marcel.roethke@haw-hamburg.de>
# Contributor: Mirco Tischler <mt-ml at gmx dot de>

pkgname=actor-framework
pkgver=0.17.0
pkgrel=1
pkgdesc="An Open Source Implementation of the Actor Model in C++"
arch=(i686 x86_64)
url="http://actor-framework.org"
license=('custom:"BSD-3-Clause"'
	 'custom:"Boost Software License"')
depends=()
makedepends=('cmake' 'opencl-headers' 'git' 'python' 'opencl-icd-loader')
optdepends=(
	'python: caf-python'
	'ipython: caf-python'
	'opencl-icd-loader: opencl support'
	'openssl: openssl support'
	)

source=(
	"git+https://github.com/actor-framework/actor-framework#commit=af6de514d17b720286c85aab52a0c25f429ea893"
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
	cd ${pkgname}/build
	make
}

check() {
	cd ${pkgname}/build
	make test
}

package() {
	cd ${pkgname}/build
	make DESTDIR="${pkgdir}" install

	cd ..
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 LICENSE_ALTERNATIVE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_ALTERNATIVE"
}
