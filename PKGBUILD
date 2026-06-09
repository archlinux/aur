# Maintainer: Adiker <https://github.com/Adiker>
pkgname=keyboard-volume-app-git
pkgver=r0.1.0.142.gc1b301c
pkgrel=1
pkgdesc="Per-app volume control via keyboard with OSD overlay (Qt6)"
arch=('x86_64')
url="https://github.com/Adiker/keyboard-volume-app"
license=('GPL-2.0-or-later')
depends=('qt6-base' 'libevdev' 'libpulse' 'libpipewire' 'taglib' 'pipewire' 'layer-shell-qt')
makedepends=('cmake' 'gcc' 'pkg-config' 'git' 'wayland' 'layer-shell-qt')
provides=('keyboard-volume-app')
conflicts=('keyboard-volume-app')
source=("${pkgname}::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s" "$(git describe --tags --long | sed 's/cpp-rewrite-v//;s/-/./g')"
}

build() {
    cmake -S "${pkgname}/cpp" -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF
    cmake --build build -j$(nproc)
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
