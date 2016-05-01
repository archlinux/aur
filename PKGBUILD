# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# ImageMagick compiled with all features and delegate libraries.
# Using quantum depth 32 (Q32) and HDRI.
# NOTE: DPS (Display PostScript) feature is obsolete and thus not enabled.
# For more information about DPS being obsolete please visit:
# http://www.x.org/releases/X11R7.7/doc/xorg-docs/graphics/dps.html

# NOTE:
# Change font directories bellow to match yours.
# DeJaVu and GhostScript font directories provided bellow are the default ones.
# Windows font directory provided bellow is set according to the example in Arch Linux Wiki.

_dejavu_font_dir="/usr/share/fonts/TTF"
_gs_font_dir="/usr/share/fonts/Type1"
_windows_font_dir="/usr/share/fonts/WindowsFonts"
_srcname="ImageMagick"
_srcver="7.0.1-0"
pkgname=imagemagick-full
pkgver="$(echo ${_srcver} | tr '-' '.')"
pkgrel=1
pkgdesc="An image viewing/manipulation program (Q32 HDRI with all libs and features)"
arch=('i686' 'x86_64')
url="http://www.imagemagick.org/"
license=('custom')
depends=('jemalloc' 'bzip2' 'libx11' 'libxext' 'libxt' 'libsm' 'zlib' 'autotrace-nomagick' 'fftw' 'flif-git'
         'libfpx' 'djvulibre' 'fontconfig' 'freetype2' 'libraqm' 'ghostscript' 'gsfonts' 'graphviz'
         'jbigkit' 'libjpeg-turbo' 'lcms' 'lcms2' 'openjpeg2' 'liblqr' 'xz' 'openexr' 'pango' 'libpng' 
         'librsvg' 'libtiff' 'libwebp' 'libwmf' 'libxml2' 'libmpeg2' 'opencl-headers' 'ocl-icd')
provides=("imagemagick"
          "libMagickCore-${pkgver%%.*}.Q32HDRI.so"
          "libMagickWand-${pkgver%%.*}.Q32HDRI.so"
            "libMagick++-${pkgver%%.*}.Q32HDRI.so")
conflicts=('imagemagick' 'imagemagick-git' 'imagemagick-fftw' 'imagemagick-no-hdri')
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
source=("http://www.imagemagick.org/download/${_srcname}-${_srcver}.tar.xz"
        "$_srcname"-"$_srcver"-opencl-compile-fix.patch::"http://git.imagemagick.org/repos/ImageMagick/commit/5e3914efb87b8969148283629add8be3978914e1.diff")
sha256sums=('bd15aaef2aa2393b3d62b821f5752d5f4066a90d3b0d9259d93217ad47c056d9'
            '67784eeb0b884bbf1f8cda9ea77194cacb6a56f58d95aba8a0dad50aa0c0f4dd')

prepare() {
	cd "$_srcname"-"$_srcver"
	patch -p1 -i "${srcdir}/${_srcname}-${_srcver}-opencl-compile-fix.patch"
}

build() {
	cd "$_srcname"-"$_srcver"
	
	CPPFLAGS="-I/usr/include/FLIF" \
	./configure \
	        --prefix=/usr \
	        --sysconfdir=/etc \
	        --enable-static=no \
	        --enable-shared=yes \
	        --enable-fast-install=yes \
	        --enable-openmp \
	        --enable-opencl \
	        --enable-largefile \
	        --enable-cipher \
	        --enable-hdri \
	        --enable-hugepages \
	        --enable-docs \
	        --disable-delegate-build \
	        --with-threads \
	        --with-modules \
	        --with-quantum-depth=32 \
	        --with-magick-plus-plus \
	        --with-perl \
	        --with-perl-options="INSTALLDIRS=vendor" \
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
	        --with-windows-font-dir="$_windows_font_dir"
	        
	make
}

package() {
	cd "$_srcname"-"$_srcver"
	
	make -j1 DESTDIR="$pkgdir/" install
	
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 NOTICE  "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
