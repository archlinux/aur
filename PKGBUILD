# Maintainer: Daniele Moser <dnlmsr0@gmail.com>

_pkgname="cpputest"
pkgname="${_pkgname}-git"
pkgver=4.0.r674.g81eb8b8
pkgrel=2
pkgdesc="Unit testing and mocking framework for C/C++"
arch=("x86_64")
url="https://github.com/cpputest/cpputest"
license=("BSD")
makedepends=("cmake" "git")
options=(
	!strip
	staticlibs
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "%s" "$(git describe --long --tags --abbrev=7 --exclude latest* | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "${srcdir}/${_pkgname}"
	local cmake_options=(
		-B build
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
		-D LONGLONG=ON
		-D C++11=ON
		-S .
		-W no-dev
	)

	cmake "${cmake_options[@]}"
	cmake --build build
}

check() {
	cd "${srcdir}/${_pkgname}"
	ctest --test-dir build --output-on-failure
}

package() {
	cd "${srcdir}/${_pkgname}"
	DESTDIR="${pkgdir}" cmake --install build
	install -vDm 644 ./COPYING -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
