# Maintainer: Nadia Holmquist Pedersen <nadia@nhp.sh>

_pkgbase=nanoboyadvance
pkgname=${_pkgbase}-git
pkgdesc="Accuracy-focused Game Boy Advance emulator."
pkgver=1.3.r57.g6299f4b
pkgrel=1
arch=(x86_64)
url="https://github.com/fleroviux/NanoboyAdvance"
license=(GPL3)
depends=(sdl glew)
makedepends=(cmake make gcc)
source=(
	"git+https://github.com/fleroviux/NanoBoyAdvance.git" 
	"git+https://github.com/fmtlib/fmt.git"
	"git+https://github.com/ToruNiina/toml11.git"
	NanoBoyAdvance.sh
)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '3a61b7b4cbece463119ea84a54293ba4')

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

build(){
	cd "$srcdir/NanoBoyAdvance"
	cmake -B build -DCMAKE_BUILD_TYPE=Release
	make -C build
}

package(){
	cd "$srcdir/NanoBoyAdvance"
	install -Dm755 build/src/platform/sdl/NanoBoyAdvance -t "${pkgdir}/usr/lib"
	install -Dm755 "${srcdir}/../NanoBoyAdvance.sh" "${pkgdir}/usr/bin/NanoBoyAdvance"
	
	mkdir -p "${pkgdir}/usr/share/NanoBoyAdvance"
	cp -r src/platform/sdl/resource/. "${pkgdir}/usr/share/NanoBoyAdvance"
	rm "${pkgdir}/usr/share/NanoBoyAdvance/shader.cmake"
	sed -i -E 's@^shader_(.s) = "(.*)"$@shader_\1 = "/usr/share/NanoBoyAdvance/\2"@' "${pkgdir}/usr/share/NanoBoyAdvance/config.toml"
}
