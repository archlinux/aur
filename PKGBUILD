# Maintainer: Daniel Bermond < gmail-com: danielbermond >

# NOTE (1):
# DPS (Display PostScript) feature is obsolete and thus not enabled.
# For more information about DPS being obsolete please visit:
# http://www.x.org/releases/X11R7.7/doc/xorg-docs/graphics/dps.html

# NOTE (2):
# change font directories in build() to match yours:
#   - deJaVu and GhostScript font directories are the default ones
#   - Windows font directory is set according to a Wiki example

_commit='e74ed77f5bcd2191b50b4db2b7daeb9f6cd65ed8'
_qdepth='32'

pkgbase=imagemagick-full
pkgname=('libmagick-full' 'imagemagick-full' 'imagemagick-full-doc')
_srcname=ImageMagick
pkgver=7.0.8.19
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="An image viewing/manipulation program (Q${_qdepth} HDRI with all libs and features)"
url='https://www.imagemagick.org/'
license=('custom')
depends=(
    # official repositories:
        'lcms2' 'libraqm' 'liblqr' 'fftw' 'libxml2' 'fontconfig' 'freetype2' 'libxext'
        'libx11' 'bzip2' 'zlib' 'libltdl' 'jemalloc' 'djvulibre' 'libraw' 'graphviz'
        'openexr' 'libheif' 'openjpeg2' 'libjpeg-turbo' 'xz' 'glib2' 'pango' 'cairo'
        'libpng' 'ghostscript' 'ming' 'librsvg' 'libtiff' 'libwebp' 'libwmf' 'ocl-icd'
        'gsfonts' 'ttf-dejavu'
    # AUR:
        'pstoedit-nomagick' 'autotrace-nomagick' 'flif' 'libfpx' 'libumem-git'
)
makedepends=('git' 'perl' 'jbigkit' 'opencl-headers' 'glu' 'ghostpcl' 'ghostxps'
             'zstd' 'chrpath')
source=("git+https://github.com/ImageMagick/ImageMagick.git#commit=${_commit}"
        'imagemagick-full-security-fix.patch'
        'arch-fonts.diff')
sha256sums=('SKIP'
            'e2453381d283c33107194fa791d6b9b2c4c1856afb936d4fa010c05aaebe538e'
            'a85b744c61b1b563743ecb7c7adad999d7ed9a8af816650e3ab9321b2b102e73')

prepare() {
    cd "$_srcname"
    
    # 1) workaround for ghostscript security issues:
    #      https://bugs.archlinux.org/task/59778
    # 2) security fix:
    #      https://www.imagemagick.org/discourse-server/viewtopic.php?f=4&t=29588
    #      https://imagetragick.com/
    patch -Np1 -i "${srcdir}/imagemagick-full-security-fix.patch"
    
    # fix up typemaps to match Arch Linux packages, where possible
    patch -Np1 -i "${srcdir}/arch-fonts.diff"
    
    # fix for 'sh: gitversion.sh: command not found' during autoreconf
    sed -i 's|(gitversion|(./gitversion|' configure.ac
    
    autoreconf -fis
}

build() {
    cd "$_srcname"
    
    export CFLAGS="${CFLAGS} -I/usr/include/FLIF"
    
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
        --with-gslib \
        --with-gvc \
        --with-heic \
        --with-jbig \
        --with-jpeg \
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
   sed -e '/validate-formats/d' -i Makefile # these fail due to the security patch
   
   make check
)

package_libmagick-full() {
    local _majorver="${pkgver%%.*}"
    local _etcdir="ImageMagick-${_majorver}"
    
    pkgdesc+=' (library)'
    optdepends=(
        # AUR:
            'ttf-mac-fonts: for Apple fonts support'
    )
    backup=(etc/"$_etcdir"/{colors,delegates,log,mime,policy,quantization-table,thresholds,type,type-{dejavu,ghostscript}}.xml)
    options=('!emptydirs' 'libtool')
    provides=('libmagick'
              "libMagickCore-${pkgver%%.*}.Q${_qdepth}HDRI.so"
              "libMagickWand-${pkgver%%.*}.Q${_qdepth}HDRI.so"
                "libMagick++-${pkgver%%.*}.Q${_qdepth}HDRI.so")
    conflicts=('libmagick')
    
    cd "$_srcname"
    make DESTDIR="$pkgdir" install
    
    rm "$pkgdir"/usr/lib/*.la
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 NOTICE  -t "${pkgdir}/usr/share/licenses/${pkgname}"
    
    rm -rf binpkg/* docpkg/*
    mkdir -p binpkg/usr/lib {binpkg,docpkg}/usr/share
    
    # split 'imagemagick'
    mv "${pkgdir}/usr/bin"       binpkg/usr/
    mv "${pkgdir}/usr/lib/perl5" binpkg/usr/lib/
    mv "${pkgdir}/usr/share/man" binpkg/usr/share/
    
    # split docs
    mv "${pkgdir}/usr/share/doc" docpkg/usr/share/
}

package_imagemagick-full() {
    depends=("libmagick-full=${pkgver}-${pkgrel}" 'perl')
    optdepends=(
        # AUR:
            'imagemagick-full-doc: manual and API docs'
    )
    provides=('imagemagick')
    conflicts=('imagemagick')
    options=('!emptydirs')
    
    cd "$_srcname"
    
    cp -a binpkg/* "$pkgdir"
    
    find "${pkgdir}/usr/lib/perl5" -name '*.so' -exec chrpath -d {} +
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 NOTICE  -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_imagemagick-full-doc() {
    pkgdesc+=' (manual and API docs)'
    arch=('any')
    depends=()
    provides=('imagemagick-doc')
    conflicts=('imagemagick-doc')
    
    cd "$_srcname"
    
    cp -a docpkg/* "$pkgdir"
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 NOTICE  -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
