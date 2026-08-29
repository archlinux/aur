# Maintainer: kekmacska

pkgname=libxaac-git
pkgver=0.1.13.b919319
pkgrel=1
pkgdesc='Extended HE AAC Encoder and Decoder by Ittiam Systems (git version)'
arch=('any')
url='https://github.com/ittiam-systems/libxaac'
license=('Apache-2.0')
makedepends=('git' 'make' 'cmake')
provides=('libxaac' 'xaac' 'libxaacdec.so' 'libxaacenc.so' 'xaacdec' 'xaacenc')
source=('git+https://github.com/ittiam-systems/libxaac' 'shared.patch' 'testbench_memcorruption-fix.patch')
options=('!strip' '!lto')
sha256sums=('SKIP' 'abb545bfbfce403a752783e47a6a10a90102cc418cd6a69d559d7c6adf5e422c' '733d616e1e0ef6a9b248e0f012d0135a20a75cf61cec677be35a665836341c12')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --tags --long --always \
        | sed -E 's/^v//; s/-[0-9]+-g/./'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    LC_ALL=C patch -Np1 -i "$srcdir/shared.patch"
    LC_ALL=C patch -Np1 -i "$srcdir/testbench_memcorruption-fix.patch"
}

build() {
    cd "$srcdir/${pkgname%-git}"

    # ============================================================
    # Release / optimized build
    # ============================================================

    # Base flags (common to both compilers)
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

    #Clang-only flags
    CLANG_EXTRA_CFLAGS="-fstrict-vtable-pointers -fno-asynchronous-unwind-tables"
    CLANG_EXTRA_CXXFLAGS="$CLANG_EXTRA_CFLAGS -fno-rtti -fno-exceptions"
    CLANG_EXTRA_LDFLAGS="-fuse-ld=lld"

    #Detect compiler
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

    cmake \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SHARED_LIBRARY_SUFFIX=".so" \
        -Wno-author .

    make -j$(nproc)


    # ============================================================
    # Debug + AddressSanitizer build
    # ============================================================

    #if command -v clang >/dev/null 2>&1; then
    #    export CC=clang
    #    export CXX=clang++
    #else
    #    export CC=gcc
    #    export CXX=g++
    #fi

    # Debug information + AddressSanitizer.
    #
    # -O1                     Light optimization, recommended for ASan
    # -g3                     Maximum debug information
    # -fsanitize=address      Detect heap/stack/global buffer errors,
    #                         use-after-free, double-free, etc.
    # -fno-omit-frame-pointer Better stack traces
    #export CFLAGS="-O1 -g3 -fsanitize=address -fno-omit-frame-pointer"
    #export CXXFLAGS="-O1 -g3 -fsanitize=address -fno-omit-frame-pointer"
    #export LDFLAGS="-fsanitize=address"

    #cmake \
    #    -DBUILD_SHARED_LIBS=ON \
    #    -DCMAKE_BUILD_TYPE=Debug \
    #    -DCMAKE_SHARED_LIBRARY_SUFFIX=".so" \
    #    -Wno-author .
    #make -j$(nproc)
}


package() {
    cd "$srcdir/${pkgname%-git}"

    # Libraries
    install -Dm755 liblibxaacdec.so "$pkgdir/usr/lib/libxaacdec.so"
    install -Dm755 liblibxaacenc.so "$pkgdir/usr/lib/libxaacenc.so"

    # Executables
    install -Dm755 xaacdec "$pkgdir/usr/bin/xaacdec"
    install -Dm755 xaacenc "$pkgdir/usr/bin/xaacenc"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
