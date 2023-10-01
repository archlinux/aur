# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

pkgname=mangohud-git
pkgver=0.7.0.r11.gefd1c07
pkgrel=1
pkgdesc="A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more."
url='https://github.com/flightlessmango/MangoHud'
license=('MIT')
arch=('x86_64')
makedepends=('git' 'appstream' 'cmocka' 'glslang' 'libxnvctrl' 'meson' 'nlohmann-json' 'python-mako')
depends=('dbus' 'fmt' 'gcc-libs' 'glew' 'hicolor-icon-theme' 'libglvnd' 'libx11' 'python-matplotlib' 'python-numpy' 'sdl2' 'spdlog' 'vulkan-icd-loader')
optdepends=('libxnvctrl: NVIDIA GPU stats by XNVCtrl')
provides=('mangohud')
conflicts=('mangohud' 'mangohud-common-git')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    local meson_options=(
        --wrap-mode=nofallback
        -Dwith_wayland=enabled
        $pkgname
    )
    arch-meson "${meson_options[@]}" build

    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"

    install -Dm 0664 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
