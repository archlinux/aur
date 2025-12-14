# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# DPS (Display PostScript) is obsolete and thus not enabled. See:
# https://www.x.org/releases/X11R7.7/doc/xorg-docs/graphics/dps.html

# Linking to ghostscript libs (gslib) is disabled due to security
# issues. ImageMagick will call 'gs' executable directly instead.
# See: https://bugs.archlinux.org/task/62171

# change font directories in build() to match yours:
#   - deJaVu and GhostScript font directories are the default ones
#   - Windows font directory is set according to a Wiki example

pkgbase=imagemagick-full
pkgname=('imagemagick-full' 'imagemagick-full-doc')
pkgver=7.1.2.11
pkgrel=1
arch=('x86_64')
_qdepth='32'
pkgdesc="An image viewing/manipulation program (Q${_qdepth} HDRI with all possible features)"
url='https://www.imagemagick.org/'
license=('ImageMagick')
makedepends=(
    'autotrace-nomagick'
    'bzip2'
    'cairo'
    'chrpath'
    'djvulibre'
    'dmalloc'
    'fftw'
    'flif'
    'fontconfig'
    'freetype2'
    'ghostscript'
    'glib2'
    'glu'
    'gperftools'
    'graphviz'
    'gsfonts'
    'jbigkit'
    'lcms2'
    'libfpx'
    'libheif'
    'libjpeg-turbo'
    'libjxl'
    'liblqr'
    'libltdl'
    'libpng'
    'libraqm'
    'libraw'
    'librsvg'
    'libtiff'
    'libultrahdr'
    'libumem-git'
    'libwebp'
    'libwmf'
    'libx11'
    'libxext'
    'libxml2'
    'libzip'
    'magickcache-git'
    'ming'
    'ocl-icd'
    'opencl-headers'
    'openexr'
    'openjpeg2'
    'pango'
    'perl'
    'pstoedit-nomagick'
    'ttf-dejavu'
    'xorgproto'
    'xz'
    'zlib'
    'zstd')
source=("https://imagemagick.org/archive/releases/ImageMagick-${pkgver%.*}-${pkgver##*.}.tar.lz"{,.asc})
sha256sums=('86835703c1d321e9c99e9d58915cdfc108db5ce26a6973c989871325b6676405'
            'SKIP')
validpgpkeys=('D8272EF51DA223E4D05B466989AB63D48277377A')  # Lexie Parsimoniae

build() {
    cd "ImageMagick-${pkgver%.*}-${pkgver##*.}"
    export CFLAGS+=' -I/usr/include/FLIF'
    local _perldir
    _perldir="$(perl -V:vendorarch | sed "s/^vendorarch='//;s/'\;$//")"
    
    ./configure \
        --prefix='/usr' \
        --sysconfdir='/etc' \
        \
        --disable-delegate-build \
        --enable-shared \
        --disable-static \
        \
        --enable-64bit-channel-masks \
        --enable-cipher \
        --enable-docs \
        --enable-hdri \
        --enable-openmp \
        --enable-opencl \
        \
        --with-magick-plus-plus \
        --with-modules \
        --with-quantum-depth="${_qdepth}" \
        \
        --with-autotrace \
        --with-bzlib \
        --with-dejavu-font-dir='/usr/share/fonts/TTF' \
        --with-djvu \
        --with-dmalloc \
        --with-dmr \
        --without-dps \
        --with-fftw \
        --with-flif \
        --with-fontconfig \
        --with-fpx \
        --with-freetype \
        --without-gslib \
        --with-gvc \
        --with-heic \
        --with-jbig \
        --without-jemalloc \
        --with-jpeg \
        --with-jxl \
        --with-lcms \
        --with-lqr \
        --with-lzma \
        --without-mtmalloc \
        --with-openexr \
        --with-openjp2 \
        --with-pango \
        --with-perl \
        --with-perl-options="INSTALLDIRS=vendor INSTALLVENDORARCH=${_perldir} INSTALLVENDORMAN3DIR=/usr/share/man/man3" \
        --with-png \
        --with-raqm \
        --with-raw \
        --with-rsvg \
        --with-tcmalloc \
        --with-threads \
        --with-tiff \
        --with-uhdr \
        --with-umem \
        --with-webp \
        --with-wmf \
        --with-x \
        --with-xml \
        --with-zlib \
        --with-zstd \
        \
        --with-apple-font-dir='/usr/share/fonts/TTF' \
        --with-fontpath='/usr/share/fonts/Type1' \
        --with-gs-font-dir='/usr/share/fonts/gsfonts' \
        --with-urw-base35-font-dir='/usr/share/fonts/gsfonts' \
        --with-urw-base35-type1-font-dir='/usr/share/fonts/gsfonts' \
        --with-windows-font-dir='/usr/local/share/fonts/WindowsFonts' \
        PSDelegate='/usr/bin/gs'
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

check() {
    make -C "ImageMagick-${pkgver%.*}-${pkgver##*.}" check
}

package_imagemagick-full() {
    depends=(
        'autotrace-nomagick'
        'bzip2'
        'cairo'
        'djvulibre'
        'fftw'
        'flif'
        'fontconfig'
        'freetype2'
        'gcc-libs'
        'ghostscript'
        'glib2'
        'glibc'
        'gperftools'
        'graphviz'
        'gsfonts'
        'jbigkit'
        'lcms2'
        'libfpx'
        'libheif'
        'libjpeg-turbo'
        'libjxl'
        'liblqr'
        'libltdl'
        'libpng'
        'libraqm'
        'libraw'
        'librsvg'
        'libtiff'
        'libultrahdr'
        'libwebp'
        'libwmf'
        'libx11'
        'libxext'
        'libxml2'
        'libzip'
        'ming'
        'magickcache-git'
        'ocl-icd'
        'openexr'
        'openjpeg2'
        'pango'
        'pstoedit-nomagick'
        'perl'
        'sh'
        'ttf-dejavu'
        'xz'
        'zlib')
    optdepends=(
        'imagemagick-full-doc: manual and API docs')
    backup=(
        "etc/ImageMagick-${pkgver%%.*}/colors.xml"
        "etc/ImageMagick-${pkgver%%.*}/delegates.xml"
        "etc/ImageMagick-${pkgver%%.*}/log.xml"
        "etc/ImageMagick-${pkgver%%.*}/mime.xml"
        "etc/ImageMagick-${pkgver%%.*}/policy.xml"
        "etc/ImageMagick-${pkgver%%.*}/quantization-table.xml"
        "etc/ImageMagick-${pkgver%%.*}/thresholds.xml"
        "etc/ImageMagick-${pkgver%%.*}/type-apple.xml"
        "etc/ImageMagick-${pkgver%%.*}/type-dejavu.xml"
        "etc/ImageMagick-${pkgver%%.*}/type-ghostscript.xml"
        "etc/ImageMagick-${pkgver%%.*}/type-urw-base35.xml"
        "etc/ImageMagick-${pkgver%%.*}/type-windows.xml")
    options=('!emptydirs' 'libtool')
    provides=("imagemagick=${pkgver}" "libmagick=${pkgver}" "libmagick-full=${pkgver}")
    conflicts=('imagemagick' 'libmagick')
    replaces=('libmagick-full')
    
    make -C "ImageMagick-${pkgver%.*}-${pkgver##*.}" DESTDIR="$pkgdir" install
    find "${pkgdir}/usr/lib/perl5" -name '*.so' -exec chrpath -d {} +
    rm "${pkgdir}/usr/lib"/*.la
    mv "${pkgdir}/usr/share/doc" .
    install -D -m644 "ImageMagick-${pkgver%.*}-${pkgver##*.}"/{LICENSE,NOTICE} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_imagemagick-full-doc() {
    pkgdesc+=' (manual and API docs)'
    arch=('any')
    provides=("imagemagick-doc=${pkgver}")
    conflicts=('imagemagick-doc')
    
    install -D -m644 "ImageMagick-${pkgver%.*}-${pkgver##*.}"/{LICENSE,NOTICE} -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv doc "${pkgdir}/usr/share"
}
