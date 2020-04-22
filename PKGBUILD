# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libjpeg-xl-git
pkgver=r4.gf84edfb
pkgrel=1
pkgdesc='JPEG XL image format reference implementation (git version)'
arch=('x86_64')
url='https://jpeg.org/jpegxl/'
license=('Apache')
depends=('gcc-libs')
optdepends=('giflib: for CLI tools'
            'gperftools: for CLI tools'
            'libjpeg-turbo: for CLI tools'
            'libpng: for CLI tools'
            'openexr: for CLI tools')
makedepends=('git' 'cmake' 'clang' 'giflib' 'gperftools' 'libjpeg-turbo'
             'libpng' 'openexr' 'zlib' 'libgl' 'freeglut' 'gtest' 'python')
provides=('libjpeg-xl')
conflicts=('libjpeg-xl')
source=('git+https://gitlab.com/wg1/jpeg-xl.git'
        'git+https://github.com/google/brotli.git'
        'git+https://github.com/lvandeve/lodepng.git'
        'git+https://github.com/mm2/Little-CMS.git'
        'git+https://github.com/google/googletest'
        'git+https://github.com/google/brunsli.git'
        'git+https://github.com/webmproject/sjpeg.git'
        'git+https://skia.googlesource.com/skcms.git'
        'git+https://github.com/meganz/mingw-std-threads.git'
        '010-libjpeg-xl-git-remove-werror.patch'
        '020-libjpeg-xl-git-fix-headers-install-path.patch'
        '030-libjpeg-xl-git-fix-gdk-pixbuf-install-path.patch'
        '040-libjpeg-xl-git-fix-highway-build.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '0f538f216f7fca8611efd5d638b521eb2c3b1fb716720afb371f034b3165c90c'
            'c2ea669a2afd94b6582921c893e0b382cd632c12d0a9c2358f955fd6cccffdc3'
            '1666790b92321fbf5859abe50c7355c91b0eddd7381529f35f052e71913c3bf0'
            '4011b3dccad3954d7090c8ab70e615ef23ba29958b888e88ecd85d76eaba7372')

prepare() {
    git -C jpeg-xl submodule init
    git -C jpeg-xl config --local submodule.third_party/brotli.url "${srcdir}/brotli"
    git -C jpeg-xl config --local submodule.third_party/lodepng.url "${srcdir}/lodepng"
    git -C jpeg-xl config --local submodule.third_party/lcms.url "${srcdir}/Little-CMS"
    git -C jpeg-xl config --local submodule.third_party/googletest.url "${srcdir}/googletest"
    git -C jpeg-xl config --local submodule.third_party/brunsli.url "${srcdir}/brunsli"
    git -C jpeg-xl config --local submodule.third_party/sjpeg.url "${srcdir}/sjpeg"
    git -C jpeg-xl config --local submodule.third_party/skcms.url "${srcdir}/skcms"
    git -C jpeg-xl config --local submodule.third_party/mingw-std-threads.url "${srcdir}/mingw-std-threads"
    git -C jpeg-xl submodule update
    patch -d jpeg-xl -Np1 -i "${srcdir}/010-libjpeg-xl-git-remove-werror.patch"
    patch -d jpeg-xl -Np1 -i "${srcdir}/020-libjpeg-xl-git-fix-headers-install-path.patch"
    patch -d jpeg-xl -Np1 -i "${srcdir}/030-libjpeg-xl-git-fix-gdk-pixbuf-install-path.patch"
    patch -d jpeg-xl -Np1 -i "${srcdir}/040-libjpeg-xl-git-fix-highway-build.patch"
}

pkgver() {
    printf 'r%s.g%s' "$(git -C jpeg-xl rev-list --count HEAD)" "$(git -C jpeg-xl rev-parse --short HEAD)"
}

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
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
    rm "${pkgdir}/usr/bin/"{cbrunsli,butteraugli_main,decode_and_encode,epf_main,fuzzer_corpus,ssimulacra_main,xyb_range}
}
