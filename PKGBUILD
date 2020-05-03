# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

_imgui_commit='1f02d240b38f445abb0381ade0867752d5d2bc7b'

pkgbase=mangohud
pkgname=('mangohud' 'lib32-mangohud')
pkgver=0.3.5
pkgrel=1
url='https://github.com/flightlessmango/MangoHud'
license=('MIT')
arch=('x86_64')
makedepends=('meson' 'python-mako' 'glslang' 'libglvnd' 'lib32-libglvnd'
             'vulkan-headers' 'vulkan-icd-loader' 'lib32-vulkan-icd-loader'
             'libxnvctrl')
source=("https://github.com/flightlessmango/MangoHud/archive/v$pkgver.tar.gz"
        "https://github.com/flightlessmango/imgui/archive/$_imgui_commit.tar.gz")
sha256sums=('ca301d03372879a33fc8b580e0c98b07bd02913911e49c6b76a350ddc220adea'
            '585ff20b2efba8c4c2e5e29f5d1b6aab4284e61103036035fe826f194e46a918')

_srcdir="MangoHud-$pkgver"

prepare() {
    rmdir "$_srcdir/modules/ImGui/src"
    ln -sr "imgui-$_imgui_commit" "$_srcdir/modules/ImGui/src"
}

build() {
    arch-meson -Dappend_libdir_mangohud=false -Duse_system_vulkan=enabled "$_srcdir" build64
    ninja -C build64

    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    export LLVM_CONFIG="/usr/bin/llvm-config32"
    arch-meson -Dappend_libdir_mangohud=false -Duse_system_vulkan=enabled "$_srcdir" build32 --libdir lib32
    ninja -C build32
}

package_mangohud() {
    pkgdesc='A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more'
    depends=('sh' 'gcc-libs' 'libx11')

    DESTDIR="$pkgdir" ninja -C build64 install

    install -Dm644 "$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lib32-mangohud() {
    pkgdesc='A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more (32-bit)'
    depends=('sh' 'lib32-gcc-libs' 'lib32-libx11')

    DESTDIR="$pkgdir" ninja -C build32 install

    rename "$pkgbase" "$pkgname" "$pkgdir/usr/share/doc/$pkgbase"
    install -Dm644 "$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
