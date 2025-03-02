# Maintainer: Norbert Preining <norbert@preining.info>
pkgname=descent3
pkgver=1.5.0
pkgrel=2
pkgdesc="Descent 3 Open Source game engine"
arch=('x86_64')
url="https://github.com/DescentDevelopers/Descent3"
license=('GPL-3.0-or-later')
_CMAKE_RELEASE_TYPE=Release
makedepends=(
	'cmake'
	'ninja'
	'pkgconf'
	'gtest'
)
depends=('sdl2' 'zlib')
source=(
	https://github.com/DescentDevelopers/Descent3/releases/download/v${pkgver}/Descent3-${pkgver}-Source.tar.xz
	descent3.sh
	Descent3.desktop
)
sha256sums=(
	'ba9e33a13c54488bd83c704223759642a27853055b29e71b9aa5db6be92d95a8'
	'cc9732358eaf357bdc82f44c4d89775810dee8b65fee4445cf63e222f70b6751'
	'bc05822b81d68c319a9d4cfc017986f252c81c5b04f7e4c36df8d7420469d12f'
)

prepare() {
	cd "Descent3-${pkgver}-Source"
	cmake --preset linux -DCMAKE_BUILD_TYPE='None'
}

build() {
	cd "Descent3-${pkgver}-Source"
	cmake --build --preset linux --config ${_CMAKE_RELEASE_TYPE}
}

package() {
	cd "Descent3-${pkgver}-Source"
	install -d -m 755 "${pkgdir}/usr/lib/descent3"
	install -Dm 755 -t "${pkgdir}/usr/lib/descent3" builds/linux/Descent3/${_CMAKE_RELEASE_TYPE}/Descent3 
	install -Dm 755 -t "${pkgdir}/usr/lib/descent3" builds/linux/Descent3/${_CMAKE_RELEASE_TYPE}/d3-linux.hog
	install -Dm 644 -t "${pkgdir}/usr/share/applications" "${srcdir}/Descent3.desktop"
	install -Dm 755 "${srcdir}/descent3.sh" "${pkgdir}/usr/bin/descent3"
	# install documentation
	install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" USAGE.md
}
