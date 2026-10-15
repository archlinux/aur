pkgname=mbelib-neo
pkgver=2.4.3
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
sha256sums=('aafd2a6e4ca5b9e33b2866b2fa77be2b8f9a98d7d551ad6fb6a328b8e7a439c2')

# BEGIN pinned PFFFT (tools/update_aur_pffft.py)
_pffft_sha=94d3c8323a530c5e60a2535505166366171c1fdb
source+=("pffft-$_pffft_sha.tar.gz::https://codeload.github.com/arancormonk/pffft/tar.gz/$_pffft_sha")
sha256sums+=('18339f8f518f1837785120881857f98b3c0d028200967354bf422e9eb5181f6a')
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
        -DFETCHCONTENT_SOURCE_DIR_MBELIB_PFFFT="$srcdir/pffft-$_pffft_sha" \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DMBELIB_BUILD_TESTS=OFF \
        -DMBELIB_BUILD_EXAMPLES=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
