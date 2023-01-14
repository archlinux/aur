# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

_pkgname=mangohud
pkgname=mangohud-git
pkgver=0.6.8.r48.ga67ba60
pkgrel=1
pkgdesc="A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more."
url='https://github.com/flightlessmango/MangoHud'
license=('MIT')
arch=('x86_64')
makedepends=('dbus' 'gcc' 'git' 'glslang' 'libx11' 'libxnvctrl' 'meson' 'pkgconf' 'python-mako' 'vulkan-headers')
depends=('glew' 'glfw-x11' 'hicolor-icon-theme')
provides=('mangohud' 'mangohud-common' 'mangoapp')
conflicts=('mangohud' 'mangohud-common' 'mangoapp')
source=("${_pkgname%"-git"}::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "${_pkgname%"-git"}"
    git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    local meson_options=(
        --wrap-mode=forcefallback
        -Duse_system_vulkan=enabled
        -Dappend_libdir_mangohud=false
        -Dmangohudctl=true
        -Dmangoapp_layer=true
        -Dtests=disabled
        "${_pkgname%"-git"}"
    )
    arch-meson "${meson_options[@]}" build

    ninja -C build
}

package() {
    meson install --destdir="$pkgdir" -C build
    install -Dm664 "${_pkgname%"-git"}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
