# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

pkgname=lib32-mangohud-git
pkgver=0.7.0.r11.gefd1c07
pkgrel=1
pkgdesc="32-bit libraries for MangoHud and MangoApp"
url='https://github.com/flightlessmango/MangoHud'
license=('MIT')
arch=('x86_64')
makedepends=('git' 'glslang' 'lib32-cmocka' 'lib32-libglvnd' 'libxnvctrl' 'meson' 'nlohmann-json' 'python-mako')
depends=('lib32-dbus' 'lib32-gcc-libs' 'lib32-libx11' 'lib32-sdl2' 'lib32-vulkan-icd-loader')
provides=('lib32-mangohud')
conflicts=('lib32-mangohud')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    local meson_options=(
        --wrap-mode=nofallback
        -Dinclude_doc=false
        -Dwith_wayland=enabled
        $pkgname
    )

    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    export LLVM_CONFIG="/usr/bin/llvm-config32"

    arch-meson "${meson_options[@]}" build --libdir lib32

    meson compile -C build
}

package() {
    meson install -C build --tags runtime --destdir "$pkgdir"

    install -Dm 0664 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
    rm -rf "$pkgdir/usr/bin"
}
