# Maintainer: Christian Mauderer <oss@c-mauderer.de>
pkgname=alchemyquest-git
_pkg=alchemyquest
pkgrel=1
pkgver=r126.0db0d7f
pkgdesc="A simple puzzle game where players combine alchemic elements to create exotic combinations and score points."
arch=('x86_64')
url="https://gitlab.com/dulsi/alchemyquest"
license=('GPL-2.0-or-later AND CC-BY-SA-2.0 AND CC-BY-SA-3.0')
makedepends=('git' 'cmake')
depends=('boost' 'expat' 'libzip' 'sdl2_image' 'sdl2_mixer' 'sdl2-compat')
conflicts=('alchemyquest')
provides=('alchemyquest')
source=(
	"${pkgname}"::"git+${url}.git"
	"0001-Make-compatible-with-Arch.patch"
)
sha256sums=(
	'SKIP'
	'3c52185135f8921239c79fb3333ea2a3c0d2bfafd203e0a271b72e75c881976f'
)

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"
	patch -Np1 -i ../../0001-Make-compatible-with-Arch.patch
}

build() {
	cd "${srcdir}/${pkgname}"

	local cmake_options=(
		-B build
		-S ${srcdir}/${pkgname}
		-W no-dev
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
	)
	cmake "${cmake_options[@]}"
	cmake --build build
}

package() {
	cd "${srcdir}/${pkgname}"

	DESTDIR="$pkgdir" cmake --install build

	install -Dm 644 "${srcdir}/${pkgname}/alchemyquest.desktop" "$pkgdir/usr/share/applications/alchemyquest.desktop"
	install -Dm 644 "${srcdir}/${pkgname}/openalchemist.desktop" "$pkgdir/usr/share/applications/openalchemist.desktop"
}
