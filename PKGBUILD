# Maintainer: Luke Simpson <luke@s4solutions.ai>
pkgname=nexis
pkgver=2.3.11
pkgrel=1
pkgdesc="Linux system optimizer and monitoring tool"
arch=('x86_64' 'aarch64')
url="https://github.com/s4solutionsllc/Nexis"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-charts' 'qt6-svg')
makedepends=('cmake' 'gcc' 'make' 'qt6-tools')
checkdepends=('xorg-server-xvfb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/s4solutionsllc/Nexis/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('306570002c01a519377f6901729571ae300bb1906078c6a73bcb7696e98e5230')

build() {
    cmake -B build -S "Nexis-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DAPP_VERSION_OVERRIDE="$pkgver" \
        -Wno-dev
    cmake --build build -j$(nproc)
}

check() {
    xvfb-run -a ctest --test-dir build --output-on-failure -E ScreenshotTests
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
