# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

_imgui_commit='6c1a73774dabd2be64f85543b1286e44632d1905'

pkgbase=mangohud
pkgname=('mangohud' 'lib32-mangohud')
pkgver=0.2.0
pkgrel=3
url='https://github.com/flightlessmango/MangoHud'
license=('MIT')
arch=('x86_64')
depends=('gcc-libs' 'libx11')
makedepends=('meson' 'python-mako' 'glslang' 'libglvnd' 'lib32-libglvnd'
             'vulkan-headers' 'vulkan-icd-loader' 'lib32-vulkan-icd-loader')
source=("https://github.com/flightlessmango/MangoHud/archive/v$pkgver.tar.gz"
        "https://github.com/flightlessmango/imgui/archive/$_imgui_commit.tar.gz")
sha256sums=('61ec5cb9c9e61eec89a68af305ceb99f16487f85e25127f21b8ecd66a67d12c0'
            '22ed2689e14f6e5cbd602edcd368562ba118abaf5d7ab42d33a5eb10a77cb687')

_srcdir="MangoHud-$pkgver"

prepare() {
    rmdir "$_srcdir/modules/ImGui/src"
    ln -sr "imgui-$_imgui_commit" "$_srcdir/modules/ImGui/src"
}

build() {
    arch-meson -Duse_system_vulkan=enabled "$_srcdir" build64
    ninja -C build64

    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    export LLVM_CONFIG="/usr/bin/llvm-config32"
    arch-meson -Duse_system_vulkan=enabled "$_srcdir" build32 --libdir lib32
    ninja -C build32
}

package_mangohud() {
    pkgdesc='A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more'
    depends=('gcc-libs' 'libx11')

    DESTDIR="$pkgdir" ninja -C build64 install
    mv "$pkgdir/usr/share/vulkan/implicit_layer.d/"mangohud{,64}.json
    sed -i -e 's|libMangoHud.so|/usr/lib/&|g' "$pkgdir/usr/share/vulkan/implicit_layer.d/mangohud64.json"

    install -Dm644 "$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lib32-mangohud() {
    pkgdesc='A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more (32-bit)'
    depends=('lib32-gcc-libs' 'lib32-libx11')

    DESTDIR="$pkgdir" ninja -C build32 install
    mv "$pkgdir/usr/share/vulkan/implicit_layer.d/"mangohud{,32}.json
    sed -i -e 's|libMangoHud.so|/usr/lib32/&|g' -e 's|64bit|32bit|g' "$pkgdir/usr/share/vulkan/implicit_layer.d/mangohud32.json"

    install -Dm644 "$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
