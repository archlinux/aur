pkgname=mbelib-neo-git
pkgver=2.4.0.r0.gc2d0b80
pkgrel=2
pkgdesc="P25 Phase 1 and ProVoice IMBE and Half-rate AMBE vocoder library (modernized fork)"
arch=('x86_64' 'aarch64')
url="https://github.com/arancormonk/mbelib-neo"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('cmake' 'git')
provides=("mbelib-neo=${pkgver}")
conflicts=('mbelib-neo')
options=('staticlibs')
source=("$pkgname::git+https://github.com/arancormonk/mbelib-neo.git#branch=main")
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
_pffft_sha=f5ecc890d185eb33507b79d2e96f5310f9062d7f
source+=("pffft-$_pffft_sha.tar.gz::https://codeload.github.com/arancormonk/pffft/tar.gz/$_pffft_sha")
sha256sums+=('499d1382fc1fc0a15ee858d43c837965aa5c528880cc99f9203ed27d11d60467')
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
    cmake -B build -S "$pkgname" \
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
