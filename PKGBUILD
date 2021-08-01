# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_static_wlroots=1
_static_liftoff=0

_pkgname=gamescope
pkgname=${_pkgname}-git
pkgver=3.8.4.r85.g802d86c
pkgrel=3
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

if [ $_static_wlroots -gt 0 ]; then
    depends+=("libdrm" "libxkbcommon" "libinput" "pixman" "xorg-xwayland" "xcb-util-renderutil" "xcb-util-wm" "xcb-util-errors")
    makedepends+=("cmake")
else
    depends+=("wlroots=0.13.0")
fi

if [ $_static_liftoff -gt 0 ]; then
    depends+=("libdrm")
else
    depends+=("libliftoff")
fi

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

    # combine _force_static into comma (,) seperated list
    # warning: following code does not work when items in _force_static have spaces in them
    _force_fallback=$(echo "${_force_static[*]}" | tr " " ",")

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

    # Delete library files that were linked statically
    rm -rfv "$pkgdir/usr/include/wlr" "$pkgdir/usr/lib/libwlroots.a" "$pkgdir/usr/lib/libwlroots*" "$pkgdir/usr/lib/pkgconfig/wlroots.pc"
    rm -rfv "$pkgdir/usr/include/libliftoff.h" "$pkgdir/usr/lib/libliftoff.a" "$pkgdir/usr/lib/libliftoff*" "$pkgdir/usr/lib/pkgconfig/libliftoff.pc"

    # Delete empty directories
    find "$pkgdir" -type d -empty -print -delete

    cd "$srcdir/$_pkgname"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}

