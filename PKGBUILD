# Maintainer: Nadia Holmquist Pedersen <nadia@nhp.sh>

_pkgbase=nanoboyadvance
pkgbase="${_pkgbase}-git"
pkgname="${_pkgbase}-git"
pkgdesc="Accuracy-focused Game Boy Advance emulator."
pkgver=1.6.r5.gf6311092
pkgrel=1
arch=(x86_64)
url="https://github.com/nba-emu/NanoBoyAdvance"
license=(GPL3)
makedepends=(cmake make git gcc imagemagick)
depends=(qt5-base glew sdl2)

_vendor="com.github.nba-emu"
_identifier="${_vendor}.NanoBoyAdvance"

source=(
	"git+https://github.com/nba-emu/NanoBoyAdvance.git" 
	"git+https://github.com/fmtlib/fmt.git"
	"git+https://github.com/ToruNiina/toml11.git"
	NanoBoyAdvance-Qt.sh
	NanoBoyAdvance.desktop
)

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'd4518786256bbe6c5525c9200b3978cd774ffa74b7a3cd411de0aa483903f4ea'
            'c7bb57aa68471e06b98ba85bcc5260ce58570fdfc3812b0e8241c9ccdbbd2874')

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
	cmake --build build
}

package() {
	cd "$srcdir/NanoBoyAdvance"

	install -Dm755 build/bin/qt/NanoBoyAdvance "${pkgdir}/usr/lib/NanoBoyAdvance-Qt"
	install -Dm755 "${srcdir}/NanoBoyAdvance-Qt.sh" "${pkgdir}/usr/bin/NanoBoyAdvance-Qt"
	install -Dm644 "${srcdir}/NanoBoyAdvance.desktop" "${pkgdir}/usr/share/applications/${_identifier}.desktop"
	
	convert "${srcdir}/NanoBoyAdvance/src/platform/qt/rc/app.ico" icon.png
	
	for icon in icon-*.png; do
		size=$(identify -format "%[fx:w]x%[fx:h]" "$icon")
		install -Dm644 "$icon" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${_identifier}.png"
	done
}
