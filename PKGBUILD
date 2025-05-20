# Maintainer: encadyma <encadyma.hi at gmail dot com>
# Maintainer: Amy <amy at fluff dot tech>

_pkgexec=usc-game
pkgname=unnamed-sdvx-clone
_pkgnum='0.6.0'
pkgver="v${_pkgnum}"
pkgrel=2 # TODO: Reset to 1

pkgdesc='A game based on K-Shoot MANIA and Sound Voltex'
arch=('x86_64')
license=('MIT')
url='https://github.com/Drewol/unnamed-sdvx-clone'

depends=('freetype2>=2.6.5'
	 'libogg'
	 'libvorbis'
	 'sdl2>=2.0.9'
	 'zlib'
	 'libpng>=1.6'
	 'libjpeg'
	 'libarchive>=3.3.3'
	 'mesa'
	 'openssl')
install="${pkgname}.install"
makedepends=(cmake git)

conflicts=(unnamed-sdvx-clone-git)

source=(
	"${pkgname}::git+https://github.com/Drewol/unnamed-sdvx-clone.git#tag=${pkgver}"
	cmake4-build-fix.patch # TODO: Remove for next release
)

sha256sums=('44b0ecb3c6e116d7cc47239f7bb1a6b487b62ef9c5f282228d2bd3be31b18cc6'
            '5f9c1039ce632c90f4a3780167f71c7dbcba05cc64ae0e5294c1baf25884995f')

prepare() {
	cd "${srcdir}/${pkgname}"
	# TEMPFIX TODO: Fix build for CMake >4.0, remove for next release
	git apply --index ../cmake4-build-fix.patch
	git submodule update --init --recursive
}

build() {
	cd "${srcdir}/${pkgname}"
	cmake -DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	cd "${srcdir}/${pkgname}"

	install -d "${pkgdir}/opt/${pkgname}"
	cp -a "bin/." "${pkgdir}/opt/${pkgname}"

	# chmod 755 the executable
	chmod 755 "${pkgdir}/opt/${pkgname}/${_pkgexec}"

	# Copy the license
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

	# Link the binary to /usr/bin
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${_pkgexec}" "${pkgdir}/usr/bin/${_pkgexec}"

	chmod 777 "${pkgdir}/opt/${pkgname}"
	chmod 777 "${pkgdir}/opt/${pkgname}/skins"
	chmod 777 "${pkgdir}/opt/${pkgname}/skins/Default"
}
