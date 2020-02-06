# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

_pkgbase=mangohud
pkgbase=$_pkgbase-git
pkgname=('mangohud-git' 'lib32-mangohud-git')
pkgver=0.1.0.r24.g1bc513f
pkgrel=1
url='https://github.com/flightlessmango/MangoHud'
license=('MIT')
arch=('x86_64')
depends=('gcc-libs' 'libx11')
makedepends=('meson' 'python-mako' 'glslang' 'libglvnd' 'lib32-libglvnd')
source=("$_pkgbase::git+$url.git"
        'Vulkan-Docs::git+https://github.com/KhronosGroup/Vulkan-Docs.git'
        'Vulkan-Loader::git+https://github.com/KhronosGroup/Vulkan-Loader.git'
        'ImGui::git+https://github.com/flightlessmango/ImGui.git'
        'Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git')
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir/${_pkgbase}"
    git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgbase"
    git submodule init
    git config submodule.'modules/Vulkan-Docs'.url "$srcdir/Vulkan-Docs"
    git config submodule.'modules/Vulkan-Loader'.url "$srcdir/Vulkan-Loader"
    git config submodule.'modules/ImGui/src'.url "$srcdir/ImGui"
    git config submodule.'modules/Vulkan-Headers'.url "$srcdir/Vulkan-Headers"
    git submodule update
}

build() {
    arch-meson "$_pkgbase" build64
    ninja -C build64

    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    export LLVM_CONFIG="/usr/bin/llvm-config32"
    arch-meson "$_pkgbase" build32 --libdir lib32
    ninja -C build32
}

package_mangohud-git() {
    pkgdesc='A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more'
    depends=('gcc-libs' 'libx11')
    conflicts=('mangohud')
    
    DESTDIR="$pkgdir" ninja -C build64 install
    sed -i -e 's|libMangoHud.so|/usr/lib/&|g' "$pkgdir/usr/share/vulkan/implicit_layer.d/mangohud.json"
    install -Dm644 "$_pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lib32-mangohud-git() {
    pkgdesc='A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more (32-bit)'
    depends=('lib32-gcc-libs' 'lib32-libx11')
    conflicts=('lib32-mangohud')

    DESTDIR="$pkgdir" ninja -C build32 install
    mv "$pkgdir/usr/share/vulkan/implicit_layer.d/"mangohud{,32}.json
    sed -i -e 's|libMangoHud.so|/usr/lib32/&|g' -e 's|64bit|32bit|g' "$pkgdir/usr/share/vulkan/implicit_layer.d/mangohud32.json"

    install -Dm644 "$_pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
