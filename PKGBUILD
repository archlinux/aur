# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

_pkgname=MangoHud
pkgname=lib32-mangohud-git
pkgver=0.7.1.r20.g5598fda
pkgrel=1
pkgdesc="32-bit libraries for MangoHud and MangoApp"
url='https://github.com/flightlessmango/MangoHud'
license=('MIT')
arch=('x86_64')
makedepends=('git' 'glfw' 'glslang' 'lib32-cmocka' 'lib32-libglvnd' 'lib32-libxrandr' 'libxnvctrl' 'meson' 'nlohmann-json' 'python-mako' 'vulkan-headers')
depends=('lib32-dbus' 'lib32-gcc-libs' 'lib32-glew' 'lib32-libx11' 'lib32-libxkbcommon' 'lib32-vulkan-icd-loader')
provides=('lib32-mangohud' 'lib32-mangoapp')
conflicts=('lib32-mangohud' 'lib32-mangoapp')
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    export LLVM_CONFIG="/usr/bin/llvm-config32"

     arch-meson "$_pkgname" build \
        -Dmangoapp_layer=true \
        -Dinclude_doc=false \
        --wrap-mode=nofallback \
        --libdir lib32

    meson compile -C build
}

package() {
    meson install -C build --tags runtime,mangoapp --destdir "$pkgdir"

    rm -rf "$pkgdir/usr/bin"

    install -Dm 0644 "$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
