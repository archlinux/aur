# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

pkgname='relacy-git'
pkgver=r53.2c87447
pkgrel=1
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
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
	cd -- "${srcdir}/relacy" || return 1
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
