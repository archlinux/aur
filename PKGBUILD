# Maintainer: Joaquín I. Aramendía <samsagax at gmail dot com>
# Contributor: Sefa Eyeoglu <contact at scrumplex dot net>

# Used Sefa Eyeoglu's PKGBUILD as base

_pkgname=gamescope
pkgname=${_pkgname}-plus-git
pkgver=3.11.43.r21.gec1ce12
pkgrel=1
pkgdesc="Micro-compositor from Valve with added patches not yet commited upstream"
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
source=("0001-Add-force-orientation-option.patch"
				"0002-Force-orientation-only-to-internal-display.patch"
				"$_pkgname::git+https://github.com/Plagman/gamescope.git"
        "git+https://gitlab.freedesktop.org/wlroots/wlroots.git"
        "git+https://gitlab.freedesktop.org/emersion/libliftoff.git"
        "git+https://github.com/nothings/stb.git")
sha512sums=('0af3fd13dd47930e10d528d267f93b76d6605a0fc153ee9378cfbde3b1d61abbe7bc40edfec687ebffa0bd3ce4bbb8b0e05bcad8add4e9b11e35c90da6ca57f4'
            '346847ee4ce8fb7de0b1693c2f30ab30a5dc3f304da90172516a882605780b33bb7e3b8e6fee92fd59a934ad4fa26d484f8e8c3dbed5110a75fbfd5a9e16694f'
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
    git submodule update

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

