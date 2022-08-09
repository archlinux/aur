# Maintainer:  Joshua Holmer <jholmer.in@gmail.com>

pkgname=libjxl-metrics-git
pkgver=v0.7.base.0.g980c90f6
pkgrel=1
pkgdesc="JPEG XL image format reference implementation with butteraugli and ssimulacra (git version)"
arch=('x86_64')
url='https://jpeg.org/jpegxl/'
license=('BSD')
depends=('brotli' 'highway' 'gtest' 'libpng' 'lcms2')
makedepends=(
    'git' 'cmake' 'clang' 'lld' 'giflib' 'gperftools' 'openexr' 'libjpeg-turbo'
    'python' 'asciidoc' 'graphviz' 'xdg-utils' 'gflags' 'zlib' 'doxygen'
)
provides=(
    'libjxl' 'libjxl-git' 'libjxl.so' 'libjxl_threads.so' 'libjxl-doc'
    'libjxl-doc-git' 'butteraugli-git' 'ssimulacra'
)
conflicts=(
    'libjxl' 'libjxl-git' 'libjxl-doc' 'libjxl-doc-git' 'butteraugli-git'
    'ssimulacra'
)
optdepends=(
    'gdk-pixbuf2: for gdk-pixbuf loader'
    'gimp: for building gimp jxl plugin'
    'java-environment: for building FNI Java wrapper'
    'libwebp: for webp benchmarking'
    'libavif: for avif benchmarking'
)
options=('!lto')
source=(
    'git+https://github.com/libjxl/libjxl.git#commit=980c90f65f41066cc4959b4eb80eba906867103b'
    'git+https://github.com/google/brotli.git'
    'git+https://github.com/mm2/Little-CMS.git'
    'git+https://github.com/google/googletest.git'
    'git+https://github.com/webmproject/sjpeg.git'
    'git+https://skia.googlesource.com/skcms.git'
    'git+https://github.com/google/highway.git'
    'git+https://github.com/glennrp/libpng.git'
    'git+https://github.com/madler/zlib.git'
    'git+https://github.com/gflags/gflags.git'
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

prepare() {
    git -C libjxl submodule init
    git -C libjxl config --local submodule.third_party/brotli.url "${srcdir}/brotli"
    git -C libjxl config --local submodule.third_party/lcms.url "${srcdir}/Little-CMS"
    git -C libjxl config --local submodule.third_party/googletest.url "${srcdir}/googletest"
    git -C libjxl config --local submodule.third_party/sjpeg.url "${srcdir}/sjpeg"
    git -C libjxl config --local submodule.third_party/skcms.url "${srcdir}/skcms"
    git -C libjxl config --local submodule.third_party/highway.url "${srcdir}/highway"
    git -C libjxl config --local submodule.third_party/libpng.url "${srcdir}/libpng"
    git -C libjxl config --local submodule.third_party/zlib.url "${srcdir}/zlib"
    git -C libjxl config --local submodule.third_party/gflags.url "${srcdir}/gflags"
    git -C libjxl submodule update
}

pkgver() {
    cd libjxl
    echo "$(git describe --long --tags | tr - .)"
}

build() {
    export LDFLAGS="-fuse-ld=lld -Wl,--thinlto-jobs=all"
    COMMON_FLAGS="-O3 -march=native -flto=thin -pipe"
    export CC=clang CXX=clang++
    export CFLAGS="${COMMON_FLAGS}" CXXFLAGS="${COMMON_FLAGS}"

    cmake -B build -S libjxl \
        -DBUILD_TESTING=0 \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DJPEGXL_INSTALL_JARDIR='/usr/share/java' \
        -DCMAKE_C_COMPILER="${CC}" \
        -DCMAKE_CXX_COMPILER="${CXX}" \
        -DCMAKE_C_FLAGS="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}" \
        -DJPEGXL_ENABLE_DEVTOOLS=1 \
        -DJPEGXL_ENABLE_EXAMPLES=0 \
        -DJPEGXL_ENABLE_PLUGINS=1 \
        -DJPEGXL_ENABLE_FUZZERS=0 \
        -DJPEGXL_FORCE_SYSTEM_BROTLI=1 \
        -DJPEGXL_FORCE_SYSTEM_LCMS2=1 \
        -DJPEGXL_FORCE_SYSTEM_GTEST=1 \
        -DJPEGXL_FORCE_SYSTEM_HWY=1 \
        -DJPEGXL_BUNDLE_LIBPNG=0 \
        -Wno-dev
    make -C build all doc -j $(nproc)
}

package() {
    # libjxl main
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 libjxl/{LICENSE,PATENTS} -t "${pkgdir}/usr/share/licenses/${pkgname}"

    # Docs
    install -d -m755 "${pkgdir}/usr/share/doc"
    install -D -m644 libjxl/{LICENSE,PATENTS} -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -dr --no-preserve='ownership' build/html "${pkgdir}/usr/share/doc/libjxl"

    # Metrics
    ln -s "/usr/bin/butteraugli_main" "$pkgdir/usr/bin/butteraugli"
    ln -s "/usr/bin/ssimulacra_main" "$pkgdir/usr/bin/ssimulacra"
}
