# Maintainer: Nick G. <wirlaburla@worlio.com>
# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

_pkgname=gimp
pkgname=${_pkgname}-2
pkgver=2.10.38
pkgrel=7
pkgdesc='GNU Image Manipulation Program'
url='https://www.gimp.org/'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=(
  # Core deps
  'babl' 'cairo' 'fontconfig' 'freetype2' 'gcc-libs' 'gdk-pixbuf2' 'gegl' 'glib2' 'glibc' 'gtk2'
  'harfbuzz' 'hicolor-icon-theme' 'iso-codes' 'json-glib' 'lcms2' 'libgexiv2' 'libmypaint'
  'libunwind' 'mypaint-brushes1' 'pango' 'zlib'

  # Plugins deps
  'bzip2' 'libgudev' 'libheif' 'libjpeg-turbo' 'libjxl' 'libmng' 'libpng' 'librsvg' 'libtiff'
  'libwebp' 'libwmf' 'libx11' 'libxcursor' 'libxext' 'libxfixes' 'libxmu' 'libxpm' 'openexr'
  'openjpeg2' 'poppler-data' 'poppler-glib' 'xz' 'aalib'
)
conflicts=('gimp')
provides=('gimp=2.10.38')
makedepends=('alsa-lib' 'ghostscript' 'gtk-doc' 'gvfs' 'intltool' 'glib2-devel')
optdepends=('alsa-lib: for MIDI event controller module'
            'ghostscript: for PostScript support'
            'gutenprint: for sophisticated printing only as gimp has built-in cups print support'
            'gvfs: for HTTP/S support (and many other schemes)')
install=gimp.install
source=(https://download.gimp.org/pub/gimp/v${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2
        0001-no-check-update.patch
        0002-fix-detection-of-libheif-1.15.0.patch
        0003-typevars.patch
        linux.gpl)
sha256sums=('50a845eec11c8831fe8661707950f5b8446e35f30edfb9acf98f85c1133f856e'
            'ac3e8b44cf391f4ab3050652f2cc1f146f451fb25178d5a596d905f5bad13fcf'
            '24814e981121830242f0a9b7d1da99e7282b247b87b482e2b394cff75b4675ef'
            '58e37c285ada0b40be29580fb8906578913a8e0427b5cea1dd52b1c3b3fe1777'
            '1003bbf5fc292d0d63be44562f46506f7b2ca5729770da9d38d3bb2e8a2f36b3')

prepare() {
  cd ${_pkgname}-${pkgver}

  patch -Np1 < ../0001-no-check-update.patch
  patch -Np1 < ../0002-fix-detection-of-libheif-1.15.0.patch
  patch -Np1 < ../0003-typevars.patch

  autoreconf -fvi -I /usr/share/gettext/m4
}

build() {
  cd ${_pkgname}-${pkgver}

  # oh my god shut UP
  export CFLAGS+=" -std=gnu11 -w -fpermissive -Wno-implicit-function-declaration -Wno-incompatible-pointer-types"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/bin \
    --enable-mp \
    --enable-gimp-console \
    --enable-gtk-doc \
    --disable-check-update \
    --disable-python \
    --with-bug-report-url='https://gitlab.archlinux.org/archlinux/packaging/packages/gimp/-/issues' \
    --with-openexr

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${_pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/linux.gpl" "${pkgdir}/usr/share/gimp/2.0/palettes/Linux.gpl"

  rm "${pkgdir}/usr/share/man/man1/gimp-console.1"
  ln -s gimp-console-${pkgver%.*}.1.gz "${pkgdir}/usr/share/man/man1/gimp-console.1.gz"
  ln -s gimptool-2.0 "${pkgdir}/usr/bin/gimptool"
  ln -sf gimptool-2.0.1.gz "${pkgdir}/usr/share/man/man1/gimptool.1.gz"
}

# vim: ts=2 sw=2 et:
