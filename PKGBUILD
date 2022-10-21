# Maintainer: Gustavo Parreira <gustavotcparreira@gmail.com>
_basename='wxrd'
pkgname="$_basename-git"
pkgver=0.16.0.r46.a548783
pkgrel=1
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
)
makedepends=('git' 'meson' 'vulkan-headers' 'gtk-doc' 'pygobject-devel')
provides=("$_basename" 'wlroots' 'xrdesktop' 'gulkan' 'gxr')
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

    mv "$srcdir"/gulkan subprojects
    mv "$srcdir"/gxr subprojects
    mv "$srcdir"/xrdesktop subprojects

    git submodule init
    git config submodule.subprojects/wlroots.url "$srcdir"/wlroots
    git submodule--helper update
}

build() {
    rm -rf build
    arch-meson $_basename build --libdir=lib -Ddefault_library=static
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install

    install -Dm644 "$_basename"/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
