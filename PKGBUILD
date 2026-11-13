pkgname=mbelib-neo
pkgver=2.6.9
pkgrel=1
pkgdesc="IMBE, AMBE and AMBE+2 vocoder library with TETRA ACELP decoding. Supports P25 Phase 1/2, DMR, NXDN, D-STAR, YSF, dPMR, X2-TDMA, ProVoice and TETRA."
arch=('x86_64' 'aarch64')
url="https://github.com/arancormonk/mbelib-neo"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('cmake')
conflicts=('mbelib-neo-git')
options=('staticlibs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('807c84c1337e16f3d5277c1e5ab3cb0a8007eacc53bed1598609d0967e70e9b3')

# BEGIN pinned PFFFT (tools/update_aur_pffft.py)
_pffft_sha=b7ed3cdb8655426a77aa26f8c0f5154205427f45
source+=("pffft-$_pffft_sha.tar.gz::https://codeload.github.com/arancormonk/pffft/tar.gz/$_pffft_sha")
sha256sums+=('c35ca6cff0032fac89fbec1acced75868caac0a121d947f8931f325ceae17925')
# END pinned PFFFT

build() {
    local _mbelib_source="$pkgname"
    [[ "$pkgname" == *-git ]] || _mbelib_source="$pkgname-$pkgver"
    # Keep the recipe usable before the FetchContent migration reaches main/releases.
    if [[ -f "$_mbelib_source/cmake/Pffft.cmake" ]] &&
        ! grep -qx "PFFFT_SHA=$_pffft_sha" "$_mbelib_source/tools/ci-dependency-pins.env"; then
        echo "PFFFT pin changed; update the AUR PKGBUILD before building." >&2
        return 1
    fi
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMBELIB_ENABLE_FAST_MATH=ON \
        -DMBELIB_ENABLE_NATIVE=OFF \
        -DFETCHCONTENT_SOURCE_DIR_MBELIB_PFFFT="$srcdir/pffft-$_pffft_sha" \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DMBELIB_BUILD_TESTS=OFF \
        -DMBELIB_BUILD_EXAMPLES=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
