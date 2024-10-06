# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# DPS (Display PostScript) is obsolete and thus not enabled. See:
# https://www.x.org/releases/X11R7.7/doc/xorg-docs/graphics/dps.html

# Linking to ghostscript libs (gslib) is disabled due to security
# issues. ImageMagick will call 'gs' executable directly instead.
# See: https://bugs.archlinux.org/task/62171

# change font directories in build() to match yours:
#   - deJaVu and GhostScript font directories are the default ones
#   - Windows font directory is set according to a Wiki example

pkgbase=imagemagick-full-git
pkgname=('imagemagick-full-git' 'imagemagick-full-doc-git')
pkgver=7.1.1.39.r2.g0ca37b0de2
pkgrel=1
arch=('x86_64')
_qdepth='32'
pkgdesc="An image viewing/manipulation program (Q${_qdepth} HDRI with all features, git version)"
url='https://www.imagemagick.org/'
license=('LicenseRef-Custom')
makedepends=(
    # official repositories:
        'git'  'perl' 'jbigkit' 'opencl-headers' 'glu' 'ghostpcl' 'ghostxps'
        'zstd' 'chrpath' 'xorgproto'
        'lcms2' 'libraqm' 'liblqr' 'fftw' 'libxml2' 'fontconfig' 'freetype2' 'libxext'
        'libx11' 'bzip2' 'zlib' 'libltdl' 'djvulibre' 'libraw'
        'graphviz' 'openexr' 'libheif' 'openjpeg2' 'libjpeg-turbo' 'xz' 'glib2' 'pango'
        'cairo' 'libpng' 'ghostscript' 'ming' 'librsvg' 'libtiff' 'libwebp' 'libwmf'
        'ocl-icd' 'gsfonts' 'ttf-dejavu' 'perl' 'libzip' 'libjxl' 'gperftools'
        'libultrahdr' 'autotrace-nomagick'
    # AUR:
        'dmalloc' 'flif' 'libfpx' 'libumem-git' 'magickcache-git'
)
source=('git+https://github.com/ImageMagick/ImageMagick.git')
sha256sums=('SKIP')

pkgver() {
    git -C ImageMagick describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd ImageMagick
    export CFLAGS+=' -I/usr/include/FLIF'
    local _perldir
    _perldir="$(perl -V:vendorarch | sed "s/^vendorarch='//;s/'\;$//")"
    
    ./configure \
        --prefix='/usr' \
        --sysconfdir='/etc' \
        --enable-shared \
        --disable-static \
        --enable-openmp \
        --enable-opencl \
        --disable-delegate-build \
        --enable-cipher \
        --enable-hdri \
        --enable-docs \
        --with-dmalloc \
        --with-threads \
        --with-modules \
        --with-quantum-depth="${_qdepth}" \
        --with-magick-plus-plus \
        --with-perl \
        --with-perl-options="INSTALLDIRS=vendor INSTALLVENDORARCH=${_perldir} INSTALLVENDORMAN3DIR=/usr/share/man/man3" \
        --without-jemalloc \
        --without-mtmalloc \
        --with-tcmalloc \
        --with-umem \
        --with-bzlib \
        --with-x \
        --with-zlib \
        --with-zstd \
        --with-autotrace \
        --without-dps \
        --with-fftw \
        --with-flif \
        --with-fpx \
        --with-djvu \
        --with-fontconfig \
        --with-freetype \
        --with-raqm \
        --without-gslib \
        --with-gvc \
        --with-dmr \
        --with-heic \
        --with-jbig \
        --with-jpeg \
        --with-jxl \
        --with-lcms \
        --with-openjp2 \
        --with-lqr \
        --with-lzma \
        --with-openexr \
        --with-pango \
        --with-png \
        --with-raw \
        --with-rsvg \
        --with-tiff \
        --with-uhdr \
        --with-webp \
        --with-wmf \
        --with-xml \
        --with-dejavu-font-dir='/usr/share/fonts/TTF' \
        --with-gs-font-dir='/usr/share/fonts/gsfonts' \
        --with-urw-base35-font-dir='/usr/share/fonts/gsfonts' \
        --with-windows-font-dir='/usr/local/share/fonts/WindowsFonts' \
        --with-apple-font-dir='/usr/share/fonts/TTF' \
        --with-fontpath='/usr/share/fonts/Type1' \
        PSDelegate='/usr/bin/gs' \
        XPSDelegate='/usr/bin/gxps' \
        PCLDelegate='/usr/bin/gpcl6'
        
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

check() {
    make -C ImageMagick check
}

package_imagemagick-full-git() {
    depends=(
         # official repositories:
            'jbigkit' 'lcms2' 'libraqm' 'liblqr' 'fftw' 'libxml2' 'fontconfig' 'freetype2'
            'libxext' 'libx11' 'bzip2' 'zlib' 'libltdl' 'djvulibre' 'libraw'
            'graphviz' 'openexr' 'libheif' 'openjpeg2' 'libjpeg-turbo' 'xz' 'glib2' 'pango'
            'cairo' 'libpng' 'ghostscript' 'ming' 'librsvg' 'libtiff' 'libwebp' 'libwmf'
            'ocl-icd' 'gsfonts' 'ttf-dejavu' 'perl' 'libzip' 'libjxl' 'gperftools'
            'libultrahdr' 'autotrace-nomagick'
        # AUR:
            'dmalloc' 'flif' 'libfpx' 'libumem-git' 'magickcache-git'
    )
    optdepends=('imagemagick-full-doc-git: manual and API docs')
    backup=("etc/ImageMagick-${pkgver%%.*}"/{colors,delegates,log,mime,policy,quantization-table,thresholds,type-{apple,dejavu,ghostscript,urw-base35,windows,}}.xml)
    options=('!emptydirs' 'libtool')
    provides=("imagemagick=${pkgver}" 'imagemagick-git' 'libmagick' 'libmagick-git' 'libmagick-full' 'libmagick-full-git')
    conflicts=('imagemagick' 'libmagick')
    replaces=('libmagick-full-git')
    
    make -C ImageMagick DESTDIR="$pkgdir" install
    find "${pkgdir}/usr/lib/perl5" -name '*.so' -exec chrpath -d {} +
    rm "${pkgdir}/usr/lib"/*.la
    mv "${pkgdir}/usr/share/doc" .
    install -D -m644 ImageMagick/{LICENSE,NOTICE} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_imagemagick-full-doc-git() {
    pkgdesc+=' (manual and API docs)'
    arch=('any')
    provides=("imagemagick-doc=${pkgver}")
    conflicts=('imagemagick-doc')
    
    install -D -m644 ImageMagick/{LICENSE,NOTICE} -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv doc "${pkgdir}/usr/share"
}
