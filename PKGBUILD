# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libjpeg-xl-git
pkgver=r1.ff09371
pkgrel=1
pkgdesc='JPEG XL image format reference implementation (git version)'
arch=('x86_64')
url='https://jpeg.org/jpegxl/'
license=('Apache')
depends=('gcc-libs' 'shared-mime-info')
optdepends=('libwebp: for CLI tools'
            'openexr: for CLI tools')
makedepends=('git' 'cmake' 'clang' 'libwebp' 'openexr' 'gtest' 'python' 'freeglut')
provides=('libjpeg-xl')
conflicts=('libjpeg-xl')
source=('git+https://gitlab.com/wg1/jpeg-xl.git'
        'git+https://github.com/google/brotli.git'
        'git+https://github.com/lvandeve/lodepng.git'
        'git+https://github.com/mm2/Little-CMS.git'
        'git+https://github.com/google/googletest'
        'git+https://github.com/gperftools/gperftools.git'
        'git+https://github.com/google/brunsli.git'
        'git+https://github.com/webmproject/sjpeg.git'
        'git+https://skia.googlesource.com/skcms.git'
        '010-libjpeg-xl-git-remove-werror.patch'
        '020-libjpeg-xl-git-fix-headers-install-path.patch'
        '030-libjpeg-xl-git-fix-gdk-pixbuf-install-path.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '1d4a4f324ba33fe80cb6d68cbe65f280086c0d5ac094c4d443f94c66a5fabf6d'
            '0cfbbe7f3968648d4413649c8bb6f340749e946913e702ce250fc10c9ed5ba12'
            '5d7df9a9cfc15183915b522bfa1360e0c9034c24c7630c0da43df35326b53c3c')

prepare() {
    cd jpeg-xl
    git submodule init
    git config --local submodule.third_party/brotli.url "${srcdir}/brotli"
    git config --local submodule.third_party/lodepng.url "${srcdir}/lodepng"
    git config --local submodule.third_party/lcms.url "${srcdir}/Little-CMS"
    git config --local submodule.third_party/googletest.url "${srcdir}/googletest"
    git config --local submodule.third_party/gperftools.url "${srcdir}/gperftools"
    git config --local submodule.third_party/brunsli.url "${srcdir}/brunsli"
    git config --local submodule.third_party/sjpeg.url "${srcdir}/sjpeg"
    git config --local submodule.third_party/skcms.url "${srcdir}/skcms"
    git submodule update
    patch -Np1 -i "${srcdir}/010-libjpeg-xl-git-remove-werror.patch"
    patch -Np1 -i "${srcdir}/020-libjpeg-xl-git-fix-headers-install-path.patch"
    patch -Np1 -i "${srcdir}/030-libjpeg-xl-git-fix-gdk-pixbuf-install-path.patch"
}

pkgver() {
    cd jpeg-xl
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S jpeg-xl \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DJPEGXL_ENABLE_BENCHMARK:BOOL='false' \
        -DJPEGXL_ENABLE_FUZZERS:BOOL='false' \
        -DJPEGXL_ENABLE_PLUGINS:BOOL='false' \
        -DJPEGXL_ENABLE_VIEWERS:BOOL='false' \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 jpeg-xl/plugins/mime/image-x-jxl.xml -t "${pkgdir}/usr/share/mime/packages"
    rm "${pkgdir}/usr/bin/"{cbrunsli,butteraugli_main,decode_and_encode,epf_main,ssimulacra_main,xyb_range}
}
