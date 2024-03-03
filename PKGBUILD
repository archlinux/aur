# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

_pkgname=MangoHud
pkgname=mangohud-git
pkgver=0.7.1.r20.g5598fda
pkgrel=1
pkgdesc="A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more."
url='https://github.com/flightlessmango/MangoHud'
license=('MIT')
arch=('x86_64')
makedepends=('appstream' 'cmocka' 'git' 'glfw' 'glslang' 'libxnvctrl' 'libxrandr' 'meson' 'nlohmann-json' 'python-mako' 'vulkan-headers')
depends=('dbus' 'fmt' 'gcc-libs' 'glew' 'hicolor-icon-theme' 'libglvnd' 'libx11' 'python-matplotlib' 'python-numpy' 'vulkan-icd-loader')
optdepends=('libxnvctrl: NVIDIA GPU stats by XNVCtrl'
            'glfw: Required for MangoApp'
            'gamescope: Use MangoApp as an overlay within gamescope')
provides=('mangohud' 'mangoapp')
replaces=('mangoapp')
conflicts=('mangohud' 'mangohud-common-git' 'mangoapp')
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson "$_pkgname" build \
        -Dmangoapp=true \
        -Dmangohudctl=true \
        -Dmangoapp_layer=true \
        --wrap-mode=nofallback

    meson compile -C build

}

package() {
    meson install -C build --destdir "$pkgdir"

    install -Dm 0644 "$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
