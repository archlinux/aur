# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=libjxl
pkgname=('libjxl' 'libjxl-doc')
pkgver=0.10.3
pkgrel=1
pkgdesc='JPEG XL image format reference implementation'
arch=('x86_64')
url='https://jpeg.org/jpegxl/'
license=('BSD-3-Clause')
makedepends=('git' 'cmake' 'brotli' 'gdk-pixbuf2' 'giflib' 'gimp'
             'gperftools' 'highway' 'libjpeg-turbo' 'libpng' 'openexr'
             'gtest' 'java-environment' 'python' 'asciidoc' 'doxygen'
             'graphviz' 'xdg-utils')
source=("git+https://github.com/libjxl/libjxl.git#tag=v${pkgver}"
        'git+https://github.com/google/brotli.git'
        'git+https://github.com/mm2/Little-CMS.git'
        'git+https://github.com/google/googletest.git'
        'git+https://github.com/webmproject/sjpeg.git'
        'git+https://skia.googlesource.com/skcms.git'
        'git+https://github.com/google/highway.git'
        'git+https://github.com/glennrp/libpng.git'
        'git+https://github.com/madler/zlib.git'
        'libjxl-testdata'::'git+https://github.com/libjxl/testdata.git'
        'git+https://github.com/libjpeg-turbo/libjpeg-turbo.git')
sha256sums=('55b9ed43559aaf5c2538813000bea6267437a84807a65c1d2d3314dd0d00de6f'
            'SKIP'
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
    local _submodule
    for _submodule in brotli googletest sjpeg skcms highway libpng zlib libjpeg-turbo
    do
        git -C libjxl config --local "submodule.third_party/${_submodule}.url" "${srcdir}/${_submodule}"
    done
    git -C libjxl config --local submodule.third_party/lcms.url "${srcdir}/Little-CMS"
    git -C libjxl config --local submodule.third_party/testdata.url "${srcdir}/libjxl-testdata"
    git -C libjxl -c protocol.file.allow='always' submodule update
}

build() {
    export CFLAGS+=' -DNDEBUG -ffat-lto-objects'
    export CXXFLAGS+=' -DNDEBUG -ffat-lto-objects'
    cmake -B build -S libjxl \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DJPEGXL_ENABLE_BENCHMARK:BOOL='false' \
        -DJPEGXL_ENABLE_EXAMPLES:BOOL='false' \
        -DJPEGXL_ENABLE_FUZZERS:BOOL='false' \
        -DJPEGXL_ENABLE_PLUGINS:BOOL='true' \
        -DJPEGXL_ENABLE_VIEWERS:BOOL='false' \
        -DJPEGXL_FORCE_SYSTEM_BROTLI:BOOL='true' \
        -DJPEGXL_FORCE_SYSTEM_GTEST:BOOL='true' \
        -DJPEGXL_FORCE_SYSTEM_HWY:BOOL='true' \
        -DJPEGXL_BUNDLE_LIBPNG:BOOL='NO' \
        -DJPEGXL_INSTALL_JARDIR='/usr/share/java' \
        -Wno-dev
    cmake --build build
    make -C build doc
}

check() {
    ctest --test-dir build --output-on-failure
}

package_libjxl() {
    depends=('brotli' 'giflib' 'gperftools' 'highway' 'libjpeg-turbo' 'libpng' 'openexr')
    optdepends=('gdk-pixbuf2: for gdk-pixbuf loader'
                'gimp: for gimp plugin'
                'java-runtime: for JNI bindings')
    provides=('libjxl.so' 'libjxl_cms.so' 'libjxl_threads.so')
    
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 libjxl/{LICENSE,PATENTS} -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/java"/{org.jpeg.jpegxl,jpegxl}.jar
}

package_libjxl-doc() {
    pkgdesc+=' (documentation)'
    
    install -d -m755 "${pkgdir}/usr/share/doc"
    install -D -m644 libjxl/{LICENSE,PATENTS} -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -dr --no-preserve='ownership' build/html "${pkgdir}/usr/share/doc/libjxl"
}
