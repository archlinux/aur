# Maintainer: DBeidachazi <https://github.com/DBeidachazi>
# This is NOT the original noctalia-qs: upstream archived that repo. This package builds the community fork at the URL below, for Noctalia Shell v4 (legacy).
# Based on the noctalia-qs PKGBUILD by noctalia-dev <team@noctalia.dev>
pkgname=noctalia-qs-legacy-v4
_reponame=noctalia-qs
pkgver=0.0.13
pkgrel=1
pkgdesc='Community-maintained fork of the archived noctalia-qs (Quickshell fork) for Noctalia Shell v4, with Qt 6.12 fix'
arch=(x86_64 aarch64)
url="https://github.com/DBeidachazi/noctalia-qs"
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
provides=("quickshell" "quickshell-git" "noctalia-qs=${pkgver}")
conflicts=(
    quickshell
    quickshell-git
    noctalia-qs
)
options=(!debug)
_archive="$_reponame-$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2234029a31a7b8c1956f7db8ef20777d9315a555019faf91b52968bfca3dc03e')

build() {
    cd "$_archive"
    local cmake_options=(
        -D CMAKE_BUILD_TYPE=Release
        -D DISTRIBUTOR="AUR (noctalia-qs)"
        -D DISTRIBUTOR_DEBUGINFO_AVAILABLE=No
        -D CRASH_HANDLER=OFF
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
