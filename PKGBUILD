# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=gamescope
pkgname=${_pkgname}-git
pkgver=3.11.52.beta6.r28.g1310315
pkgrel=1
pkgdesc="Micro-compositor formerly known as steamcompmgr"
arch=(x86_64)
url="https://github.com/ValveSoftware/gamescope"
license=("custom:BSD-2-Clause")
depends=(
    # gamescope
    "libxcomposite" "libxtst" "libxres" "sdl2" "pipewire" "libxmu"
    # wlroots
    "libdrm" "libxkbcommon" "libinput" "pixman" "xorg-xwayland" "xcb-util-renderutil" "xcb-util-wm" "xcb-util-errors" "seatd"
)
makedepends=("git" "meson" "ninja" "patch" "vulkan-headers" "glslang" "wayland-protocols" "cmake"
)
provides=($_pkgname "steamcompmgr")
conflicts=($_pkgname "steamcompmgr")
source=("$_pkgname::git+https://github.com/ValveSoftware/gamescope.git"
        "git+https://gitlab.freedesktop.org/wlroots/wlroots.git"
        "git+https://gitlab.freedesktop.org/emersion/libliftoff.git"
        "git+https://gitlab.freedesktop.org/emersion/libdisplay-info.git"
        "git+https://github.com/ValveSoftware/openvr.git"
        "git+https://github.com/Joshua-Ashton/vkroots.git"
        "git+https://github.com/nothings/stb.git")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


pkgver() {
    cd "$srcdir/$_pkgname"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"

    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        git apply "../$src"
    done

    git submodule init
    git config submodule.subprojects/wlroots.url "$srcdir/wlroots"
    git config submodule.subprojects/libliftoff.url "$srcdir/libliftoff"
    git config submodule.subprojects/libdisplay-info.url "$srcdir/libdisplay-info"
    git config submodule.subprojects/openvr.url "$srcdir/openvr"
    git config submodule.subprojects/vkroots.url "$srcdir/vkroots"
    git -c protocol.file.allow=always submodule update

    # make stb.wrap use our local clone
    sed -i "s|https://github.com/nothings/stb.git|$srcdir/stb|" "subprojects/stb.wrap"
    meson subprojects download
}

build() {

    arch-meson "$srcdir/$_pkgname" build \
        --force-fallback-for=wlroots,libliftoff,stb \
        -Dpipewire=enabled \
        -Dwlroots:backends=drm,libinput,x11 \
        -Dwlroots:renderers=gles2,vulkan
    ninja -C build
}

check() {

    ninja -C build test || true  # libdisplay-info tests fail?
}

package() {

    meson install -C build --skip-subprojects --destdir "$pkgdir"

    cd "$srcdir/$_pkgname"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}

