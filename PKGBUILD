# PKGBUILD based on the official Arch gamescope PKGBUILD
# Maintainer - Sid Pranjale <sidpranjale127@protonmail.com>

# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Maintainer: Bouke Sybren Haarsma <boukehaarsma23 at gmail dot com>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

_pkgname=gamescope
pkgname=${_pkgname}-git
pkgver=3.14.22.r1.g5ee5959
pkgrel=1
pkgdesc='SteamOS session compositing window manager'
arch=(x86_64)
url=https://github.com/ValveSoftware/gamescope
license=(BSD)
depends=(
    gcc-libs
    glibc
    glm
    hwdata
    libavif
    libcap.so
    libdecor
    libdrm
    libinput
    libpipewire-0.3.so
    libx11
    libxcb
    libxcomposite
    libxdamage
    libxext
    libxfixes
    libxkbcommon
    libxmu
    libxrender
    libxres
    libxtst
    libxxf86vm
    seatd
    sdl2
    vulkan-icd-loader
    wayland
    xcb-util-wm
    xcb-util-errors
    xorg-server-xwayland
)
makedepends=(
    benchmark
    cmake
    git
    glslang
    meson
    ninja
    vulkan-headers
    wayland-protocols
)
source=(
    'git+https://github.com/ValveSoftware/gamescope.git'
    'git+https://github.com/Joshua-Ashton/wlroots.git'
    'git+https://gitlab.freedesktop.org/emersion/libliftoff.git'
    'git+https://github.com/Joshua-Ashton/vkroots.git'
    'git+https://gitlab.freedesktop.org/emersion/libdisplay-info.git'
    'git+https://github.com/ValveSoftware/openvr.git'
    'git+https://github.com/Joshua-Ashton/reshade.git'
    'git+https://github.com/KhronosGroup/SPIRV-Headers.git'
)

b2sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

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
    cd $_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson "${_pkgname}" build \
        -Dforce_fallback_for=stb,wlroots,vkroots,libliftoff,glm,libdisplay-info \
        -Dpipewire=enabled
    ninja -C build
}

package() {
    meson install -C build --skip-subprojects --destdir="${pkgdir}"

    cd "$srcdir/$_pkgname"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
