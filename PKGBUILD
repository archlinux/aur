# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=jpegli-git
pkgver=r2989.g031a007
pkgrel=2
pkgdesc='A JPEG encoder and decoder implementation that is API and ABI compatible with libjpeg62 (git version)'
arch=('x86_64')
url='https://github.com/google/jpegli/'
license=('BSD-3-Clause')
depends=(
    'glibc'
    'libgcc'
    'libstdc++')
makedepends=(
    'cmake'
    'git')
provides=('jpegli' 'libjpeg6' 'libjpeg6-turbo')
conflicts=('jpegli' 'libjpeg6' 'libjpeg6-turbo')
options=('!emptydirs')
source=('git+https://github.com/google/jpegli.git'
        'git+https://github.com/mm2/Little-CMS.git'
        'git+https://github.com/google/googletest.git'
        'git+https://github.com/webmproject/sjpeg.git'
        'git+https://github.com/google/skcms.git'
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
            'b99d0e4ecb7134724a2690552b56da242d5e02a93eda4299145dab3be5d7ea82')

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
    export CFLAGS+=' -DNDEBUG -ffat-lto-objects'
    export CXXFLAGS+=' -DNDEBUG -ffat-lto-objects'
    cmake -B build -S jpegli \
        -G 'Unix Makefiles' \
        -DBUILD_TESTING:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DHWY_ENABLE_INSTALL:BOOL='OFF' \
        -DJPEGLI_ENABLE_BENCHMARK:BOOL='false' \
        -DJPEGLI_ENABLE_JNI:BOOL='false' \
        -DJPEGLI_BUNDLE_LIBPNG:BOOL='NO' \
        -DJPEGLI_ENABLE_MANPAGES:BOOL='false' \
        -DJPEGLI_ENABLE_OPENEXR:BOOL='false' \
        -DJPEGLI_FORCE_SYSTEM_HWY:BOOL='false' \
        -DJPEGLI_INSTALL_JPEGLI_LIBJPEG:BOOL='true' \
        -Wno-author
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -d -m755 "${pkgdir}/usr/lib/jpegli"
    install -D -m644 jpegli/{LICENSE,PATENTS} -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${pkgdir}/usr/include"/*.h
    rm "${pkgdir}/usr/lib/libjpeg.so"
    ln -s ../libjpeg.so.62 "${pkgdir}/usr/lib/jpegli/libjpeg.so"
}
