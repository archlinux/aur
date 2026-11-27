# Maintainer: RainyPixel <me@bobchenkov.ru>

pkgname=wallpaper-engine-kde-plugin-git
pkgver=0.9.0.r762.gf470d34
pkgrel=1
pkgdesc="Wallpaper Engine integration for KDE Plasma 6 (native C++, no Python)"
arch=('x86_64')
url="https://github.com/RainyPixel/wallpaper-engine-kde-plugin"
license=('GPL-2.0-only')
depends=(
    'libplasma'
    'plasma-workspace'
    'plasma5support'
    'kirigami'
    'gst-libav'
    'mpv'
    'ffmpeg'
    'freetype2'
    'libpulse'
    'qt6-5compat'
    'qt6-declarative'
    'qt6-multimedia'
    'qt6-webchannel'
    'qt6-webengine'
    'lz4'
    'vulkan-icd-loader'
)
makedepends=(
    'git'
    'cmake>=3.22.1'
    'ninja'
    'extra-cmake-modules'
    'vulkan-headers'
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
    local version
    version=$(sed -n 's/^X-KDE-PluginInfo-Version=//p' plugin/metadata.desktop)
    [[ -n $version ]] || return 1
    printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
