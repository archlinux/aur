# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Yidaozhan Ya <yidaozhan_ya@outlook.com>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail.com>

_pkgname='input-overlay'
pkgname=obs-plugin-${_pkgname}
pkgver=5.1.0.r56.g673e594
pkgrel=1
groups=('obs-plugins')
pkgdesc='obs-studio plugin to show keyboard, gamepad and mouse input on stream.'
arch=("x86_64")
url="https://github.com/univrsal/${_pkgname}"
license=('GPL-2.0-only')
depends=('obs-studio' 'libxtst' 'libxkbfile' 'sdl2' 'qt6-base' 'libxt' 'libstdc++' 'libgcc' 'libxrandr')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'wayland-protocols' 'patchelf')
_commit='673e594cebc5e686a49c1012b9c7b572dee0c549'
source=(
	"git+https://github.com/univrsal/${_pkgname}.git#commit=${_commit}"
	"$pkgname-libuiohook-TolikPylypchuk::git+https://github.com/TolikPylypchuk/libuiohook.git#commit=b6e8179a263718107e82fcd72278e804932e2aea")
sha256sums=('7a3754edacca7f1623640dd91eae98bfaa0334d2e27ddb98cf10a5b95548b477'
            '214c366e2b1e714cc83ee37a0d3426514497dbffb11c9b427dd38a630827f160')

_srcdir="${_pkgname}"

pkgver() {
	cd "${_srcdir}"
	( set -o pipefail
		git describe --tags --abbrev=7 --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	cd "${_srcdir}"

	#git submodule init
	#git config 'submodule.deps/libuiohook.url' "$srcdir/$pkgname-libuiohook-TolikPylypchuk"
	#git -c 'protocol.file.allow=always' submodule update

	sed -i \
		-e '/<QJsonDocument>/a #include <bit>/' \
		-e 's/obj\["mask"\] = e->mask/obj["mask"] = std::bit_cast<int>(e->mask)/g' \
		'src/network/websocket_server.cpp'
	sed -i '/{0xE063, VC_WAKE},/d' 'src/util/overlay.cpp'

	sed -i 's/set(CMAKE_CXX_STANDARD 17)/set(CMAKE_CXX_STANDARD 23)/' 'cmake/common/compiler_common.cmake'

	rmdir 'deps/libuiohook' || rm 'deps/libuiohook'
	ln -s "$srcdir/$pkgname-libuiohook-TolikPylypchuk" 'deps/libuiohook'

	# Need to make everything visible for libuiohook.
	sed -i '/set(CMAKE_C_VISIBILITY_PRESET hidden)/d' 'cmake/common/compiler_common.cmake'
}

build() {
	# Need to disable --as-needed or link to libuiohook.so will be removed.
	export LDFLAGS+=' -Wl,--no-as-needed'
	cmake -S "${_srcdir}" -B 'build' -DCMAKE_BUILD_TYPE='None' -DCMAKE_INSTALL_PREFIX='/usr'
	cmake --build 'build'
}

package() {
	cd "${_srcdir}"
	install -dm755 "${pkgdir}/usr/lib/obs-plugins"
	install -dm755 "${pkgdir}/usr/share/obs/obs-plugins/${_pkgname}/locale"
	install -dm755 "${pkgdir}/usr/share/obs/obs-plugins/${_pkgname}/presets"
	install -Dm755 "${srcdir}/build/${_pkgname}.so" -t "${pkgdir}/usr/lib/obs-plugins/"
	cp -a 'data/locale'/* "${pkgdir}/usr/share/obs/obs-plugins/${_pkgname}/locale/"
	cp -a 'presets'/* "${pkgdir}/usr/share/obs/obs-plugins/${_pkgname}/presets/"

	install -dm755 "${pkgdir}/usr/lib/obs-plugins/input-overlay"
	cp -a "${srcdir}/build/deps/libuiohook/libuiohook"*'.so' "${pkgdir}/usr/lib/obs-plugins/input-overlay"

	# Make plugin able to find libuiohook.so
	patchelf --set-rpath '$ORIGIN/input-overlay' "${pkgdir}/usr/lib/obs-plugins/${_pkgname}.so"
}
