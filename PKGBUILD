pkgname=dsd-neo-git
pkgver=2.11.4.r4.gfb83e69
pkgrel=1
pkgdesc="Modular C/C++ digital voice decoder with SDR support and trunking. Supports DMR, P25 Phase 1/2, NXDN, D-STAR, YSF, M17, dPMR, X2-TDMA, EDACS/ProVoice and TETRA."
arch=('x86_64' 'aarch64')
url="https://github.com/arancormonk/dsd-neo"
license=('GPL-3.0-or-later')
depends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'mbelib-neo>=2.6'
    'mbelib-neo<3'
    'libsndfile'
    'openssl'
    'ncurses'
    'libpulse'
    'rtl-sdr'
    'soapysdr'
    'codec2'
    'curl'
    'expat'
)
makedepends=(
    'git'
    'cmake'
    'help2man'
)
provides=('dsd-neo')
conflicts=('dsd-neo')
source=("${pkgname}::git+https://github.com/arancormonk/dsd-neo.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    (
        set -o pipefail
        git describe --long --tags --match 'v[0-9]*' --abbrev=7 2>/dev/null |
            sed 's/^v//;s/-/.r/;s/-/./' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

# BEGIN pinned PFFFT (tools/update_aur_pffft.py)
_pffft_sha=77a7ecda1f58f041168636c99be3e6e968d984d7
source+=("pffft-$_pffft_sha.tar.gz::https://codeload.github.com/arancormonk/pffft/tar.gz/$_pffft_sha")
sha256sums+=('4de67b1d528d48e52921c3a821d1cff9de2c4ff99ff7affcb67e2b9e47a88422')
# END pinned PFFFT

# BEGIN pinned TETRA_crypto (tools/update_aur_tetra_crypto.py)
_tetra_crypto_sha=defed030f6155ac70ff5d8bea97b348cb92ee1f6
source+=("TETRA_crypto-$_tetra_crypto_sha.tar.gz::https://codeload.github.com/MidnightBlueLabs/TETRA_crypto/tar.gz/$_tetra_crypto_sha")
sha256sums+=('41043b60890297f87b5cfc9d3b2d06eec57fe89022ce676fe1ca393e00b814c0')
# END pinned TETRA_crypto

build() {
    local _tetra_crypto_source="$pkgname"
    [[ "$pkgname" == *-git ]] || _tetra_crypto_source="$pkgname-$pkgver"
    # Sources that predate the embedded TETRA_crypto have no pin to compare.
    if [[ -f "$_tetra_crypto_source/cmake/TetraCrypto.cmake" ]] &&
        ! grep -qx "TETRA_CRYPTO_SHA=$_tetra_crypto_sha" "$_tetra_crypto_source/tools/ci-dependency-pins.env"; then
        echo "TETRA_crypto pin changed; update the AUR PKGBUILD before building." >&2
        return 1
    fi
    local _dsd_source="$pkgname"
    [[ "$pkgname" == *-git ]] || _dsd_source="$pkgname-$pkgver"
    # Keep the recipe usable before the FetchContent migration reaches main/releases.
    if [[ -f "$_dsd_source/cmake/Pffft.cmake" ]] &&
        ! grep -qx "PFFFT_SHA=$_pffft_sha" "$_dsd_source/tools/ci-dependency-pins.env"; then
        echo "PFFFT pin changed; update the AUR PKGBUILD before building." >&2
        return 1
    fi
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DDSD_ENABLE_FAST_MATH=ON \
        -DDSD_ENABLE_NATIVE=OFF \
        -DFETCHCONTENT_SOURCE_DIR_DSD_TETRA_CRYPTO="$srcdir/TETRA_crypto-$_tetra_crypto_sha" \
        -DFETCHCONTENT_SOURCE_DIR_DSD_PFFFT="$srcdir/pffft-$_pffft_sha" \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DBUILD_TESTING=OFF \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
