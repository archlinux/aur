# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=libjxl-git
pkgname=('libjxl-git' 'libjxl-doc-git')
pkgver=0.3.7.r746.g61f9ed04
pkgrel=1
pkgdesc='JPEG XL image format reference implementation (git version)'
arch=('x86_64')
url='https://jpeg.org/jpegxl/'
license=('BSD')
makedepends=('git' 'cmake' 'clang' 'brotli' 'gdk-pixbuf2' 'giflib' 'gimp'
             'gperftools' 'libjpeg-turbo' 'libpng' 'openexr' 'gflags'
             'gtest' 'java-environment' 'python' 'asciidoc' 'doxygen'
             'graphviz' 'xdg-utils' 'highway-git')
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
    git -C libjxl describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export CC='clang'
    export CXX='clang++'
    export CFLAGS+=' -DNDEBUG'
    export CXXFLAGS+=' -DNDEBUG'
    cmake -B build -S libjxl \
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
        -DJPEGXL_BUNDLE_GFLAGS='NO' \
        -Wno-dev
    make -C build all doc
}

check() {
    make -C build test
}

package_libjxl-git() {
    depends=('brotli' 'giflib' 'gperftools' 'libjpeg-turbo' 'libpng' 'openexr')
    optdepends=('gdk-pixbuf2: for gdk-pixbuf loader'
                'gimp: for gimp plugin'
                'java-runtime: for JNI bindings')
    provides=('libjxl' 'libjpeg-xl-git' 'libjxl.so' 'libjxl_threads.so')
    conflicts=('libjxl' 'libjpeg-xl-git')
    replaces=('libjpeg-xl-git')
    
    make -C build DESTDIR="$pkgdir" install
    install -D -m755 build/tools/libjxl_jni.so -t "${pkgdir}/usr/lib"
    install -D -m644 libjxl/{LICENSE,PATENTS} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_libjxl-doc-git() {
    pkgdesc="$(sed 's/(\(git\)/(documentation; \1/' <<< "$pkgdesc")"
    arch=('any')
    provides=('libjxl-doc' 'libjpeg-xl-doc-git')
    conflicts=('libjxl-doc' 'libjpeg-xl-doc-git')
    replaces=('libjpeg-xl-doc-git')
    
    install -d -m755 "${pkgdir}/usr/share/doc"
    install -D -m644 libjxl/{LICENSE,PATENTS} -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -dr --no-preserve='ownership' build/html "${pkgdir}/usr/share/doc/libjxl"
}
