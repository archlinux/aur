# Maintainer:  Joshua Holmer <jholmer.in@gmail.com>

pkgname=libjxl-metrics-git
pkgver=0.8.1.r265.g1c748e86
pkgrel=2
pkgdesc="JPEG XL image format reference implementation with butteraugli, ssimulacra, and ssimulacra2 (git version)"
arch=('x86_64')
url='https://jpeg.org/jpegxl/'
license=('BSD')
depends=('brotli' 'highway-git' 'gtest' 'libpng' 'lcms2')
makedepends=(
    'git' 'cmake' 'clang' 'lld' 'giflib' 'gperftools' 'openexr' 'libjpeg-turbo'
    'python' 'asciidoc' 'graphviz' 'xdg-utils' 'gflags' 'zlib' 'doxygen'
)
provides=(
    'libjxl' 'libjxl-git' 'libjxl.so' 'libjxl_threads.so' 'libjxl-doc'
    'libjxl.so=0.8-64' 'libjxl_threads.so=0.8-64' 'libjxl.so=0.7-64' 'libjxl_threads.so=0.7-64'
    'libjxl-doc-git' 'butteraugli' 'butteraugli-git' 'ssimulacra'
    'ssimulacra-git' 'ssimulacra2' 'ssimulacra2-git'
)
conflicts=(
    'libjxl' 'libjxl-git' 'libjxl-doc' 'libjxl-doc-git' 'butteraugli'
    'butteraugli-git' 'ssimulacra' 'ssimulacra-git' 'ssimulacra2'
    'ssimulacra2-git'
)
optdepends=(
    'gdk-pixbuf2: for gdk-pixbuf loader'
    'gimp: for building gimp jxl plugin'
    'java-environment: for building FNI Java wrapper'
    'libwebp: for webp benchmarking'
    'libavif: for avif benchmarking'
)
source=(
    'libjxl::git+https://github.com/libjxl/libjxl.git'
    'brotli::git+https://github.com/google/brotli.git'
    'Little-CMS::git+https://github.com/mm2/Little-CMS.git'
    'googletest::git+https://github.com/google/googletest.git'
    'sjpeg::git+https://github.com/webmproject/sjpeg.git'
    'skcms::git+https://skia.googlesource.com/skcms.git'
    'highway::git+https://github.com/google/highway.git'
    'libpng::git+https://github.com/glennrp/libpng.git'
    'zlib::git+https://github.com/madler/zlib.git'
    'gflags::git+https://github.com/gflags/gflags.git'
    'libjxl-testdata::git+https://github.com/libjxl/testdata.git'
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
    'SKIP'
)
options=('!lto')

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
    git -C libjxl config --local submodule.third_party/testdata.url "${srcdir}/libjxl-testdata"
    git -C libjxl -c protocol.file.allow='always' submodule update
}

pkgver() {
    local _tag
    _tag="$(git -C libjxl tag --list --sort='-v:refname' 'v[[:digit:]]*' | sed 's/^v//;/[[:alpha:]]/d' | head -n1)"
    printf "${_tag}.r%s.g%s" "$(git -C libjxl rev-list --count "v${_tag}..HEAD")" \
        "$(git -C libjxl rev-parse --short HEAD)"
}

build() {
    # We "use" clang and lld as suggested by the repo
    export LDFLAGS="-fuse-ld=lld -Wl,--thinlto-jobs=all"
    export CFLAGS+=" -flto=thin" CXXFLAGS+=" -flto=thin"
    export CC=clang CXX=clang++

    cmake -B build -S libjxl \
        -DBUILD_TESTING=0 \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DJPEGXL_INSTALL_JARDIR='/usr/share/java' \
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

    # Work around for outdated tools
    # This will break in the future and needs to be kept track of
    ln -s "/usr/lib/libjxl.so.0.9.0" "$pkgdir/usr/lib/libjxl.so.0.8"
    ln -s "/usr/lib/libjxl.so.0.9.0" "$pkgdir/usr/lib/libjxl.so.0.8.0"
    ln -s "/usr/lib/libjxl_threads.so.0.9.0" "$pkgdir/usr/lib/libjxl_threads.so.0.8"
    ln -s "/usr/lib/libjxl_threads.so.0.9.0" "$pkgdir/usr/lib/libjxl_threads.so.0.8.0"
    ln -s "/usr/lib/libjxl.so.0.8.0" "$pkgdir/usr/lib/libjxl.so.0.7"
    ln -s "/usr/lib/libjxl.so.0.8.0" "$pkgdir/usr/lib/libjxl.so.0.7.0"
    ln -s "/usr/lib/libjxl_threads.so.0.8.0" "$pkgdir/usr/lib/libjxl_threads.so.0.7"
    ln -s "/usr/lib/libjxl_threads.so.0.8.0" "$pkgdir/usr/lib/libjxl_threads.so.0.7.0"
}
