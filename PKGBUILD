# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=libjxl
pkgname=('libjxl' 'libjxl-doc')
pkgver=0.11.1
pkgrel=4
pkgdesc='JPEG XL image format reference implementation'
arch=('x86_64')
url='https://jpeg.org/jpegxl/'
license=('BSD-3-Clause')
makedepends=(
    'asciidoc'
    'brotli'
    'cmake'
    'doxygen'
    'gdk-pixbuf2'
    'giflib'
    'git'
    'gperftools'
    'graphviz'
    'gtest'
    'highway'
    'java-environment'
    'libjpeg-turbo'
    'libpng'
    'python'
    'xdg-utils')
source=("git+https://github.com/libjxl/libjxl.git#tag=v${pkgver}"
        'git+https://github.com/mm2/Little-CMS.git'
        'git+https://github.com/webmproject/sjpeg.git'
        'git+https://skia.googlesource.com/skcms.git'
        'libjxl-testdata'::'git+https://github.com/libjxl/testdata.git'
        'git+https://github.com/libjpeg-turbo/libjpeg-turbo.git')
sha256sums=('6420adcb5ccd23547eed91feb38ac9d7bdaac77def7183776e00699880148e3e'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    git -C libjxl submodule init
    
    local _submodule
    
    for _submodule in libjpeg-turbo sjpeg skcms
    do
        git -C libjxl config --local "submodule.third_party/${_submodule}.url" "${srcdir}/${_submodule}"
    done
    
    for _submodule in brotli googletest highway libpng zlib
    do
        git -C libjxl config --local "submodule.third_party/${_submodule}.update" none
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
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING='3.5.0' \
        -DJPEGXL_BUNDLE_LIBPNG:BOOL='NO' \
        -DJPEGXL_ENABLE_AVX512:BOOL='true' \
        -DJPEGXL_ENABLE_BENCHMARK:BOOL='false' \
        -DJPEGXL_ENABLE_EXAMPLES:BOOL='false' \
        -DJPEGXL_ENABLE_FUZZERS:BOOL='false' \
        -DJPEGXL_ENABLE_OPENEXR:BOOL='false' \
        -DJPEGXL_ENABLE_PLUGIN_GIMP210:BOOL='false' \
        -DJPEGXL_ENABLE_PLUGINS:BOOL='true' \
        -DJPEGXL_ENABLE_VIEWERS:BOOL='false' \
        -DJPEGXL_FORCE_SYSTEM_BROTLI:BOOL='true' \
        -DJPEGXL_FORCE_SYSTEM_GTEST:BOOL='true' \
        -DJPEGXL_FORCE_SYSTEM_HWY:BOOL='true' \
        -DJPEGXL_INSTALL_JARDIR='/usr/share/java' \
        -Wno-dev
    cmake --build build
    make -C build doc
}

check() {
    ctest --test-dir build --output-on-failure
}

package_libjxl() {
    depends=(
        'brotli'
        'gcc-libs'
        'giflib'
        'glibc'
        'gperftools'
        'highway'
        'libjpeg-turbo'
        'libpng')
    optdepends=(
        'gdk-pixbuf2: for gdk-pixbuf loader'
        'java-runtime: for JNI bindings')
    provides=(
        'libjxl.so'
        'libjxl_cms.so'
        'libjxl_threads.so')
    
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
