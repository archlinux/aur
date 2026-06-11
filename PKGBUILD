# Maintainer: Luke Simpson <luke@s4solutions.ai>
pkgname=nexis
pkgver=2.3.14
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
sha256sums=('07da2c95b342519791e1d918dae9fef6c08d126724ec98e358427873c0a16f4f')

build() {
    # GH#82: CXXBASICS_USE_FASTER_LINKERS=OFF disables the in-tree auto-selection
    # of LLD (UseFasterLinkers.cmake). A distro package should link with the
    # system default linker (BFD), which understands GCC's LTO plugin, rather
    # than force-selecting LLD. Combined with options=('!lto') this makes the
    # packaged build a reproducible default-toolchain build.
    cmake -B build -S "Nexis-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DAPP_VERSION_OVERRIDE="$pkgver" \
        -DBUILD_TESTING=OFF \
        -DCXXBASICS_USE_FASTER_LINKERS=OFF \
        -Wno-dev
    cmake --build build -j$(nproc)
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
