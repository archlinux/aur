# Based on Valve's lib32-gamescope PKGBUILD on SteamOS and gamescope-git on the AUR
# Maintainer: Matthew Schwartz <matthew.schwartz@linux.dev>

# This is just for the Gamescope WSI layer.

_pkgname=lib32-gamescope
pkgname=${_pkgname}-git
pkgver=3.16.1.r38.gef1e8dbe
pkgrel=1
pkgdesc="32-bit library for Gamescope, SteamOS' session compositing window manager"
arch=(x86_64)
url="https://github.com/ValveSoftware/gamescope"
license=('BSD-2-Clause')
depends=('lib32-wayland' 'lib32-libx11' 'lib32-libxcb' 'lib32-vulkan-icd-loader')
conflicts=('lib32-gamescope')
provides=('lib32-gamescope')
makedepends=(openssh git meson cmake wayland-protocols ninja glslang glm vulkan-headers lib32-glm)
source=(
    "lib32-gamescope::git+https://github.com/ValveSoftware/gamescope.git"
    "git+https://github.com/Joshua-Ashton/wlroots.git"
    "git+https://gitlab.freedesktop.org/emersion/libliftoff.git"
    "git+https://github.com/Joshua-Ashton/vkroots.git"
    "git+https://gitlab.freedesktop.org/emersion/libdisplay-info.git"
    "git+https://github.com/ValveSoftware/openvr.git"
    "git+https://github.com/Joshua-Ashton/reshade.git"
    "git+https://github.com/Joshua-Ashton/GamescopeShaders.git#tag=v0.1"
    "git+https://github.com/KhronosGroup/SPIRV-Headers.git"
)
b2sums=(
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
)

prepare() {
	cd "$_pkgname"

    # Add custom patches if needed
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        git apply -v "../$src"
    done

    meson subprojects download

    git submodule init subprojects/wlroots
    git config submodule.subprojects/wlroots.url ../wlroots

    git submodule init subprojects/libliftoff
    git config submodule.subprojects/libliftoff.url ../libliftoff

    git submodule init subprojects/vkroots
    git config submodule.subprojects/vkroots.url ../vkroots

    git submodule init subprojects/libdisplay-info
    git config submodule.subprojects/libdisplay-info.url ../libdisplay-info

    git submodule init subprojects/openvr
    git config submodule.subprojects/openvr.url ../openvr

    git submodule init src/reshade
    git config submodule.src/reshade.url ../reshade

    git submodule init thirdparty/SPIRV-Headers
    git config submodule.thirdparty/SPIRV-Headers.url ../SPIRV-Headers

    git -c protocol.file.allow=always submodule update
}

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"

	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

	rm -rf build
	mkdir build
	cd build
	arch-meson --libdir=/usr/lib32 -Denable_gamescope=false -Denable_gamescope_wsi_layer=true -Denable_openvr_support=false -Dpipewire=enabled --buildtype release --prefix /usr -Dforce_fallback_for=stb,wlroots,vkroots,libliftoff,glm,libdisplay-info ..
	ninja
}

package() {
	cd "$_pkgname/build"

	DESTDIR="$pkgdir" meson install --skip-subprojects

	rm -rf "$pkgdir"/usr/share/gamescope
	rm -rf "$pkgdir"/usr/include
	rm -rf "$pkgdir"/usr/lib/libwlroots*
	rm -rf "$pkgdir"/usr/lib32/libwlroots*
	rm -rf "$pkgdir"/usr/lib/pkgconfig
	rm -rf "$pkgdir"/usr/lib32/pkgconfig
}
