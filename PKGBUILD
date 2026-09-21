# Maintainer: Martin Rys <https://rys.rs/contact>

# TODO(Martin):
#   There is loads of submodules - some of which we should be able to use the repo packages for
#   Additionally, a lot of things ends up directly linked against .so files in /opt/kytyps5/plugins/

pkgname=kytyps5-git
pkgver=2026.09.20.r0.ba55ba5d
pkgrel=1
pkgdesc="PlayStation 5 emulator for Windows, Linux and macOS"
arch=("x86_64")
url="https://github.com/KytyPS5/KytyPS5"
license=("GPL-2.0-only")
conflicts=("${pkgname%-git}")
depends=(
	"jxrlib"
	"karchive"
	"kimageformats"
	"libavif"
	"libheif"
	"libmng"
	"libraw"
	"jasper"
	"layer-shell-qt"
	"openexr"
	"qt6-imageformats"
	"qt6-wayland"
	"qt6-webengine"
)
makedepends=(
	"clang"
	"cmake"
	"git"
	"glslang"
	"lld"
	"ninja"
)
source=(
	"${pkgname%-git}::git+https://github.com/KytyPS5/KytyPS5.git"
	"${pkgname%-git}.desktop"
)
sha256sums=(
	'SKIP'
	'ba394c8ec4883ef4698e4e748e2ed04b26f04cb8a824228d36cdddef304cd798'
)

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed -E -e 's/^KytyPS5-//' -e 's/-[0-9a-f]+-0-g/-0-g/' -e 's/([^-]*-)g/r\1/' -e 's/-/./g')"
}

prepare() {
	cd "${pkgname%-git}"
	git submodule update --init --recursive
}

build() {
	cd "${pkgname%-git}"
	cmake \
		-S . \
		-B _Build/linux \
		-G Ninja \
		-D CMAKE_BUILD_TYPE=Release \
		-D CMAKE_C_COMPILER=clang \
		-D CMAKE_CXX_COMPILER=clang++

	cmake --build _Build/linux --target launcher --parallel
	cmake --install _Build/linux --prefix _Build/linux/install
}

package() {
	cd "${pkgname%-git}"

	cmake --install _Build/linux --prefix "${pkgdir}/opt/${pkgname%-git}"

	install -d "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"

	ln -s "/opt/${pkgname%-git}/launcher" "${pkgdir}/usr/bin/${pkgname%-git}"
	ln -s "/opt/${pkgname%-git}/kyty_emulator" "${pkgdir}/usr/bin/kyty_emulator"
}
