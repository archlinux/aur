# Maintainer: Luke Simpson <luke@s4solutions.ai>
pkgname=nexis
pkgver=2.10.0
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
# Install tracking (Phase 2): source the uploaded release asset instead of the
# auto-generated tag tarball — GitHub only counts downloads of uploaded assets,
# so this makes AUR builds visible in per-asset download stats. Same content
# and Nexis-$pkgver/ prefix as the old archive URL. Effective from the first
# release that ships the asset (> 2.8.2); aur.yml's updpkgsums regenerates
# sha256sums at publish time.
source=("$pkgname-$pkgver.tar.gz::https://github.com/s4solutionsllc/Nexis/releases/download/v$pkgver/nexis-$pkgver-source.tar.gz")
sha256sums=('12bfe91730e659c5c92d895abe5f0b0059ab9871e8a40ea69691592c78611549')

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
