# Maintainer:  Joshua Holmer <jholmer.in@gmail.com>

pkgname=libjxl-metrics-git
pkgver=v0.3.7.870.g373c5928
pkgrel=2
pkgdesc="JPEG XL image format reference implementation with butteraugli and ssimulacra (git version)"
arch=('x86_64')
url='https://jpeg.org/jpegxl/'
license=('BSD')
makedepends=('git' 'cmake' 'clang' 'brotli' 'gdk-pixbuf2' 'giflib' 'gimp'
             'gperftools' 'libjpeg-turbo' 'libpng' 'openexr' 'gflags'
             'gtest' 'java-environment' 'python' 'asciidoc' 'doxygen'
             'graphviz' 'xdg-utils' 'highway')
provides=('libjxl' 'libjpeg-xl-git' 'libjxl.so' 'libjxl_threads.so' 'libjxl-doc' 'libjpeg-xl-doc-git')
conflicts=('libjxl' 'libjpeg-xl-git' 'libjxl-doc' 'libjpeg-xl-doc-git')
replaces=('libjpeg-xl-git' 'libjpeg-xl-doc-git')
optdepends=('gdk-pixbuf2: for gdk-pixbuf loader'
            'gimp: for gimp plugin')
options=('!lto')
source=('git+https://github.com/libjxl/libjxl.git'
        'git+https://github.com/google/brotli.git'
        'git+https://github.com/mm2/Little-CMS.git'
        'git+https://github.com/google/googletest.git'
        'git+https://github.com/webmproject/sjpeg.git'
        'git+https://skia.googlesource.com/skcms.git'
        'git+https://github.com/google/highway.git'
        'git+https://github.com/glennrp/libpng.git'
        'git+https://github.com/madler/zlib.git'
        'git+https://github.com/gflags/gflags.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

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
    export CC='clang -flto=thin'
    export CXX='clang++ -flto=thin'
    export CFLAGS+=' -DNDEBUG'
    export CXXFLAGS+=' -DNDEBUG'
    cmake -B build -S libjxl \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_TESTING=false \
        -DJPEGXL_ENABLE_DEVTOOLS:BOOL='true' \
        -DJPEGXL_ENABLE_BENCHMARK:BOOL='false' \
        -DJPEGXL_ENABLE_EXAMPLES:BOOL='false' \
        -DJPEGXL_ENABLE_FUZZERS:BOOL='false' \
        -DJPEGXL_ENABLE_PLUGINS:BOOL='true' \
        -DJPEGXL_ENABLE_VIEWERS:BOOL='false' \
        -DJPEGXL_FORCE_SYSTEM_BROTLI:BOOL='true' \
        -DJPEGXL_FORCE_SYSTEM_GTEST:BOOL='true' \
        -DJPEGXL_FORCE_SYSTEM_HWY:BOOL='true' \
        -DJPEGXL_BUNDLE_LIBPNG:BOOL='NO' \
        -DJPEGXL_BUNDLE_GFLAGS='NO' \
        -Wno-dev
    make -C build all doc -j$(nproc)
}

check() {
    make -C build test
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
