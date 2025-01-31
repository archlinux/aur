#Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>
_pkgname=amiberry
pkgname=${_pkgname}-git
pkgver=v7.0.1.r25.g0c14f47
pkgrel=1
pkgdesc="Optimized Amiga emulator for various ARM, ARM64, AMD64 and RISC-V platforms"
arch=('x86_64' 'aarch64')
url="https://github.com/BlitterStudio/amiberry"
license=('GPL-3.0-only')
depends=('flac' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'mpg123' 'libmpeg2' 'libserialport' 'portmidi' 'hicolor-icon-theme' 'zlib' 'libpng' 'enet' 'gcc-libs')
makedepends=('git' 'cmake' 'ninja')
conflicts=('amiberry' 'amiberry-lite')
source=($'git+https://github.com/BlitterStudio/amiberry.git')
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd amiberry 
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
	cd ${_pkgname}
	cmake -B build \
	-DCMAKE_BUILD_TYPE=Release \
	-G Ninja \
	-DCMAKE_INSTALL_PREFIX=/usr 
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install ${_pkgname}/build

	# adding desktop entry
	echo "[Desktop Entry]" > "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	echo "Type=Application" >> "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	echo "Name=Amiberry" >> "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	echo "Comment=An Amiga emulator for Linux" >> "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	echo "Categories=Game;Emulator;" >> "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	echo "Icon=/usr/share/amiberry/data/amiberry.png" >> "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	echo "Exec=/usr/bin/${pkgname}" >> "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	echo "Terminal=false" >> "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	chmod 644 "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

}

