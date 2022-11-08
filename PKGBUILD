# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=gamescope
pkgname=${_pkgname}-git
pkgver=3.11.48.r8.g9898067
pkgrel=2
pkgdesc="Micro-compositor formerly known as steamcompmgr"
arch=(x86_64)
url="https://github.com/Plagman/gamescope"
license=("custom:BSD-2-Clause")
depends=(
    # gamescope
    "libxcomposite" "libxtst" "libxres" "sdl2" "pipewire"
    # wlroots
    "libdrm" "libxkbcommon" "libinput" "pixman" "xorg-xwayland" "xcb-util-renderutil" "xcb-util-wm" "xcb-util-errors" "seatd"
)
makedepends=("git" "meson" "ninja" "patch" "vulkan-headers" "glslang" "wayland-protocols" "cmake")
provides=($_pkgname "steamcompmgr")
conflicts=($_pkgname "steamcompmgr")
source=("$_pkgname::git+https://github.com/Plagman/gamescope.git"
        "git+https://gitlab.freedesktop.org/wlroots/wlroots.git"
        "git+https://gitlab.freedesktop.org/emersion/libliftoff.git"
        "git+https://github.com/nothings/stb.git")
sha512sums=('SKIP'
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
    git -c protocol.file.allow=always submodule update

    # make stb.wrap use our local clone
    sed -i "s|https://github.com/nothings/stb.git|$srcdir/stb|" "subprojects/stb.wrap"
    meson subprojects download
}

build() {

    arch-meson "$srcdir/$_pkgname" build \
        --force-fallback-for=wlroots,libliftoff,stb \
        -Dpipewire=enabled
    ninja -C build
}

check() {

    ninja -C build test
}

package() {

    meson install -C build --skip-subprojects --destdir "$pkgdir"

    cd "$srcdir/$_pkgname"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}

