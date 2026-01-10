# Maintainer: RainyPixel <me@bobchenkov.ru>

pkgname=wallpaper-engine-kde-plugin-git
pkgver=0.6.0.r645.g5b85b36
pkgrel=1
pkgdesc="Wallpaper Engine integration for KDE Plasma 6 (native C++, no Python)"
arch=('x86_64')
url="https://github.com/RainyPixel/wallpaper-engine-kde-plugin"
license=('GPL-2.0-only')
depends=(
    'libplasma'
    'gst-libav'
    'mpv'
    'qt6-declarative'
    'qt6-websockets'
    'qt6-webchannel'
    'lz4'
    'vulkan-icd-loader'
)
makedepends=(
    'git'
    'cmake'
    'ninja'
    'extra-cmake-modules'
    'vulkan-headers'
    'plasma-workspace'
)
optdepends=(
    'vulkan-driver: Required for scene wallpapers'
)
provides=('wallpaper-engine-kde-plugin')
conflicts=('wallpaper-engine-kde-plugin')
source=("${pkgname}::git+https://github.com/RainyPixel/wallpaper-engine-kde-plugin.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "0.6.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"
    git submodule update --init --force --recursive
}

build() {
    cd "${pkgname}"
    cmake -B build -S . \
        -GNinja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${pkgname}"
    DESTDIR="${pkgdir}" cmake --install build
}
