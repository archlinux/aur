# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

_pkgname=MangoHud
pkgname=mangohud-git
pkgver=0.8.1.r75.g4bcf06a
pkgrel=1
pkgdesc="A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more"
url='https://github.com/flightlessmango/MangoHud'
license=('MIT')
arch=('x86_64')
makedepends=(
    'appstream'
    'cmocka'
    'dbus'
    'git'
    'glslang'
    'libxnvctrl'
    'libxrandr'
    'meson'
    'python-mako'
    'vulkan-headers'
)
depends=(
    'gcc-libs'
    'glfw'
    'glibc'
    'hicolor-icon-theme'
    'libglvnd'
    'libx11'
    'libxkbcommon'
    'python'
    'python-matplotlib'
    'python-numpy'
    'sh'
    'wayland'
)
optdepends=(
    'dbus: mangohudctl'
    'libxnvctrl: NVIDIA GPU metrics on older GPUs'
    'vulkan-icd-loader: Vulkan support'
)
provides=('mangohud' 'mangoapp')
replaces=('mangoapp')
conflicts=('mangohud' 'mangohud-common-git' 'mangoapp')
source=("$_pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --tags --long --abbrev=7 | sed 's/^v//;s/-rc[0-9]\+-/-/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson "$_pkgname" build \
        -Dmangoapp=true \
        -Dmangohudctl=true \
        --wrap-mode=default

    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"

    install -Dm 0644 "$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
