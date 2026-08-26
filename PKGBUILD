# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

pkgname='relacy-git'
pkgver=r47.c063779
pkgrel=2
pkgdesc='Meticulous synchronization algorithm verifier for relaxed memory models'
arch=('any')
url='https://github.com/dvyukov/relacy'
license=('BSD-3-Clause')
makedepends=(
	'cmake'
	'git'
)
provides=("relacy=${pkgver}")
conflicts=('relacy')
source=(
	"git+${url}.git"
	'wfmo-strict-aliasing.patch'
)
b2sums=(
	'SKIP'
	'f4c29210ac2dc91365f2228a91371a3dbd51e22aefb4bdc5cf0210dfa509f3c31a8b1ba3d31ca1f20bd40dab19df0317a85c80fbc3773ecde44321989f440523'
)

pkgver() {
	cd -- "${srcdir}/relacy" || return 1
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd -- "${srcdir}/relacy" || return 1
	patch -Np1 -i "${srcdir}/wfmo-strict-aliasing.patch"
}

build() {
	local cmake_options=(
		-B "${srcdir}/build"
		-S "${srcdir}/relacy"
		-DCMAKE_BUILD_TYPE=None
		-DCMAKE_INSTALL_PREFIX=/usr
		-DCMAKE_INSTALL_LIBDIR=lib
		-DRELACY_BUILD_TESTS=ON
		-DRELACY_BUILD_EXAMPLES=ON
	)

	cmake "${cmake_options[@]}"
	cmake --build "${srcdir}/build"
}

check() {
	ctest --test-dir "${srcdir}/build" --output-on-failure
}

package() {
	DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
	install -Dm644 -- "${srcdir}/relacy/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
