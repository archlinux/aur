# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

pkgname='relacy-git'
pkgver=r47.c063779
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
source=(
	"git+${url}.git"
	'gcc16-ipa-cp-clone.patch'
)
b2sums=(
	'SKIP'
	'58ff0525b84ff218d0b82748d18937f0375f47748b7141c710f6f96d49a86e04be3baea30da8c7bd553dee6d1b9853d963d0537acc59f61d355e076c8f6eb427'
)

pkgver() {
	cd -- "${srcdir}/relacy" || return 1
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd -- "${srcdir}/relacy" || return 1
	patch -Np1 -i "${srcdir}/gcc16-ipa-cp-clone.patch"
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
