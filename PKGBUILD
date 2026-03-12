# Maintainer: noctalia-dev <team@noctalia.dev>
pkgname=noctalia-qs
pkgver=0.0.8
pkgrel=1
pkgdesc='Custom fork of Quickshell powering Noctalia Shell'
arch=(x86_64 aarch64)
url="https://github.com/noctalia-dev/noctalia-qs"
license=('LGPL-3.0-only')
depends=(
    gcc-libs
    glibc
    hicolor-icon-theme
    jemalloc
    libdrm
    libglvnd
    libpipewire
    libxcb
    mesa
    pam
    qt6-base
    qt6-declarative
    qt6-svg
    qt6-wayland
    wayland
    polkit
)
makedepends=(
    cli11
    cmake
    ninja
    qt6-shadertools
    spirv-tools
    wayland-protocols
    git
    vulkan-headers
)

provides=("quickshell" "quickshell-git")

conflicts=(
    quickshell
    quickshell-git
)
options=(!debug)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5b5cd150ec5c194828d29cd72ea0004cb070fb93e79ff5edcef9567b145fa3ee')

build() {
    cd "$_archive"
    local cmake_options=(
        -D CMAKE_BUILD_TYPE=Release
        -D DISTRIBUTOR="Arch Linux"
        -D DISTRIBUTOR_DEBUGINFO_AVAILABLE=Yes
        -D CRASH_REPORTER=Off
        -D CMAKE_INSTALL_PREFIX=/usr
        -D INSTALL_QML_PREFIX=lib/qt6/qml
    )
    cmake -G Ninja -B build -Wno-dev "${cmake_options[@]}"
    cmake --build build
}

package() {
    cd "$_archive"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
