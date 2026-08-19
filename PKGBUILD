# Maintainer: kekmacska

_gitname=VVCSoftware_VTM
pkgname=vvc-vtm-git
pkgver=8484
pkgrel=1
pkgdesc="VVC Test Model (VTM) reference encoder/decoder - git version"
arch=('x86_64')
url="https://vcgit.hhi.fraunhofer.de/jvet/VVCSoftware_VTM"
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'make')
source=("git+https://vcgit.hhi.fraunhofer.de/jvet/VVCSoftware_VTM.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    git rev-list --count HEAD
}

build() {
    cd "$_gitname"

    BASE_CFLAGS="-O3 -march=native -mtune=native \
        -falign-functions=32 -falign-loops=32 \
        -fno-math-errno -fno-trapping-math \
        -fno-semantic-interposition \
        -fomit-frame-pointer -fno-plt \
        -pipe -flto -Wall -Wno-unused \
        -fstrict-aliasing \
        -fmerge-all-constants -ffunction-sections \
        -fdata-sections"

    BASE_CXXFLAGS="$BASE_CFLAGS"
    BASE_LDFLAGS="-Wl,--icf=safe -Wl,--gc-sections -Wl,-O3 -flto -fno-plt"

    # Clang-only flags
    CLANG_EXTRA_CFLAGS="-fstrict-vtable-pointers -fno-asynchronous-unwind-tables"
    CLANG_EXTRA_CXXFLAGS="$CLANG_EXTRA_CFLAGS"
    CLANG_EXTRA_LDFLAGS="-fuse-ld=lld"

    # Detect compiler
    if command -v clang >/dev/null 2>&1; then
        export CC=clang
        export CXX=clang++
        export CFLAGS="$BASE_CFLAGS $CLANG_EXTRA_CFLAGS"
        export CXXFLAGS="$BASE_CXXFLAGS $CLANG_EXTRA_CXXFLAGS"
        export LDFLAGS="$BASE_LDFLAGS $CLANG_EXTRA_LDFLAGS"
    else
        export CC=gcc
        export CXX=g++
        export CFLAGS="$BASE_CFLAGS"
        export CXXFLAGS="$BASE_CXXFLAGS"
        export LDFLAGS="$BASE_LDFLAGS"
    fi

    mkdir -p build
    cd build

    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_SHARED=ON \
        -DENABLE_STATIC=OFF \
        -Wno-author

    make -j"$(nproc)"
}

package() {
    cd "$srcdir/$_gitname"

    # find actual umake output directory (compiler name/version independent)
    umake_bin=$(find bin/umake -type d -path "*/x86_64/release" -print -quit)
    umake_lib=$(find lib/umake -type d -path "*/x86_64/release" -print -quit)

    # Binaries
    install -d "$pkgdir/usr/bin"
    for f in "$umake_bin"/*; do
        base="$(basename "$f")"

        # DO NOT INSTALL parcat (conflicts with parallel)
        [[ "$base" == "parcat" ]] && continue
        [[ "$base" == "parcatStatic" ]] && continue

        install -m755 "$f" "$pkgdir/usr/bin/$base"
    done

    # License
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
