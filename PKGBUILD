# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

_pkgbase=mangohud
pkgbase=$_pkgbase-git
pkgname=('mangohud-git' 'lib32-mangohud-git' 'mangohud-common-git')
pkgver=0.3.0.r25.g71b6027
pkgrel=1
url='https://github.com/flightlessmango/MangoHud'
license=('MIT')
arch=('x86_64')
depends=('glslang' 'libglvnd' 'lib32-libglvnd' 'vulkan-headers')
makedepends=('gcc' 'meson' 'python-mako' 'libx11' 'lib32-libx11' 'git')
replaces=('vulkan-mesa-layer-mango' 'lib32-vulkan-mesa-layer-mango')
source=("$_pkgbase::git+$url#branch=develop"
        'ImGui::git+https://github.com/flightlessmango/ImGui.git')
sha512sums=('SKIP'
            'SKIP')

pkgver() {
    cd "$_pkgbase"
    git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgbase"
    git submodule init
    git config submodule.'modules/ImGui/src'.url "$srcdir/ImGui"
    git submodule update
}

build() {
    arch-meson "$_pkgbase" build64 \
    --libdir lib/mangohud/lib64 \
    --prefix /usr \
    -Dappend_libdir_mangohud=false \
    -Dinclude_doc=false

    ninja -C build64

    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig:/usr/lib/i386-linux-gnu/pkgconfig:/usr/lib/pkgconfig:${PKG_CONFIG_PATH_32}"
    export LLVM_CONFIG="/usr/bin/llvm-config32"

    arch-meson "$_pkgbase" build32 \
    --libdir lib/mangohud/lib32 \
    --prefix /usr \
    -Dappend_libdir_mangohud=false \
    -Dinclude_doc=false

    ninja -C build32
}

package_mangohud-git() {
    pkgdesc='A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more'
    conflicts=('mangohud')
    
    DESTDIR="$pkgdir" ninja -C build64 install
}

package_lib32-mangohud-git() {
    pkgdesc='A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more (32-bit)'
    conflicts=('lib32-mangohud')

    DESTDIR="$pkgdir" ninja -C build32 install
}

package_mangohud-common-git() {
    pkgdesc='A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more'
    conflicts=('mangohud-common')

    install -Dm664 "$_pkgbase/bin/MangoHud.conf" "$pkgdir/usr/share/doc/mangohud/MangoHud.conf.example"
    install -Dm664 "$_pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
