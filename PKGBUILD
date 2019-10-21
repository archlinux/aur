# Maintainer: Marcel Röthke <marcel.roethke@haw-hamburg.de>
# Contributor: Mirco Tischler <mt-ml at gmx dot de>

pkgname=actor-framework
pkgver=0.17.2
pkgrel=1
pkgdesc="An Open Source Implementation of the Actor Model in C++"
arch=(i686 x86_64)
url="http://actor-framework.org"
license=('custom:"BSD-3-Clause"'
	 'custom:"Boost Software License"')
depends=()
makedepends=('cmake' 'opencl-headers' 'git' 'opencl-icd-loader')
optdepends=(
	'opencl-icd-loader: opencl support'
	'openssl: openssl support'
	)

source=(
	"git+https://github.com/actor-framework/actor-framework#commit=4da751ab7a79bcdc6e9dd2157b9b5c5c6814e26d"
	)
sha256sums=(
	'SKIP'
	)

prepare(){
	cd ${pkgname}

	# Disable opencl test, it can't work in a clean chroot
	rm libcaf_opencl/test/opencl.cpp


	LDFLAGS=$LDFLAGS CXXFLAGS=$CXXFLAGS \
		./configure   \
		--prefix=/usr \
		--no-examples \
		--no-python
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
