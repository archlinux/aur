# Maintainer: Jay Man <jhollis.ga@gmail.com>

pkgname=imagemagick-essentials-git
pkgver=7.1.2.18.37.g2ab24d7486
pkgrel=1
pkgdesc="ImageMagick 7 built from source with HDRI, OpenCL, jemalloc, and comprehensive format/delegate support"
arch=('x86_64')
url="https://github.com/ImageMagick/ImageMagick"
license=('ImageMagick')
provides=('imagemagick' 'libmagick')
conflicts=('imagemagick')
replaces=('imagemagick')

depends=(
    'bzip2'
    'cairo'
    'fftw'
    'fontconfig'
    'freetype2'
    'ghostscript'
    'glib2'
    'glibc'
    'graphviz'
    'jemalloc'
    'lcms2'
    'libheif'
    'libjpeg-turbo'
    'liblqr'
    'libltdl'
    'libpng'
    'libraqm'
    'librsvg'
    'libtiff'
    'libwebp'
    'libxext'
    'libxml2'
    'ocl-icd'
    'openjpeg2'
    'perl'
    'xz'
    'zlib'
)

makedepends=(
    'git'
    'opencl-headers'
    'pkg-config'
)

optdepends=(
    'djvulibre: DJVU support'
    'jbigkit: JBIG support'
    'libjxl: JPEG XL support'
    'libraw: DNG support'
    'libultrahdr: UHDR support'
    'libwmf: WMF support'
    'libzip: OpenRaster support'
    'openexr: OpenEXR support'
    'pango: Text rendering support'
    'ttf-dejavu: DejaVu font family'
    'gsfonts: Ghostscript fonts'
)

source=("${pkgname}::git+https://github.com/ImageMagick/ImageMagick.git")
sha256sums=('SKIP')

install="${pkgname}.install"

pkgver() {
    cd "${pkgname}" || return 1
    git describe --tags --long 2>/dev/null | sed 's/^[vV]//;s/-/./g'
}

build() {
    cd "${pkgname}" || return 1

    autoreconf -fi

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-delegate-build \
        --enable-hdri \
        --enable-hugepages \
        --enable-legacy-support \
        --enable-opencl \
        --with-dejavu-font-dir=/usr/share/fonts/TTF \
        --with-gs-font-dir=/usr/share/fonts/gsfonts \
        --with-fontpath=/usr/share/fonts/TTF \
        --with-gslib \
        --with-gvc \
        --with-heic \
        --with-jemalloc \
        --with-modules \
        --with-perl \
        --with-pic \
        --with-png \
        --with-quantum-depth=16 \
        --with-rsvg \
        --with-utilities \
        --without-autotrace \
        CFLAGS="${CFLAGS} -DCL_TARGET_OPENCL_VERSION=300" \
        CXXFLAGS="${CXXFLAGS} -DCL_TARGET_OPENCL_VERSION=300" \
        CPPFLAGS="${CPPFLAGS} -DCL_TARGET_OPENCL_VERSION=300"

    make -j"$(nproc)"
}

package() {
    cd "${pkgname}" || return 1
    make DESTDIR="${pkgdir}" install

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Fix perl module path - move from vendor-specific to site
    local _perlver
    _perlver=$(perl -e 'print $^V' | sed 's/^v//')

    if [[ -d "${pkgdir}/usr/lib/perl5/${_perlver}" ]]; then
        find "${pkgdir}/usr/lib/perl5" -name '*.pod' -delete
        find "${pkgdir}/usr/lib/perl5" -empty -type d -delete
    fi
}
