# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_static_wlroots=1
_static_liftoff=0

_pkgname=gamescope
pkgname=${_pkgname}-git
pkgver=3.8.4.r85.g802d86c
pkgrel=2
pkgdesc="Micro-compositor formerly known as steamcompmgr"
arch=(x86_64)
url="https://github.com/Plagman/gamescope"
license=("custom:BSD-2-Clause")
depends=("libxcomposite" "libxtst" "libxres" "sdl2")
makedepends=("git" "meson" "ninja" "patch" "vulkan-headers" "glslang" "wayland-protocols")
provides=($_pkgname "steamcompmgr")
conflicts=($_pkgname "steamcompmgr")
source=("git+https://github.com/Plagman/gamescope.git")
sha512sums=('SKIP')

[ $_static_wlroots -gt 0 ] && depends+=("libdrm" "libxkbcommon" "libinput" "pixman" "xorg-xwayland" \
        "xcb-util-renderutil" "xcb-util-wm" "xcb-util-errors") && makedepends+=("cmake") || depends+=("wlroots=0.13.0")
[ $_static_liftoff -gt 0 ] && depends+=("libdrm") || depends+=("libliftoff")

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

    [ $_static_wlroots -gt 0 ] || rm -rf "subprojects/wlroots"
    [ $_static_liftoff -gt 0 ] || rm -rf "subprojects/libliftoff"
}

build() {

    _force_static=()
    [ $_static_wlroots -gt 0 ] && _force_static+=(wlroots)
    [ $_static_liftoff -gt 0 ] && _force_static+=(libliftoff)

    _force_fallback=$(IFS=, echo "${_force_static[*]}")

    if [ -z "$_force_fallback" ]; then
        _force_fallback="[]"
    fi

    echo "Statically linking: $_force_fallback"

    meson setup --prefix /usr --buildtype=release --force-fallback-for=$_force_fallback "$srcdir/$_pkgname" build
    ninja -C build
}

check() {

    ninja -C build test
}

package() {

    DESTDIR="$pkgdir" ninja -C build install
    rm -rfv "$pkgdir/usr/include/wlr" "$pkgdir/usr/lib/libwlroots*" "$pkgdir/usr/lib/pkgconfig/wlroots.pc"

    cd "$srcdir/$_pkgname"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}

