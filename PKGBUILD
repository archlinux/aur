# Maintainer: Gustavo Parreira <gustavotcparreira@gmail.com>
_basename='wxrd'
pkgname="$_basename-git"
pkgver=0.16.0.r46.a548783
pkgrel=5
pkgdesc="A prototype-quality standalone client for xrdesktop based on wlroots and the wxrc codebase."
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/xrdesktop/wxrd"
license=('MIT')
depends=(
    # wxrd
    'wayland-protocols' 'seatd'
    # xlroots
    'libinput' 'xcb-util-errors' 'xcb-util-renderutil' 'xcb-util-wm'
    'vulkan-validation-layers' 'xorg-xwayland'
    # gulkan
    'graphene' 'shaderc' 'glfw'
    # gxr
    'gtk3' 'openvr' 'openxr'
    # xrdesktop
    'python3'
)
makedepends=('git' 'meson' 'vulkan-headers' 'gtk-doc' 'pygobject-devel')
provides=("$_basename" 'xrdesktop')
conflicts=("$_basename")
source=(
    'git+https://gitlab.freedesktop.org/xrdesktop/wxrd.git'
    'git+https://gitlab.freedesktop.org/wlroots/wlroots.git'
    'git+https://gitlab.freedesktop.org/xrdesktop/gulkan.git#branch=next'
    'git+https://gitlab.freedesktop.org/xrdesktop/gxr.git#branch=next'
    'git+https://gitlab.freedesktop.org/xrdesktop/xrdesktop.git#branch=next'
)
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

ver() {
    PREFIX="project('wxrd', 'c', version: '"
    echo $(grep "$PREFIX" meson.build | sed -e "s/${PREFIX}//" | sed "s/',//")
}

pkgver() {
	cd "$_basename"
    hash=$(git log --pretty=format:'%h' -n 1)
    rev=$(git rev-list --count HEAD)
    printf "%s.r%s.%s" "$(ver)" "$rev" "$hash"
}

prepare() {
    cd "$_basename"

    ln -sf "$srcdir"/gulkan subprojects/gulkan
    ln -sf "$srcdir"/gxr subprojects/gxr
    ln -sf "$srcdir"/xrdesktop subprojects/xrdesktop

    git submodule init
    git config submodule.subprojects/wlroots.url "$srcdir"/wlroots
    git -c protocol.file.allow=always submodule update
}

build() {
    rm -rf build
    arch-meson $_basename build --libdir=lib \
        --force-fallback-for=gulkan,gxr,xrdesktop,wlroots \
        -Ddefault_library=static
    ninja -C build
}

package() {
    meson install -C build --skip-subprojects wlroots --destdir "$pkgdir"

    cd "$_basename"
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 subprojects/xrdesktop/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/xrdesktop/LICENSE
}
