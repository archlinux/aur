# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

_pkgbase=mangohud
pkgbase=$_pkgbase-git
pkgname=('mangohud-git' 'lib32-mangohud-git' 'mangohud-common-git')
pkgver=0.6.6.1.r181.g284ae0d
pkgrel=1
url='https://github.com/flightlessmango/MangoHud'
license=('MIT')
arch=('x86_64')
makedepends=('git' 'dbus' 'meson' 'python-mako' 'glslang' 'libglvnd' 'lib32-libglvnd'
             'vulkan-headers' 'vulkan-icd-loader'  'lib32-vulkan-icd-loader'
             'libxnvctrl')
source=("$_pkgbase::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$_pkgbase"
    git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}


build() {
    __meson_opts=(
        --wrap-mode=forcefallback
        -Dappend_libdir_mangohud=false
        -Duse_system_vulkan=enabled
        "$_pkgbase"
    )
    arch-meson "${__meson_opts[@]}" build64

    ninja -C build64

    export \
        CC="gcc -m32" \
        CXX="g++ -m32" \
        PKG_CONFIG_PATH="/usr/lib32/pkgconfig" \
        LLVM_CONFIG="/usr/bin/llvm-config32"

    arch-meson "${__meson_opts[@]}" build32 --libdir lib32
    ninja -C build32
    unset CC CXX PKG_CONFIG_PATH LLVM_CONFIG
}

package_mangohud-git() {
    pkgdesc='A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more'
    depends=('gcc-libs' 'dbus' 'mangohud-common-git')
    conflicts=('mangohud')
    provides=("mangohud=$pkgver")
    replaces=('vulkan-mesa-layer-mango')
    optdepends=('bash: mangohud helper script'
                'libxnvctrl: support for older NVIDIA GPUs')
    
    DESTDIR="$pkgdir" ninja -C build64 install
    rm -r "$pkgdir/usr/bin" "$pkgdir/usr/share/doc" "$pkgdir/usr/share/man"  "$pkgdir/usr/share/vulkan/implicit_layer.d/libMangoApp.json"
}

package_lib32-mangohud-git() {
    pkgdesc='A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more (32-bit)'
    depends=('lib32-gcc-libs' 'lib32-dbus' 'mangohud-common-git')
    conflicts=('lib32-mangohud')
    provides=("lib32-mangohud=$pkgver")
    replaces=('lib32-vulkan-mesa-layer-mango')
    optdepends=('lib32-libxnvctrl: support for older NVIDIA GPUs')

    DESTDIR="$pkgdir" ninja -C build32 install
    rm -r "$pkgdir/usr/bin" "$pkgdir/usr/share/doc" "$pkgdir/usr/share/man" "$pkgdir/usr/share/vulkan/implicit_layer.d/libMangoApp.json"
    mv "$pkgdir/usr/share/vulkan/implicit_layer.d/MangoHud.json" "$pkgdir/usr/share/vulkan/implicit_layer.d/MangoHud.x86.json"
}

package_mangohud-common-git() {
    pkgdesc='A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more'
    conflicts=('mangohud-common')
    provides=("mangohud-common=$pkgver")

    DESTDIR="$pkgdir" ninja -C build64 install
    rm -r "$pkgdir/usr/lib" "$pkgdir/usr/share/vulkan"

    install -Dm664 "$_pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
