# Maintainer: Kinn Coelho Juliao <kinncj@protonmail.com>
pkgname=safe-discover
pkgver=0.1.0
pkgrel=1
pkgdesc='Kirigami-based package management GUI for Arch Linux (pacman, AUR, Flatpak, fwupd)'
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
url='https://github.com/kinncj/Safe-Discover'

makedepends=(
    'cmake'
    'extra-cmake-modules'
    'gcc'
)

depends=(
    'qt6-base'
    'qt6-declarative'
    'kirigami'
    'kirigami-addons'
    'kcoreaddons'
    'ki18n'
    'kconfig'
    'knewstuff'
    'pacman'
    'polkit'
)

optdepends=(
    'paru: AUR package support'
    'flatpak: Flatpak application support'
    'fwupd: Firmware update support'
    'konsole: Terminal execution mode for AUR builds'
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cmake -B build -S "Safe-Discover-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF
    cmake --build build -j"$(nproc)"
}

check() {
    cmake -B build -S "Safe-Discover-${pkgver}" \
        -DBUILD_TESTING=ON
    cmake --build build -j"$(nproc)"
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
