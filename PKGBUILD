# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Auguste Pop <auguste [at] gmail [dot] com>
# Contributor: Leen Jewel <leenjewel@gmail.com>

_pkgname=msgpack
pkgname=${_pkgname}-c-0.5
pkgver=0.5.9
pkgrel=4
pkgdesc='An efficient object serialization library. Legacy version.'
arch=('i686' 'x86_64')
url='http://msgpack.org/'
license=('Apache')

depends=('gcc-libs')
checkdepends=('gtest')
provides=("${_pkgname}-c=${pkgver}")
conflicts=("${_pkgname}-c")

source=(
	"https://github.com/${_pkgname}/${_pkgname}-c/releases/download/cpp-${pkgver}/${_pkgname}-${pkgver}.tar.gz"
	'fix_test_failure.patch'
)
sha512sums=(
	'9488bf8d4aefb44ce7554cfc1e6a5fee50b774ca173a7cb8a344f421da64d51d5c60d58fd7aaf93490a33447ad2150098c164ef6a11b6b042c3b1b4a38d06435'
	'e55533fa0012278f885e2b1f6f8314d5006e413d84f6cb6fe8479564dc70589a7921c97771e569e5d6ca711458c0dbdae2ac73036602ea7d264a8d3f10ccf064'
)

prepare() {
	# Upstream fix https://github.com/msgpack/msgpack-c/pull/95
	cd ${srcdir}/${_pkgname}-${pkgver}
	patch ./test/msgpack_test.cpp ../fix_test_failure.patch
}

build() {
	# Number of jobs
	declare -i njobs=$(nproc)
	
	if [[ ${njobs} -ge 8 ]]; then
		njobs=$(( ${njobs} - 2 ))
	fi
	
	# Building package
	cd ${srcdir}/${_pkgname}-${pkgver}
	./configure --prefix=/usr
	make -j${njobs}
}

check() {
	# Running tests
	cd ${srcdir}/${_pkgname}-${pkgver}
	make check
}

package() {
	# Installing package
	cd ${srcdir}/${_pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}