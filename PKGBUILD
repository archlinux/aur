# Maintainer: kekmacska <kekmacska2@proton.me>
pkgname=turingcodec-git
pkgver=89.5d44bd7
pkgrel=1
pkgdesc="Turing HEVC codec by BBC (git version) with GCC16/Boost fixes"
arch=('x86_64')
url="https://github.com/bbc/turingcodec"
license=('GPL2')
depends=('boost')
makedepends=('git' 'cmake' 'make' 'gcc')
source=("git+https://github.com/bbc/turingcodec.git"
        "turingcodec-fixes.patch")
sha256sums=('SKIP'
            '09cedd1098863f19c37364c2180db0991b1c5ac00c6b5afdd506c9f6c4c05fbd')

pkgver() {
    cd "$srcdir/turingcodec"
    printf "%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/turingcodec"
    patch -p1 -i "$srcdir/turingcodec-fixes.patch"
}

    # -fstrict-aliasing (which is automatically enabled at O2 and O3) causes segfaults
    # -fno-exceptions -fno-rtti break the build
build() {
    cd "$srcdir/turingcodec"

    _march="-march=native -mtune=native"

    _cflags="-O1 ${_march} -pipe \
             -fno-plt \
             -falign-functions=32 \
             -falign-loops=16 \
             -fno-semantic-interposition \
             -falign-jumps=16 \
             -frename-registers \
             -fipa-pta \
             -fipa-sra \
             -fdevirtualize-at-ltrans \
             -fipa-cp-clone \
             -fcode-hoisting \
             -fmerge-constants \
             -fivopts \
             -fsection-anchors \
             -fweb \
             -fconserve-stack \
             -fdelete-null-pointer-checks \
             -fgcse-after-reload \
             -fpeephole2 \
             -fbranch-target-load-optimize \
             -foptimize-sibling-calls \
             -fcaller-saves \
             -fcse-follow-jumps \
             -fcse-skip-blocks \
             -fpartial-inlining \
             -fhoist-adjacent-loads \
             -freorder-blocks \
             -freorder-functions \
             -falign-labels=16 \
             -fstrict-overflow \
             -fno-math-errno \
             -fno-signed-zeros \
             -fno-trapping-math \
             -fno-rounding-math \
             -fno-signaling-nans \
             -fno-unsafe-math-optimizations \
             -fno-finite-math-only \
             -fomit-frame-pointer \
             -fno-strict-enums \
             -floop-interchange \
             -floop-strip-mine \
             -floop-block \
             -ftree-slp-vectorize \
             -ftree-loop-distribution \
             -floop-unroll-and-jam \
             -ftree-loop-if-convert \
             -ftree-loop-vectorize \
             -ftree-loop-distribute-patterns \
             -ftree-pre \
             -ftree-dce \
             -ftree-dominator-opts \
             -ftree-fre \
             -ftree-sink \
             -ftree-ter \
             -ftree-coalesce-vars \
             -ftree-tail-merge \
             -ftree-sra \
             -ftree-bit-ccp \
             -ftree-ccp \
             -ftree-copy-prop \
             -ftree-slsr \
             -ftree-phiprop \
             -ftree-forwprop \
             -ftree-dse \
             -ftree-reassoc \
             -ftree-vrp \
             -fstrict-enums \
             -fipa-pure-const \
             -fipa-reference \
             -fipa-modref \
             -fipa-icf \
             -fipa-bit-cp \
             -fgcse \
             -fipa-cp \
             -fipa-ra \
             -fipa-profile \
             -fipa-icf"

    _ldflags="-Wl,--as-needed \
            -Wl,--gc-sections \
            -Wl,-O3 \
            -Wl,--hash-style=gnu \
            -Wl,--sort-common \
            -Wl,--sort-section=alignment \
            -Wl,--relax \
            -Wl,--hash-style=both \
            -Wl,--strip-discarded \
            -Wl,--discard-locals"

    mkdir -p build/release
    cd build/release

    CFLAGS="$_cflags" \
    CXXFLAGS="$_cflags -std=gnu++11" \
    LDFLAGS="$_ldflags" \
    cmake -DUSE_SYSTEM_BOOST=ON \
          -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
          ../..

    make -j"$(nproc)"
}

package() {
    cd "$srcdir/turingcodec/build/release"

    # binaries
    install -Dm755 turing/turing "$pkgdir/usr/bin/turing"
    install -Dm755 havoc/havoc "$pkgdir/usr/bin/havoc"

    # libraries
    if [[ -f libturing.a ]]; then
        install -Dm644 libturing.a "$pkgdir/usr/lib/libturing.a"
    fi

    if [[ -f havoc/libhavoc.a ]]; then
        install -Dm644 havoc/libhavoc.a "$pkgdir/usr/lib/libhavoc.a"
    fi

    # pkgconfig
    if [[ -f turing.pc ]]; then
        install -Dm644 turing.pc "$pkgdir/usr/lib/pkgconfig/turing.pc"
    fi

    # headers
    install -d "$pkgdir/usr/include/turingcodec"
    cp -r "$srcdir/turingcodec/turing"/*.h "$pkgdir/usr/include/turingcodec/"
}
