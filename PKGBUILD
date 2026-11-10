pkgname=mbelib-neo
pkgver=2.6.8
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
sha256sums=('3d84aab0cb2af035542ea6aad5cfd6db6392b80b63bcb20ce479cd2bdc498c12')

# BEGIN pinned PFFFT (tools/update_aur_pffft.py)
_pffft_sha=80b9c0139c91b684579115f482f90db97abffdb2
source+=("pffft-$_pffft_sha.tar.gz::https://codeload.github.com/arancormonk/pffft/tar.gz/$_pffft_sha")
sha256sums+=('032be470e74814cb65e98fd2f5785811aaa6bc50d7bcb7a3321573e71dfaafab')
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
