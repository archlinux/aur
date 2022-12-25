# Maintainer: Benjamin Stürz <benni at stuerz dot xyz>

_imgui_ver=1.81
_imgui_wrap_ver=1

pkgname=mangohud-nonvidia
pkgver=0.6.8
pkgrel=2
pkgdesc='A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more (without NVIDIA support)'
url="https://github.com/flightlessmango/MangoHud"
license=('MIT')
arch=('x86_64' 'aarch64')
makedepends=('meson'
             'python-mako'
             'glslang'
             'libglvnd'
             'vulkan-headers'
             'vulkan-icd-loader'
             'appstream')

depends=('gcc-libs' 'dbus' 'spdlog')

source=("mangohud-$pkgver.tar.gz::https://github.com/flightlessmango/MangoHud/archive/v$pkgver.tar.gz"
        "imgui-$_imgui_ver.tar.gz::https://github.com/ocornut/imgui/archive/refs/tags/v$_imgui_ver.tar.gz"
	"https://wrapdb.mesonbuild.com/v2/imgui_${_imgui_ver}-1/get_patch#/imgui-${_imgui_ver}-1-wrap.zip")

sha256sums=('d82b98aa54161c820b061676b7791b5f0e2ded2c288845252905215ead816593'
            'f7c619e03a06c0f25e8f47262dbc32d61fd033d2c91796812bf0f8c94fca78fb'
            '6d00b442690b6a5c5d8f898311daafbce16d370cf64f53294c3b8c5c661e435f')

provides=("mangohud=$pkgver")
conflicts=('mangohud')

_srcdir="MangoHud-$pkgver"

build() {
    ln -sf "$srcdir/imgui-$_imgui_ver" "$_srcdir/subprojects/imgui-$_imgui_ver"
    
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
