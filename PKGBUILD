# Maintainer: Nadia Holmquist Pedersen <nadia@nhp.sh>

_pkgbase=nanoboyadvance
pkgbase="${_pkgbase}-git"
pkgname=(${_pkgbase}-git ${_pkgbase}-qt-git)
pkgdesc="Accuracy-focused Game Boy Advance emulator."
pkgver=1.4.r4.g9b08775e
pkgrel=1
arch=(x86_64)
url="https://github.com/fleroviux/NanoboyAdvance"
license=(GPL3)
makedepends=(cmake make gcc imagemagick)

_vendor="com.github.nba-emu"
_identifier="${_vendor}.NanoBoyAdvance"

source=(
	"git+https://github.com/fleroviux/NanoBoyAdvance.git" 
	"git+https://github.com/fmtlib/fmt.git"
	"git+https://github.com/ToruNiina/toml11.git"
	NanoBoyAdvance.sh
	NanoBoyAdvance-Qt.sh
	NanoBoyAdvance.desktop
)

md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '66a11acbf54f009b0d54e208e9b71aa2'
         '5ba7183c24bdf63a9c4638f92d26b04b'
         '4f1b46e13ebab49bd45e8c49e1bf7685')

pkgver() {
	cd NanoBoyAdvance
	git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd NanoBoyAdvance
	git submodule init
	git submodule set-url external/fmtlib "${srcdir}/fmt"
	git submodule set-url external/toml11 "${srcdir}/toml11"
	git submodule update
}

build() {
	cd "$srcdir/NanoBoyAdvance"
	cmake -B build -DCMAKE_BUILD_TYPE=Release
	make -C build
}

package_nanoboyadvance-git() {
	cd "$srcdir/NanoBoyAdvance"

	install -Dm755 build/bin/sdl/NanoBoyAdvance -t "${pkgdir}/usr/lib"
	install -Dm755 "${srcdir}/../NanoBoyAdvance.sh" "${pkgdir}/usr/bin/NanoBoyAdvance"
	
	mkdir -p "${pkgdir}/usr/share/NanoBoyAdvance"
	cp -r src/platform/sdl/resource/. "${pkgdir}/usr/share/NanoBoyAdvance"
	rm "${pkgdir}/usr/share/NanoBoyAdvance/shader.cmake"
	sed -i -E 's@^shader_(.s) = "(.*)"$@shader_\1 = "/usr/share/NanoBoyAdvance/\2"@' "${pkgdir}/usr/share/NanoBoyAdvance/config.toml"
}

package_nanoboyadvance-qt-git() {
	cd "$srcdir/NanoBoyAdvance"

	install -Dm755 build/bin/qt/NanoBoyAdvance "${pkgdir}/usr/lib/NanoBoyAdvance-Qt"
	install -Dm755 "${srcdir}/../NanoBoyAdvance-Qt.sh" "${pkgdir}/usr/bin/NanoBoyAdvance-Qt"
	install -Dm644 "${srcdir}/NanoBoyAdvance.desktop" "${pkgdir}/usr/share/applications/${_identifier}.desktop"
	
	convert "${srcdir}/NanoBoyAdvance/src/platform/qt/rc/app.ico" icon.png
	
	for icon in icon-*.png; do
		size=$(identify -format "%[fx:w]x%[fx:h]" "$icon")
		install -Dm644 "$icon" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${_identifier}.png"
	done
}
