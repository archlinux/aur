# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

pkgname=mangohud-git
pkgver=0.6.9.1.r79.g30748bd
pkgrel=1
pkgdesc="A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more."
url='https://github.com/flightlessmango/MangoHud'
license=('MIT')
arch=('x86_64')
makedepends=('git' 'appstream' 'cmocka' 'glfw-x11' 'glslang' 'libxnvctrl' 'meson' 'nlohmann-json' 'python-mako')
depends=('dbus' 'fmt' 'gcc-libs' 'glew' 'hicolor-icon-theme' 'libglvnd' 'libx11' 'python-matplotlib' 'python-numpy' 'spdlog' 'vulkan-icd-loader')
optdepends=('libxnvctrl: NVIDIA GPU stats by XNVCtrl'
            'glfw-x11: Required for MangoApp'
            'gamescope: Use MangoApp as an overlay within gamescope')
provides=('mangohud' 'mangoapp')
conflicts=('mangohud' 'mangoapp' 'mangohud-common-git')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    local meson_options=(
        --wrap-mode=forcefallback
        -Dmangoapp=true
        -Dmangohudctl=true
        -Dmangoapp_layer=true
        $pkgname
    )
    arch-meson "${meson_options[@]}" build

    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"

    install -Dm 0664 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
