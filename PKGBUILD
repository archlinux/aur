# Maintainer: liklax-zero <liklax@ya.ru>

pkgname=wallpaper-engine-kde-plugin-new-fork
pkgver=1.1.r20.g869a312
pkgrel=1
pkgdesc="Wallpaper Engine integration for KDE Plasma 6 (native C++, no Python)"
arch=('x86_64')
url="https://github.com/CaptSilver/wallpaper-engine-kde-plugin"
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
    'extra-cmake-modules'
    'libplasma'
    'gst-libav'
    'ninja'
    'base-devel'
    'mpv'
    'qt6-declarative'
    'qt6-websockets'
    'qt6-webchannel'
    'vulkan-headers'
    'cmake'
    'lz4'
)
optdepends=(
    'vulkan-driver: Required for scene wallpapers'
)
provides=('wallpaper-engine-kde-plugin')
conflicts=('wallpaper-engine-kde-plugin')
source=(
"${pkgname}::git+https://github.com/CaptSilver/wallpaper-engine-kde-plugin.git"
)
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    # Standard Arch git versioning: 8.4.r123.gabcdef
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
