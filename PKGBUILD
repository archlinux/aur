# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

pkgbase=mangohud
pkgname=('mangohud' 'lib32-mangohud' 'mangohud-common')
pkgver=0.5.1
pkgrel=3
url='https://github.com/flightlessmango/MangoHud'
license=('MIT')
arch=('x86_64')
makedepends=('meson' 'python-mako' 'glslang' 'libglvnd' 'lib32-libglvnd'
             'vulkan-headers' 'vulkan-icd-loader' 'lib32-vulkan-icd-loader'
             'libxnvctrl')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/flightlessmango/MangoHud/archive/v$pkgver.tar.gz")
sha256sums=('3e91d4fc7369d46763894c13f3315133871dd02705072981770c3cf58e8081c6')

_srcdir="MangoHud-$pkgver"

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
    depends=('gcc-libs' 'mangohud-common')
    optdepends=('bash: mangohud helper script'
                'libxnvctrl: support for older NVIDIA GPUs')

    DESTDIR="$pkgdir" ninja -C build64 install
    rm -r "$pkgdir/usr/bin" "$pkgdir/usr/share/doc" "$pkgdir/usr/share/man"

    install -Dm644 "$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lib32-mangohud() {
    pkgdesc='A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more (32-bit)'
    depends=('lib32-gcc-libs' 'mangohud' 'mangohud-common')
    optdepends=('lib32-libxnvctrl: support for older NVIDIA GPUs')

    DESTDIR="$pkgdir" ninja -C build32 install
    rm -r "$pkgdir/usr/bin" "$pkgdir/usr/share/doc" "$pkgdir/usr/share/man"
    mv "$pkgdir/usr/share/vulkan/implicit_layer.d/MangoHud.json" "$pkgdir/usr/share/vulkan/implicit_layer.d/MangoHud.x86.json"

    install -Dm644 "$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_mangohud-common() {
    pkgdesc='Common files for mangohud and lib32-mangohud'
    optdepends=('bash: mangohud helper script')

    DESTDIR="$pkgdir" ninja -C build64 install
    rm -r "$pkgdir/usr/lib" "$pkgdir/usr/share/vulkan"

    install -Dm644 "$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

