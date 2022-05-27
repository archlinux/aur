# Maintainer: Benjamin Stürz <benni at stuerz dot xyz>

_imgui_ver=1.81
_imgui_wrap_ver=1

pkgname=mangohud-nonvidia
pkgver=0.6.7
pkgrel=1
pkgdesc='A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more (without NVIDIA support)'
_pkgver=0.6.7-1
url="https://github.com/flightlessmango/MangoHud"
license=('MIT')
arch=('x86_64' 'aarch64')
makedepends=('meson'
             'python-mako'
             'glslang'
             'libglvnd'
             'vulkan-headers'
             'vulkan-icd-loader')

depends=('gcc-libs' 'dbus' 'spdlog')

source=("mangohud-$_pkgver.tar.gz::https://github.com/flightlessmango/MangoHud/archive/v$_pkgver.tar.gz"
        "imgui-$_imgui_ver.tar.gz::https://github.com/ocornut/imgui/archive/refs/tags/v$_imgui_ver.tar.gz"
        "imgui-$_imgui_ver-$_imgui_wrap_ver-wrap.zip::https://wrapdb.mesonbuild.com/v1/projects/imgui/$_imgui_ver/$_imgui_wrap_ver/get_zip")

sha256sums=('9cad2b04a1df49e4095b0808da46d269be1b84e7e56018a3184fec270473d966'
            'f7c619e03a06c0f25e8f47262dbc32d61fd033d2c91796812bf0f8c94fca78fb'
            '6d00b442690b6a5c5d8f898311daafbce16d370cf64f53294c3b8c5c661e435f')

provides=("mangohud=$_pkgver")
conflicts=('mangohud')

_srcdir="MangoHud-$_pkgver"

build() {
    ln -sf "$srcdir/imgui-$_imgui_ver" "$_srcdir/subprojects/imgui"
    
    arch-meson                          \
        -Dappend_libdir_mangohud=false  \
        -Duse_system_vulkan=enabled     \
        -Duse_system_spdlog=enabled     \
        -Dwith_wayland=enabled          \
        -Dwith_nvml=disabled            \
        -Dwith_xnvctrl=disabled         \
        "$_srcdir" build

    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install

    install -Dm644 "$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
