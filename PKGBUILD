# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# brush-max-512: Ernesto Bazzano <bazza@riseup.net>

pkgname=gimp-brush-max-512
_pkgname=gimp
pkgver=2.10.30
pkgrel=1
pkgdesc='Gimp with easy-to-handle tool sizes'
url='https://www.gimp.org/'
arch=('x86_64')
license=('GPL' 'LGPL')
depends=('babl' 'dbus-glib' 'desktop-file-utils' 'gegl' 'glib-networking' 'hicolor-icon-theme'
         'openjpeg2' 'lcms2' 'libheif' 'libexif' 'libgudev' 'libmng' 'libmypaint' 'librsvg' 'libwebp'
         'libwmf' 'libxmu' 'libxpm' 'mypaint-brushes1' 'openexr' 'poppler-data' 'gtk2' 'graphviz')
makedepends=('alsa-lib' 'curl' 'ghostscript' 'gtk-doc' 'intltool' 'iso-codes' 'poppler-glib')
optdepends=('gutenprint: for sophisticated printing only as gimp has built-in cups print support'
            'poppler-glib: for pdf support'
            'alsa-lib: for MIDI event controller module'
            'curl: for URI support'
            'ghostscript: for postscript support')
conflicts=('gimp')
provides=("${_pkgname}=${pkgver}")
replaces=('gimp-plugin-wavelet-decompose')
install=gimp.install
source=(https://download.gimp.org/pub/gimp/v${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2
        0001-no-check-update.patch
        linux.gpl)
sha256sums=('88815daa76ed7d4277eeb353358bafa116cd2fcd2c861d95b95135c1d52b67dc'
            'ac3e8b44cf391f4ab3050652f2cc1f146f451fb25178d5a596d905f5bad13fcf'
            '1003bbf5fc292d0d63be44562f46506f7b2ca5729770da9d38d3bb2e8a2f36b3')

prepare() {
  cd ${_pkgname}-${pkgver}

  patch -Np1 < ../0001-no-check-update.patch
  autoreconf -vi
}

build() {
pkg-config --exists --print-errors "OpenEXR >= 1.6.1"
  cd ${_pkgname}-${pkgver}
  PYTHON=/usr/bin/python2 ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/bin \
    --enable-mp \
    --enable-gimp-console \
    --enable-gtk-doc \
    --disable-check-update \
    --disable-python \
    --with-bug-report-url='https://bugs.archlinux.org/?string=gimp' \
    --with-openexr \
    --without-aa
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  sed -i 's/#define GIMP_BRUSH_MAX_SIZE 10000/#define GIMP_BRUSH_MAX_SIZE 512/' app/core/gimpbrush-header.h
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
