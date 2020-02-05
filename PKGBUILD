# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

pkgbase=mangohud
pkgname=('mangohud' 'lib32-mangohud')
pkgver=0.1.0
pkgrel=2
url='https://github.com/flightlessmango/MangoHud'
# LICENSE is missing on 0.1.0, was added on master
license=('unknown')
# license=('MIT')
arch=('x86_64')
depends=('gcc-libs' 'libx11')
makedepends=('meson' 'python-mako' 'glslang' 'libglvnd' 'lib32-libglvnd')
source=("$pkgbase::git+$url.git#tag=v$pkgver")
sha512sums=('SKIP')

prepare() {
    cd "$pkgbase"
    git submodule update --init --depth 50
}

build() {
    arch-meson "$pkgbase" build64
    ninja -C build64

    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    export LLVM_CONFIG="/usr/bin/llvm-config32"
    arch-meson "$pkgbase" build32 --libdir lib32
    ninja -C build32
}

package_mangohud() {
    pkgdesc='A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more'
    depends=('gcc-libs' 'libx11')

    DESTDIR="$pkgdir" ninja -C build64 install
    sed -i -e 's|libMangoHud.so|/usr/lib/&|g' "$pkgdir/usr/share/vulkan/implicit_layer.d/mangohud.json"
    # install -Dm644 "$pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lib32-mangohud() {
    pkgdesc='A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more (32-bit)'
    depends=('lib32-gcc-libs' 'lib32-libx11')

    DESTDIR="$pkgdir" ninja -C build32 install
    mv "$pkgdir/usr/share/vulkan/implicit_layer.d/"mangohud{,32}.json
    sed -i -e 's|libMangoHud.so|/usr/lib32/&|g' -e 's|64bit|32bit|g' "$pkgdir/usr/share/vulkan/implicit_layer.d/mangohud32.json"

    # install -Dm644 "$pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
