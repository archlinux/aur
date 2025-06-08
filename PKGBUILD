# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

_pkgname=MangoHud
pkgname=lib32-mangohud-git
pkgver=0.8.1.r75.g4bcf06a
pkgrel=1
pkgdesc="32-bit libraries for MangoHud and MangoApp"
url='https://github.com/flightlessmango/MangoHud'
license=('MIT')
arch=('x86_64')
makedepends=(
    'appstream'
    'git'
    'glfw'
    'glslang'
    'lib32-cmocka'
    'lib32-libglvnd'
    'lib32-libxrandr'
    'libxnvctrl'
    'meson'
    'python-mako'
    'vulkan-headers'
)
depends=(
    'lib32-gcc-libs'
    'lib32-glibc'
    'lib32-libxkbcommon'
    'lib32-wayland'
)
optdepends=(
    'lib32-vulkan-icd-loader: Vulkan support'
)
provides=('lib32-mangohud' 'lib32-mangoapp')
conflicts=('lib32-mangohud' 'lib32-mangoapp')
source=("$_pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --tags --long --abbrev=7 | sed 's/^v//;s/-rc[0-9]\+-/-/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export CC="${CC:-gcc} -m32"
    export CXX="${CXX:-g++} -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig:/usr/lib/i386-linux-gnu/pkgconfig:/usr/lib/pkgconfig:${PKG_CONFIG_PATH_32}"
    export LLVM_CONFIG="/usr/bin/llvm-config32"

    arch-meson "$_pkgname" build \
        -Dmangoplot=disabled \
        --libdir lib32 \
        --wrap-mode=default

    meson compile -C build
}

package() {
    meson install -C build --tags runtime --destdir "$pkgdir"

    install -Dm 0644 "$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
