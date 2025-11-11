# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=libjxl-git
pkgname=('libjxl-git' 'libjxl-doc-git')
pkgver=0.11.1.r456.g3d095d9b
pkgrel=1
pkgdesc='JPEG XL image format reference implementation (git version)'
arch=('x86_64')
url='https://jpeg.org/jpegxl/'
license=('BSD-3-Clause')
makedepends=(
    'add-determinism'
    'asciidoc'
    'brotli'
    'cmake'
    'doxygen'
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
source=('git+https://github.com/libjxl/libjxl.git'
        'git+https://github.com/mm2/Little-CMS.git'
        'git+https://github.com/webmproject/sjpeg.git'
        'git+https://github.com/google/skcms.git'
        'libjxl-testdata'::'git+https://github.com/libjxl/testdata.git'
        'git+https://github.com/libjpeg-turbo/libjpeg-turbo.git')
sha256sums=('SKIP'
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

pkgver() {
    local _tag
    _tag="$(git -C libjxl tag --list --sort='-v:refname' 'v[[:digit:]]*' | sed 's/^v//;/[[:alpha:]]/d' | head -n1)"
    printf "${_tag}.r%s.g%s" "$(git -C libjxl rev-list --count "v${_tag}..HEAD")" \
                             "$(git -C libjxl rev-parse --short HEAD)"
}

build() {
    export CFLAGS+=' -DNDEBUG -ffat-lto-objects'
    export CXXFLAGS+=' -DNDEBUG -ffat-lto-objects'
    cmake -B build -S libjxl \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DJPEGXL_BUNDLE_LIBPNG:BOOL='NO' \
        -DJPEGXL_ENABLE_AVX512:BOOL='true' \
        -DJPEGXL_ENABLE_BENCHMARK:BOOL='false' \
        -DJPEGXL_ENABLE_EXAMPLES:BOOL='false' \
        -DJPEGXL_ENABLE_FUZZERS:BOOL='false' \
        -DJPEGXL_ENABLE_OPENEXR:BOOL='false' \
        -DJPEGXL_ENABLE_PLUGINS:BOOL='false' \
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

package_libjxl-git() {
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
        'java-runtime: for JNI bindings')
    provides=('libjxl' 'libjpeg-xl-git'
        'libjxl.so'
        'libjxl_cms.so'
        'libjxl_threads.so')
    conflicts=('libjxl' 'libjpeg-xl-git')
    replaces=('libjpeg-xl-git')
    
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 libjxl/{LICENSE,PATENTS} -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/java"/{org.jpeg.jpegxl,jpegxl}.jar
    
    # Clamp timestamps to SOURCE_DATE_EPOCH and strip other metadata, to make
    # the package reproducible.
    add-det "${pkgdir}/usr/share/java"/jpegxl.jar
}

package_libjxl-doc-git() {
    pkgdesc="$(sed 's/(\(git\)/(documentation; \1/' <<< "$pkgdesc")"
    arch=('any')
    provides=('libjxl-doc' 'libjpeg-xl-doc-git')
    conflicts=('libjxl-doc' 'libjpeg-xl-doc-git')
    replaces=('libjpeg-xl-doc-git')
    
    install -d -m755 "${pkgdir}/usr/share/doc"
    install -D -m644 libjxl/{LICENSE,PATENTS} -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -dr --no-preserve='ownership' build/doc/html "${pkgdir}/usr/share/doc/libjxl"
}
