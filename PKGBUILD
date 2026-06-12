# Maintainer: Luke Simpson <luke@s4solutions.ai>
pkgname=nexis
pkgver=2.5.0
pkgrel=1
pkgdesc="Linux system optimizer and monitoring tool"
arch=('x86_64' 'aarch64')
url="https://github.com/s4solutionsllc/Nexis"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-charts' 'qt6-svg')
makedepends=('cmake' 'gcc' 'make' 'qt6-tools')
# GH#82: '!lto' stops makepkg injecting -flto. On distros that enable LTO by
# default (CachyOS), GCC emits slim LTO objects that LLD cannot resolve, so the
# link fails with "undefined symbol: main" (Scrt1.o's _start -> main, the one
# real-object reference into an LTO object). Disabling LTO keeps the packaged
# build using plain objects that any linker handles.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/s4solutionsllc/Nexis/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3ad2aedcb975ac26993df15707d9277faf11742bbea3fdc53e0d6d1b01af7362')

build() {
    # GH#82: in-tree LLD auto-selection is now OFF by default (see
    # shared/cmake/cxxbasics/accelerators/UseFasterLinkers.cmake), so we no
    # longer need to pass -DCXXBASICS_USE_FASTER_LINKERS=OFF here. Combined with
    # options=('!lto') this remains a reproducible default-toolchain build.
    cmake -B build -S "Nexis-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DAPP_VERSION_OVERRIDE="$pkgver" \
        -DBUILD_TESTING=OFF \
        -Wno-dev
    cmake --build build -j$(nproc)
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
