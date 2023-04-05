# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

pkgname=lib32-mangohud-git
pkgver=0.6.8.r145.g020e848
pkgrel=1
pkgdesc="A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more (32 bit library)."
url='https://github.com/flightlessmango/MangoHud'
license=('MIT')
arch=('x86_64')
makedepends=('git' 'glslang' 'lib32-libx11' 'libxnvctrl' 'meson' 'nlohmann-json' 'python-mako' 'vulkan-headers')
depends=('lib32-dbus' 'lib32-vulkan-icd-loader')
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
        -Dtests=disabled
        $pkgname
    )

    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    export LLVM_CONFIG="/usr/bin/llvm-config32"

    arch-meson "${meson_options[@]}" build --libdir lib32

    ninja -C build
}

package() {
    meson install --destdir="$pkgdir" -C build --tags runtime

    install -Dm664 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm -rf "$pkgdir/usr/share/vulkan"
}
