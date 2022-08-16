# Maintainer: Joaquín I. Aramendía <samsagax at gmail dot com>
# Contributor: Sefa Eyeoglu <contact at scrumplex dot net>

# Used Sefa Eyeoglu's PKGBUILD as base

_pkgname=gamescope
pkgname=${_pkgname}-plus-git
pkgver=3.11.33.beta1.r33.gdb99b92
pkgrel=1
pkgdesc="Micro-compositor from Valve with added patches not yet commited upstream"
arch=(x86_64)
url="https://github.com/Plagman/gamescope"
license=("custom:BSD-2-Clause")
depends=(
    # gamescope
    "libxcomposite" "libxtst" "libxres" "sdl2" "pipewire" "libliftoff-git"
    # wlroots
    "libdrm" "libxkbcommon" "libinput" "pixman" "xorg-xwayland" "xcb-util-renderutil" "xcb-util-wm" "xcb-util-errors" "seatd"
)
makedepends=("git" "meson" "ninja" "patch" "vulkan-headers" "glslang" "wayland-protocols" "cmake")
provides=($_pkgname "steamcompmgr")
conflicts=($_pkgname "steamcompmgr")
source=("0001-Add-force-orientation-option.patch"
				"$_pkgname::git+https://github.com/Plagman/gamescope.git"
        "git+https://gitlab.freedesktop.org/wlroots/wlroots.git"
        "git+https://github.com/nothings/stb.git")
sha512sums=('ffd979c735721364490978922bd14a0657f76a273a1d799dd5f6fc4656983510be93f2ab01ae34daa25844f51e5373a3a20c7472f500077f14d5b2bc0bb2119d'
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
    git config submodule.subprojects/libliftoff.active "false"
    git submodule update

    # make stb.wrap use our local clone
    sed -i "s|https://github.com/nothings/stb.git|$srcdir/stb|" "subprojects/stb.wrap"
    meson subprojects download
}

build() {

    arch-meson "$srcdir/$_pkgname" build \
        --force-fallback-for=wlroots,stb \
        -Dpipewire=enabled
    ninja -C build
}

check() {

    ninja -C build test
}

package() {

    DESTDIR="$pkgdir" ninja -C build install

    # Delete library files that were linked statically
    rm -rfv "$pkgdir/usr/include/wlr" "$pkgdir/usr/lib/libwlroots.a" "$pkgdir/usr/lib/libwlroots*" "$pkgdir/usr/lib/pkgconfig/wlroots.pc"

    # Delete empty directories
    find "$pkgdir" -type d -empty -print -delete

    cd "$srcdir/$_pkgname"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}

