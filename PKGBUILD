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
	'5ae98e4910c0840bac0d46d2adec7bc08d00b74d3c98c72833a648a0da4f7c2cc7de8bda0b7cb6edab6f806697c8d3051acd8d8ed98661baaf343013627561fb'
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
