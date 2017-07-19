# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel Bermond < yahoo-com: danielbermond >

# ImageMagick compiled with all features and delegate libraries.
# Using quantum depth 32 (Q32) and HDRI.
# NOTE: DPS (Display PostScript) feature is obsolete and thus not enabled.
# For more information about DPS being obsolete please visit:
# http://www.x.org/releases/X11R7.7/doc/xorg-docs/graphics/dps.html

# NOTE:
# Change font directories bellow to match yours.
# DeJaVu and GhostScript font directories provided bellow are the default ones.
# Windows font directory provided bellow is set according to the example in Arch Linux Wiki.
# This Windows font directory example is for people that copy/link fonts from a Windows
# installation. If you prefer, you can choose an AUR package that provides the Windows fonts
# as described in the Wiki and change the directory accordingly.
# Apple fonts through AUR package 'tff-mac-fonts' are optional due to licensing issues. It
# places fonts in directories '/usr/share/fonts/TTF' and '/usr/share/fonts/Type1'.

_dejavu_font_dir="/usr/share/fonts/TTF"
_gs_font_dir="/usr/share/fonts/Type1"
_windows_font_dir="/usr/share/fonts/WindowsFonts"
_1st_apple_font_dir="/usr/share/fonts/TTF"
_2nd_apple_font_dir="/usr/share/fonts/Type1"
_digest="http://www.imagemagick.org/download/digest.rdf"
_srcname="ImageMagick"
_srcver="$(curl -s "$_digest" | grep -o "${_srcname}-7[0-9\.-]*\.tar\.xz" | \
                                sed 's/[^0-9\.-]*//g'                     | \
                                sed -r 's/.//;s/.{2}$//'                  | \
                                sort -r                                   | \
                                head -n1)"
_srcverregex="$(echo "$_srcver" | sed 's/\./\\\./g')" # translate to a regular expression
pkgname=imagemagick7
pkgver="$(echo "$_srcver"| tr '-' '.')"
pkgrel=1
pkgdesc="An image viewing/manipulation program (_just_ the new magick binary from IM7, all others IM6)"
arch=('i686' 'x86_64')
url="http://www.imagemagick.org/"
license=('custom')
depends=('jemalloc' 'bzip2' 'libx11' 'libxext' 'libxt' 'libsm' 'zlib'
         'autotrace-nomagick' 'fftw' 'flif-git' 'libfpx' 'djvulibre'
         'ttf-dejavu' 'fontconfig' 'freetype2' 'libraqm' 'ghostscript'
         'gsfonts' 'graphviz' 'jbigkit' 'libjpeg-turbo' 'lcms' 'lcms2'
         'openjpeg2' 'liblqr' 'xz' 'openexr' 'pango' 'libpng' 'librsvg'
         'libtiff' 'libwebp' 'libwmf' 'libxml2' 'libmpeg2'
         'opencl-icd-loader' 'imagemagick')
optdepends=('ttf-mac-fonts: for Apple fonts support')
makedepends=('opencl-headers')
provides=("imagemagick"
          "libMagickCore-${pkgver%%.*}.Q32HDRI.so"
          "libMagickWand-${pkgver%%.*}.Q32HDRI.so"
            "libMagick++-${pkgver%%.*}.Q32HDRI.so")
conflicts=('imagemagick-full' 'imagemagick-full-git' 'imagemagick-full-doc-git' 'imagemagick-full-doc')
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
sha256sums=("$(curl -s ${_digest} | grep -A5 "${_srcname}-${_srcverregex}\.tar\.xz" | \
                                    grep 'sha256'                                   | \
                                    grep -oE '>[[:alnum:]]*?<'                      | \
                                    sed 's/[><]//g')")

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
	        --enable-delegate-build=no \
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
	        --with-windows-font-dir="$_windows_font_dir" \
	        --with-apple-font-dir="$_1st_apple_font_dir" \
	        --with-fontpath="$_2nd_apple_font_dir"

	make
}

package() {
	cd "$_srcname"-"$_srcver"

	make DESTDIR="$pkgdir/" install

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 NOTICE  "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"

    # strip everything except the magick command, well let IM6 handle these
    for im6cmd in animate compare composite conjure convert display identify import mogrify montage stream Magick++-config MagickCore-config MagickWand-config; do
        find ${pkgdir} -name ${im6cmd} -delete
        find ${pkgdir} -name ${im6cmd}.1.gz -delete
    done
    find ${pkgdir} -name ImageMagick.pc -delete
    find ${pkgdir} -name Magick++.pc -delete
    find ${pkgdir} -name MagickCore.pc -delete
    find ${pkgdir} -name MagickWand.pc -delete
    find ${pkgdir} -name Magick.pm -delete
    find ${pkgdir} -name Image::Magick.3pm.gz -delete
}
