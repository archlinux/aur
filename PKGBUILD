# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=jpegli-git
pkgver=r2874.gbc19ca2
pkgrel=2
pkgdesc='A JPEG encoder and decoder implementation that is API and ABI compatible with libjpeg62 (git version)'
arch=('x86_64')
url='https://github.com/google/jpegli/'
license=('BSD-3-Clause')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'git')
provides=('jpegli' 'libjpeg6' 'libjpeg.so')
conflicts=('jpegli' 'libjpeg6' 'libjxl')
options=('!emptydirs')
source=('git+https://github.com/google/jpegli.git'
        'git+https://github.com/mm2/Little-CMS.git'
        'git+https://github.com/google/googletest.git'
        'git+https://github.com/webmproject/sjpeg.git'
        'git+https://skia.googlesource.com/skcms.git'
        'git+https://github.com/google/highway.git'
        'git+https://github.com/glennrp/libpng.git'
        'git+https://github.com/madler/zlib.git'
        'jpegli-testdata'::'git+https://github.com/libjxl/testdata.git'
        'git+https://github.com/libjpeg-turbo/libjpeg-turbo.git'
        '010-jpegli-disable-exe-static-linking.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'aee5c6d67080c1cc84c24b2cccfa7ef1d3886835f2fc11620b0c0a79355fb1f8')

prepare() {
    git -C jpegli submodule init
    git -C jpegli config --local submodule.third_party/lcms.url "${srcdir}/Little-CMS"
    git -C jpegli config --local submodule.third_party/testdata.url "${srcdir}/jpegli-testdata"
    
    local _submodule
    for _submodule in googletest sjpeg skcms highway libpng zlib libjpeg-turbo
    do
        git -C jpegli config --local "submodule.third_party/${_submodule}.url" "${srcdir}/${_submodule}"
    done
    
    git -C jpegli -c protocol.file.allow='always' submodule update
    
    # allow RELRO and PIE in binary executables
    patch -d jpegli -Np1 -i "${srcdir}/010-jpegli-disable-exe-static-linking.patch"
}

pkgver() {
    (
        set -o pipefail
        git -C jpegli describe --long --abbrev='7' 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
        printf 'r%s.g%s' "$(git -C jpegli rev-list --count HEAD)" "$(git -C jpegli rev-parse --short='7' HEAD)"
    )
}

build() {
    export CFLAGS+=' -DNDEBUG'
    export CXXFLAGS+=' -DNDEBUG'
    cmake -B build -S jpegli \
        -G 'Unix Makefiles' \
        -DBUILD_TESTING:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_INCLUDEDIR:PATH='include/jpegli' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib/jpegli' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING='3.5.0' \
        -DHWY_ENABLE_INSTALL:BOOL='OFF' \
        -DJPEGXL_ENABLE_BENCHMARK:BOOL='false' \
        -DJPEGXL_ENABLE_JNI:BOOL='false' \
        -DJPEGXL_BUNDLE_LIBPNG:BOOL='NO' \
        -DJPEGXL_ENABLE_MANPAGES:BOOL='false' \
        -DJPEGXL_ENABLE_OPENEXR:BOOL='false' \
        -DJPEGXL_FORCE_SYSTEM_HWY:BOOL='false' \
        -DJPEGXL_INSTALL_JPEGLI_LIBJPEG:BOOL='true' \
        -DJPEGXL_STATIC:BOOL='true' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 jpegli/{LICENSE,PATENTS} -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/lib/jpegli"/libjpeg.so.* "${pkgdir}/usr/lib"
    ln -sf "../$(find "${pkgdir}/usr/lib" -regex '.*libjpeg.so.[0-9]*' -exec basename {} \;)" "${pkgdir}/usr/lib/jpegli/libjpeg.so"
    rm -r "${pkgdir}/usr/include/jpegli/jxl"
    rm "${pkgdir}/usr/lib/jpegli"/{,pkgconfig/}libjxl*
}
