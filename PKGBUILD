# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# NOTE (1):
# DPS (Display PostScript) feature is obsolete and thus not enabled.
# For more information about DPS being obsolete please visit:
# http://www.x.org/releases/X11R7.7/doc/xorg-docs/graphics/dps.html

# NOTE (2): linking to ghostscript libs (gslib) is disabled due to
# security issues. ImageMagick will call 'gs' executable directly
# instead. See: https://bugs.archlinux.org/task/62171

# NOTE (3):
# change font directories in build() to match yours:
#   - deJaVu and GhostScript font directories are the default ones
#   - Windows font directory is set according to a Wiki example

_commit='19106ce7c906d5a551ce204efa00f9b0caa359e9'
_qdepth='32'

pkgbase=imagemagick-full
pkgname=('imagemagick-full' 'imagemagick-full-doc')
_srcname=ImageMagick
pkgver=7.0.10.1
pkgrel=1
arch=('x86_64')
pkgdesc="An image viewing/manipulation program (Q${_qdepth} HDRI with all features)"
url='https://www.imagemagick.org/'
license=('custom')
makedepends=(
    # official repositories:
        'git' 'perl' 'jbigkit' 'opencl-headers' 'glu' 'ghostpcl' 'ghostxps'
        'zstd' 'chrpath' 'xorgproto'
        'lcms2' 'libraqm' 'liblqr' 'fftw' 'libxml2' 'fontconfig' 'freetype2' 'libxext'
        'libx11' 'bzip2' 'zlib' 'libltdl' 'jemalloc' 'djvulibre' 'gperftools' 'libraw'
        'graphviz' 'openexr' 'libheif' 'openjpeg2' 'libjpeg-turbo' 'xz' 'glib2' 'pango'
        'cairo' 'libpng' 'ghostscript' 'ming' 'librsvg' 'libtiff' 'libwebp' 'libwmf'
        'ocl-icd' 'gsfonts' 'ttf-dejavu' 'perl'
    # AUR:
        'pstoedit-nomagick' 'autotrace-nomagick' 'flif' 'libfpx' 'libumem-git'
        'brunsli'
)
source=("git+https://github.com/ImageMagick/ImageMagick.git#commit=${_commit}"
        'arch-fonts.diff')
sha256sums=('SKIP'
            'a85b744c61b1b563743ecb7c7adad999d7ed9a8af816650e3ab9321b2b102e73')

prepare() {
    cd "$_srcname"
    
    mkdir -p docpkg/usr/share
    
    # fix up typemaps to match Arch Linux packages, where possible
    patch -Np1 -i "${srcdir}/arch-fonts.diff"
    
    # fix for 'sh: gitversion.sh: command not found' during autoreconf
    sed -i 's|(gitversion|(./gitversion|' configure.ac
    
    autoreconf -fis
}

build() {
    cd "$_srcname"
    
    export CFLAGS+=' -I/usr/include/FLIF'
    
    ./configure \
        --prefix='/usr' \
        --sysconfdir='/etc' \
        --enable-openmp \
        --enable-opencl \
        --disable-delegate-build \
        --enable-cipher \
        --enable-hdri \
        --enable-docs \
        --with-threads \
        --with-modules \
        --with-quantum-depth="${_qdepth}" \
        --with-magick-plus-plus \
        --with-perl \
        --with-perl-options='INSTALLDIRS=vendor' \
        --with-jemalloc \
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
        --with-webp \
        --with-wmf \
        --with-xml \
        --with-dejavu-font-dir='/usr/share/fonts/TTF' \
        --with-gs-font-dir='/usr/share/fonts/gsfonts' \
        --with-urw-base35-font-dir='/usr/share/fonts/gsfonts' \
        --with-windows-font-dir='/usr/share/fonts/WindowsFonts' \
        --with-apple-font-dir='/usr/share/fonts/TTF' \
        --with-fontpath='/usr/share/fonts/Type1' \
        PSDelegate='/usr/bin/gs' \
        XPSDelegate='/usr/bin/gxps' \
        PCLDelegate='/usr/bin/gpcl6'
        
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    
    make
}

check() (
    cd "$_srcname"
    ulimit -n 4096
    sed -e '/validate-formats/d' -i Makefile
    make check
)

package_imagemagick-full() {
    local _majorver="${pkgver%%.*}"
    local _etcdir="ImageMagick-${_majorver}"
    depends=(
        # official repositories:
            'lcms2' 'libraqm' 'liblqr' 'fftw' 'libxml2' 'fontconfig' 'freetype2' 'libxext'
            'libx11' 'bzip2' 'zlib' 'libltdl' 'jemalloc' 'gperftools' 'djvulibre' 'libraw'
            'graphviz' 'openexr' 'libheif' 'openjpeg2' 'libjpeg-turbo' 'xz' 'glib2' 'pango'
            'cairo' 'libpng' 'ghostscript' 'ming' 'librsvg' 'libtiff' 'libwebp' 'libwmf'
            'ocl-icd' 'gsfonts' 'ttf-dejavu' 'perl'
        # AUR:
            'pstoedit-nomagick' 'autotrace-nomagick' 'flif' 'libfpx' 'libumem-git'
            'brunsli'
    )
    optdepends=(
        # AUR:
            'imagemagick-full-doc: manual and API docs'
    )
    backup=(etc/"$_etcdir"/{colors,delegates,log,mime,policy,quantization-table,thresholds,type,type-{dejavu,ghostscript}}.xml)
    options=('!emptydirs' 'libtool')
    provides=("imagemagick=${pkgver}" "libmagick=${pkgver}" "libmagick-full=${pkgver}")
    conflicts=('imagemagick' 'libmagick')
    replaces=('libmagick-full')
    
    cd "$_srcname"
    make DESTDIR="$pkgdir" install
    
    find "${pkgdir}/usr/lib/perl5" -name '*.so' -exec chrpath -d {} +
    rm "$pkgdir"/usr/lib/*.la
    
    # split docs
    mv "${pkgdir}/usr/share/doc" docpkg/usr/share/
    
    # harden security policy: https://bugs.archlinux.org/task/62785
    sed -e '/<\/policymap>/i \ \ <policy domain="delegate" rights="none" pattern="gs" \/>' -i "${pkgdir}/etc/ImageMagick-7/policy.xml"
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 NOTICE  -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_imagemagick-full-doc() {
    pkgdesc+=' (manual and API docs)'
    arch=('any')
    provides=("imagemagick-doc=${pkgver}")
    conflicts=('imagemagick-doc')
    
    cd "$_srcname"
    
    cp -a docpkg/* "$pkgdir"
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 NOTICE  -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
