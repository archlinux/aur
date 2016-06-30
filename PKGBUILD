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
_digest="http://www.imagemagick.org/download/digest.rdf"
_srcname="ImageMagick"
_srcver=$(curl -s "$_digest" | grep -o "${_srcname}-7[0-9\.-]*\.tar\.xz" | sed 's/[^0-9\.-]*//g' | sed -r 's/.//;s/.{2}$//')
_srcverregex=$(echo "$_srcver" | sed 's/\./\\\./g') # translate source version to a regular expression
pkgname=imagemagick-full
pkgver=$(echo "$_srcver" | tr '-' '.')
pkgrel=2
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
conflicts=('imagemagick' 'imagemagick-git' 'imagemagick-full-git' 'imagemagick-fftw' 'imagemagick-no-hdri')
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
source=("http://www.imagemagick.org/download/${_srcname}-${_srcver}.tar.xz")
sha256sums=($(curl -s ${_digest} | grep -A5 "${_srcname}-${_srcverregex}\.tar\.xz" | grep 'sha256' | grep -oE '>[[:alnum:]]*?<' | sed 's/[><]//g'))

build() {
	cd "$_srcname"-"$_srcver"
	
	CPPFLAGS="-I/usr/include/FLIF" \
	./configure \
	        --prefix=/usr \
	        --sysconfdir=/etc \
	        --enable-openmp \
	        --enable-opencl \
	        --enable-largefile \
	        --enable-static=no \
	        --enable-shared=yes \
	        --enable-fast-install=yes \
	        --disable-delegate-build \
	        --enable-cipher \
	        --enable-hdri \
	        --enable-hugepages \
	        --enable-docs \
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
	
	# Security fix
	# https://www.imagemagick.org/discourse-server/viewtopic.php?f=4&t=29588
	# https://imagetragick.com/
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
