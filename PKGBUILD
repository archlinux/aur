# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NOTE (1):
# DPS (Display PostScript) feature is obsolete and thus not enabled.
# For more information about DPS being obsolete please visit:
# http://www.x.org/releases/X11R7.7/doc/xorg-docs/graphics/dps.html

# NOTE (2):
# Change font directories bellow to match yours.
# DeJaVu and GhostScript font directories provided bellow are the default ones.
# Windows font directory provided bellow is set according to the example in Arch Linux Wiki.
# This Windows font directory example is for people that copy/link fonts from a Windows
# installation. If you prefer, you can choose an AUR package that provides the Windows fonts
# as described in the Wiki and change the directory accordingly.

_dejavu_font_dir='/usr/share/fonts/TTF'
_gs_font_dir='/usr/share/fonts/Type1'
_windows_font_dir='/usr/share/fonts/WindowsFonts'
_1st_apple_font_dir='/usr/share/fonts/TTF'
_2nd_apple_font_dir='/usr/share/fonts/Type1'
_qdepth='32'

pkgname=imagemagick-full-git
pkgver=7.0.7.0.r12468.g2f8ac2203
pkgrel=1
pkgdesc="An image viewing/manipulation program (Q${_qdepth} HDRI with all libs and features, git version)"
arch=('i686' 'x86_64')
url='http://www.imagemagick.org/'
license=('custom')
depends=(
    # official repositories:
        'libltdl' 'lcms2' 'libxt' 'fontconfig' 'libxext' 'ghostscript'
        'openexr' 'libwmf' 'librsvg' 'libxml2' 'liblqr' 'openjpeg2' 'libraw'
        'opencl-icd-loader' 'libwebp' 'glu'
        'bzip2' 'djvulibre' 'ttf-dejavu' 'fftw' 'freetype2' 'fontconfig'
        'ghostscript' 'gsfonts' 'graphviz' 'jbigkit' 'jemalloc' 'libjpeg-turbo'
        'lcms2' 'libpng' 'libtiff' 'pango' 'perl' 'zlib' 'xz'
    # AUR:
        'autotrace-nomagick' 'flif' 'libfpx' 'libraqm' 'libumem-git'
)
optdepends=(
    # AUR:
        'ttf-mac-fonts: for Apple fonts support'
)
makedepends=('git' 'opencl-headers')
provides=('imagemagick' 'imagemagick7' 'imagemagick-full'
          'imagemagick-git' 'imagemagick-fftw'
          "libMagickCore-${pkgver%%.*}.Q${_qdepth}HDRI.so"
          "libMagickWand-${pkgver%%.*}.Q${_qdepth}HDRI.so"
            "libMagick++-${pkgver%%.*}.Q${_qdepth}HDRI.so")
conflicts=('imagemagick' 'imagemagick7' 'imagemagick-full' 'imagemagick-git'
           'imagemagick-fftw' 'imagemagick-no-hdri')
backup=("etc/ImageMagick-${pkgver%%.*}/coder.xml"
        "etc/ImageMagick-${pkgver%%.*}/colors.xml"
        "etc/ImageMagick-${pkgver%%.*}/delegates.xml"
        "etc/ImageMagick-${pkgver%%.*}/log.xml"
        "etc/ImageMagick-${pkgver%%.*}/magic.xml"
        "etc/ImageMagick-${pkgver%%.*}/mime.xml"
        "etc/ImageMagick-${pkgver%%.*}/policy.xml"
        "etc/ImageMagick-${pkgver%%.*}/quantization-table.xml"
        "etc/ImageMagick-${pkgver%%.*}/thresholds.xml"
        "etc/ImageMagick-${pkgver%%.*}/type.xml"
        "etc/ImageMagick-${pkgver%%.*}/type-dejavu.xml"
        "etc/ImageMagick-${pkgver%%.*}/type-ghostscript.xml"
        "etc/ImageMagick-${pkgver%%.*}/type-windows.xml")
options=('!docs' 'libtool' '!emptydirs')
source=("$pkgname"::'git+https://github.com/ImageMagick/ImageMagick.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    local _version="$(grep 'PACKAGE_VERSION=' version.sh | sed 's/[^0-9\.]*//g')"
    local _release="$(grep 'PACKAGE_RELEASE=' version.sh | sed 's/[^0-9]*//g')"
    local _revision="$(printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")"
    
    printf '%s.%s.%s' "$_version" "$_release" "$_revision"
}

build() {
    cd "$pkgname"
    
    CPPFLAGS='-I/usr/include/FLIF' \
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
        --with-quantum-depth="$_qdepth" \
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
        --with-jbig \
        --with-jpeg \
        --with-lcms \
        --with-openjp2 \
        --with-lqr \
        --with-lzma \
        --with-openexr \
        --with-pango \
        --with-png \
        --with-rsvg \
        --with-tiff \
        --with-webp \
        --with-wmf \
        --with-xml \
        --with-dejavu-font-dir="$_dejavu_font_dir" \
        --with-gs-font-dir="$_gs_font_dir" \
        --with-windows-font-dir="$_windows_font_dir" \
        --with-apple-font-dir="$_1st_apple_font_dir" \
        --with-fontpath="$_2nd_apple_font_dir"
            
    make
}

package() {
    cd "$pkgname"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 NOTICE  "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
    
    # Security fix
    # https://www.imagemagick.org/discourse-server/viewtopic.php?f=4&t=29588
    # https://www.imagetragick.com/
    sed -i '65i\  \<policy domain="coder" rights="none" pattern="EPHEMERAL" />' "${pkgdir}/etc/ImageMagick-${pkgver%%.*}/policy.xml"
    sed -i '66i\  \<policy domain="coder" rights="none" pattern="URL" />'       "${pkgdir}/etc/ImageMagick-${pkgver%%.*}/policy.xml"
    sed -i '67i\  \<policy domain="coder" rights="none" pattern="HTTPS" />'     "${pkgdir}/etc/ImageMagick-${pkgver%%.*}/policy.xml"
    sed -i '68i\  \<policy domain="coder" rights="none" pattern="MVG" />'       "${pkgdir}/etc/ImageMagick-${pkgver%%.*}/policy.xml"
    sed -i '69i\  \<policy domain="coder" rights="none" pattern="MSL" />'       "${pkgdir}/etc/ImageMagick-${pkgver%%.*}/policy.xml"
    sed -i '70i\  \<policy domain="coder" rights="none" pattern="TEXT" />'      "${pkgdir}/etc/ImageMagick-${pkgver%%.*}/policy.xml"
    sed -i '71i\  \<policy domain="coder" rights="none" pattern="SHOW" />'      "${pkgdir}/etc/ImageMagick-${pkgver%%.*}/policy.xml"
    sed -i '72i\  \<policy domain="coder" rights="none" pattern="WIN" />'       "${pkgdir}/etc/ImageMagick-${pkgver%%.*}/policy.xml"
    sed -i '73i\  \<policy domain="coder" rights="none" pattern="PLT" />'       "${pkgdir}/etc/ImageMagick-${pkgver%%.*}/policy.xml"
}
