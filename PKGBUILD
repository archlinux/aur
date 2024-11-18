# -*- mode: pkgbuild -*-
# Maintainer  : Youssef Fathy <youssefessamasu@gmail.com>

pkgname=quran-companion-git
_pkgname=quran-companion
pkgver=1.3.2
pkgrel=1
pkgdesc="Cross-platform desktop offline Quran reader and player"
arch=('x86_64')
url="https://github.com/0xzer0x/quran-companion"
license=('LGPL3')
depends=(qt6-base qt6-multimedia qt6-tools qt6-imageformats qt6-translations)
makedepends=(git cmake ninja)
provides=(quran-companion)
conflicts=(quran-companion)
source=("git+https://github.com/0xzer0x/quran-companion.git#branch=main")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}" || exit
	printf "%s" "$(cat ./VERSION)"
}

build() {
	cd "${srcdir}/${_pkgname}" || exit
	git submodule init
	git submodule update

	mkdir build
	cmake -S . -B build \
		-G Ninja \
		-DCMAKE_BUILD_TYPE=Release

	cmake --build build --config release
}

package() {
	install -d \
		"${pkgdir}/usr/bin" \
		"${pkgdir}/usr/share/applications" \
		"${pkgdir}/usr/share/icons/hicolor/{64x64,128x128,256x256}/apps" \
		"${pkgdir}/opt/quran-companion"

	cd "${srcdir}/${_pkgname}" || exit
	install -D dist/xdg/io.github._0xzer0x.qurancompanion.desktop "${pkgdir}/usr/share/applications/"
	install -Dm644 dist/xdg/logo64.png "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/io.github._0xzer0x.qurancompanion.png
	install -Dm644 dist/xdg/logo128.png "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/io.github._0xzer0x.qurancompanion.png
	install -Dm644 dist/xdg/logo256.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/io.github._0xzer0x.qurancompanion.png

	cmake --install build --prefix "${pkgdir}/opt/quran-companion"
	ln -sf "/opt/quran-companion/bin/quran-companion" "${pkgdir}/usr/bin/quran-companion"

}
