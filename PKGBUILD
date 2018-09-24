# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NOTE (1):
# DPS (Display PostScript) feature is obsolete and thus not enabled.
# For more information about DPS being obsolete please visit:
# http://www.x.org/releases/X11R7.7/doc/xorg-docs/graphics/dps.html

# NOTE (2):
# change font directories bellow to match yours:
#   - deJaVu and GhostScript font directories provided bellow are
#     the default ones
#   - Windows font directory provided bellow is set according to
#     the example in Arch Linux Wiki
#   - this Windows font directory example is for people that
#     copy/link fonts from a Windows installation. If you prefer,
#     you can choose an AUR package that provides the Windows fonts
#     as described in the Wiki and change the directory accordingly.

_dejavu_font_dir='/usr/share/fonts/TTF'
_gs_font_dir='/usr/share/fonts/gsfonts'
_urw_font_dir='/usr/share/fonts/gsfonts'
_windows_font_dir='/usr/share/fonts/WindowsFonts'
_1st_apple_font_dir='/usr/share/fonts/TTF'
_2nd_apple_font_dir='/usr/share/fonts/Type1'
_commit='cb5cf1959c5229389ac57aae11f87f7d7e55c74c'
_qdepth='32'

pkgbase=imagemagick-full
pkgname=('libmagick-full' 'imagemagick-full' 'imagemagick-full-doc')
pkgver=7.0.8.12
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="An image viewing/manipulation program (Q${_qdepth} HDRI with all libs and features)"
url='http://www.imagemagick.org/'
license=('custom')
depends=(
    # official repositories:
        'libltdl' 'lcms2' 'fontconfig' 'libxext' 'liblqr' 'libraqm' 'libpng' 'libxml2'
        'ghostscript' 'gsfonts' 'ttf-dejavu' 'libraw' 'librsvg' 'libwebp' 'libwmf'
        'ocl-icd' 'openexr' 'openjpeg2' 'pango'
        'jemalloc' 'bzip2' 'libx11' 'libsm' 'libice' 'libxt' 'zlib' 'fftw' 'djvulibre'
        'freetype2' 'libheif' 'graphviz' 'jbigkit' 'libjpeg-turbo' 'xz' 'libtiff'
    # AUR:
        'libumem-git' 'autotrace-nomagick' 'flif' 'libfpx'
)
makedepends=('git' 'perl' 'opencl-headers' 'chrpath' 'glu' 'ghostpcl' 'ghostxps')
source=("${pkgbase}-git"::"git+https://github.com/ImageMagick/ImageMagick.git#commit=${_commit}"
        'arch-fonts.diff')
sha256sums=('SKIP'
            'a85b744c61b1b563743ecb7c7adad999d7ed9a8af816650e3ab9321b2b102e73')

prepare() {
    cd "${pkgbase}-git"
    
    # fix for 'sh: gitversion.sh: command not found' during autoreconf
    sed -i 's|(gitversion|(./gitversion|' configure.ac
    
    # fix up typemaps to match Arch Linux packages, where possible
    patch -Np1 -i "${srcdir}/arch-fonts.diff"
}

build() {
    cd "${pkgbase}-git"
    
    export CFLAGS="${CFLAGS} -I/usr/include/FLIF"
    
    autoreconf -fis
    
    ./configure \
        --prefix='/usr' \
        --sysconfdir='/etc' \
        --enable-openmp \
        --enable-opencl \
        --enable-largefile \
        --enable-static='no' \
        --enable-shared='yes' \
        --enable-fast-install='yes' \
        --disable-delegate-build \
        --enable-cipher \
        --enable-hdri \
        --enable-hugepages \
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
        --with-dejavu-font-dir="$_dejavu_font_dir" \
        --with-gs-font-dir="$_gs_font_dir" \
        --with-urw-base35-font-dir="$_urw_font_dir" \
        --with-windows-font-dir="$_windows_font_dir" \
        --with-apple-font-dir="$_1st_apple_font_dir" \
        --with-fontpath="$_2nd_apple_font_dir" \
        PSDelegate='/usr/bin/gs' \
        XPSDelegate='/usr/bin/gxps' \
        PCLDelegate='/usr/bin/gpcl6' \
            
    make
}

package_libmagick-full() {
    local _majorver="${pkgver%%.*}"
    local _etcdir="ImageMagick-${_majorver}"
    
    pkgdesc+=' (library)'
    backup=(etc/"$_etcdir"/{coder,colors,delegates,log,magic,mime,policy,quantization-table,thresholds,type,type-{dejavu,ghostscript}}.xml)
    options=('!emptydirs' 'libtool')
    provides=('libmagick'
              "libMagickCore-${pkgver%%.*}.Q${_qdepth}HDRI.so"
              "libMagickWand-${pkgver%%.*}.Q${_qdepth}HDRI.so"
                "libMagick++-${pkgver%%.*}.Q${_qdepth}HDRI.so")
    conflicts=('libmagick' 'libmagick-fftw' 'libmagick-no-hdri'
               'libmagick-git' 'libmagick-full-git')
    
    cd "${pkgbase}-git"
    make DESTDIR="$pkgdir" install
    
    rm -f "$pkgdir"/usr/lib/*.la
    
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 NOTICE  "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
    
    rm -rf binpkg/* docpkg/*
    
    mkdir -p binpkg/usr/lib {binpkg,docpkg}/usr/share
    
    # split 'imagemagick'
    cd binpkg
    mv -f "${pkgdir}/usr/bin"       usr/
    mv -f "${pkgdir}/usr/lib/perl5" usr/lib/
    mv -f "${pkgdir}/usr/share/man" usr/share/
    
    # split docs
    cd "${srcdir}/${pkgbase}-git/docpkg"
    mv -f "${pkgdir}/usr/share/doc" usr/share/
    
    # security fix
    # https://www.imagemagick.org/discourse-server/viewtopic.php?f=4&t=29588
    # https://imagetragick.com/
    sed -i '65i\  \<policy domain="coder" rights="none" pattern="EPHEMERAL" />' "${pkgdir}/etc/${_etcdir}/policy.xml"
    sed -i '66i\  \<policy domain="coder" rights="none" pattern="URL" />'       "${pkgdir}/etc/${_etcdir}/policy.xml"
    sed -i '67i\  \<policy domain="coder" rights="none" pattern="HTTPS" />'     "${pkgdir}/etc/${_etcdir}/policy.xml"
    sed -i '68i\  \<policy domain="coder" rights="none" pattern="MVG" />'       "${pkgdir}/etc/${_etcdir}/policy.xml"
    sed -i '69i\  \<policy domain="coder" rights="none" pattern="MSL" />'       "${pkgdir}/etc/${_etcdir}/policy.xml"
    sed -i '70i\  \<policy domain="coder" rights="none" pattern="TEXT" />'      "${pkgdir}/etc/${_etcdir}/policy.xml"
    sed -i '71i\  \<policy domain="coder" rights="none" pattern="SHOW" />'      "${pkgdir}/etc/${_etcdir}/policy.xml"
    sed -i '72i\  \<policy domain="coder" rights="none" pattern="WIN" />'       "${pkgdir}/etc/${_etcdir}/policy.xml"
    sed -i '73i\  \<policy domain="coder" rights="none" pattern="PLT" />'       "${pkgdir}/etc/${_etcdir}/policy.xml"
}

package_imagemagick-full() {
    depends=("libmagick-full=${pkgver}-${pkgrel}" 'perl')
    optdepends=(
        # AUR:
            'imagemagick-full-doc: manual and API docs'
            'ttf-mac-fonts: for Apple fonts support'
    )
    options=('!emptydirs')
    provides=('imagemagick' 'imagemagick-fftw')
    conflicts=('imagemagick' 'imagemagick-fftw' 'imagemagick-no-hdri'
               'imagemagick-git' 'imagemagick-full-git')
    
    cd "${pkgbase}-git"
    
    mv -f binpkg/* "$pkgdir"
    
    find "${pkgdir}/usr/lib/perl5" -name '*.so' -exec chrpath -d {} +
    
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 NOTICE  "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}

package_imagemagick-full-doc() {
    pkgdesc+=' (manual and API docs)'
    arch=('any')
    depends=()
    provides=('imagemagick-doc')
    conflicts=('imagemagick-doc' 'imagemagick-git-doc' 'imagemagick-full-doc-git')
    
    cd "${pkgbase}-git"
    
    mv -f docpkg/* "$pkgdir"
    
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 NOTICE  "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
