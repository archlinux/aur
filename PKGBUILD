# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

_pkgname=lib32-mangohud
pkgname=lib32-mangohud-git
pkgver=0.6.8.r48.ga67ba60
pkgrel=1
pkgdesc="A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more (32 bit library)."
url='https://github.com/flightlessmango/MangoHud'
license=('MIT')
arch=('x86_64')
makedepends=('lib32-dbus' 'gcc' 'git' 'glslang' 'lib32-libx11' 'libxnvctrl' 'meson' 'pkgconf' 'python-mako' 'vulkan-headers')
depends=('lib32-glew' 'lib32-glfw-x11' 'nlohmann_json')
provides=('lib32-mangohud' 'lib32-mangoapp')
conflicts=('lib32-mangohud' 'lib32-mangoapp')
source=("${_pkgname}::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    local meson_options=(
        --wrap-mode=nofallback
        -Duse_system_vulkan=enabled
        -Dappend_libdir_mangohud=false
        -Dinclude_doc=false
        -Dmangoapp_layer=true
        -Dtests=disabled
        "${pkgname%-git}"
    )

    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    export LLVM_CONFIG="/usr/bin/llvm-config32"

    arch-meson "${meson_options[@]}" build --libdir lib32

    ninja -C build
}

package() {
    meson install --destdir="$pkgdir" -C build --tags runtime,mangoapp
    rm -rf "$pkgdir/usr/share/vulkan"
    install -Dm664 "${_pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
