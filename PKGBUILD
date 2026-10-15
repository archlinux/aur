pkgname=dsd-neo
pkgver=2.10.0
pkgrel=2
pkgdesc="Modular C/C++ digital voice decoder with SDR support and trunking. Supports DMR, P25 Phase 1/2, NXDN, D-STAR, YSF, M17, dPMR, X2-TDMA, EDACS/ProVoice and TETRA"
arch=('x86_64' 'aarch64')
url="https://github.com/arancormonk/dsd-neo"
license=('GPL-3.0-or-later')
depends=(
    'mbelib-neo>=2.0'
    'mbelib-neo<3'
    'libsndfile'
    'openssl'
    'ncurses'
    'libpulse'
    'rtl-sdr'
    'soapysdr'
    'codec2'
    'curl'
)
makedepends=(
    'cmake'
    'help2man'
)
conflicts=('dsd-neo-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bed2c28790fae49dacae54dd7fbe0b04984475c3f6e41c086eaa6196000a5634')

# BEGIN pinned PFFFT (tools/update_aur_pffft.py)
_pffft_sha=f5ecc890d185eb33507b79d2e96f5310f9062d7f
source+=("pffft-$_pffft_sha.tar.gz::https://codeload.github.com/arancormonk/pffft/tar.gz/$_pffft_sha")
sha256sums+=('499d1382fc1fc0a15ee858d43c837965aa5c528880cc99f9203ed27d11d60467')
# END pinned PFFFT

build() {
    local _dsd_source="$pkgname"
    [[ "$pkgname" == *-git ]] || _dsd_source="$pkgname-$pkgver"
    # Keep the recipe usable before the FetchContent migration reaches main/releases.
    if [[ -f "$_dsd_source/cmake/Pffft.cmake" ]] &&
        ! grep -qx "PFFFT_SHA=$_pffft_sha" "$_dsd_source/tools/ci-dependency-pins.env"; then
        echo "PFFFT pin changed; update the AUR PKGBUILD before building." >&2
        return 1
    fi
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DFETCHCONTENT_SOURCE_DIR_DSD_PFFFT="$srcdir/pffft-$_pffft_sha" \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DBUILD_TESTING=OFF \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
