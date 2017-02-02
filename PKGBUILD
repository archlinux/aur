# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=gimp
pkgname=${_pkgname}-devel
pkgver=2.9.4
pkgrel=1
pkgdesc="GNU Image Manipulation Program (Development version)"
arch=('i686' 'x86_64')
url="http://www.gimp.org/"
license=('GPL' 'LGPL')
depends=('pygtk' 'lcms' 'libxpm' 'libwmf' 'libxmu' 'librsvg' 'libmng' 'dbus-glib'
         'libexif' 'gegl' 'jasper' 'desktop-file-utils' 'hicolor-icon-theme' 'babl'
         'openexr' 'libgudev' 'libgexiv2' 'libmypaint>=1.3.0')
makedepends=('intltool' 'poppler-glib' 'alsa-lib' 'iso-codes' 'curl' 'ghostscript')
optdepends=('gutenprint: for sophisticated printing only as gimp has built-in cups print support'
            'poppler-glib: for pdf support'
            'alsa-lib: for MIDI event controller module'
            'curl: for URI support'
            'ghostscript: for postscript support')
options=('!makeflags')
conflicts=("${_pkgname}")
provides=("${_pkgname}=$pkgver")
source=(http://download.gimp.org/pub/gimp/v${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2 linux.gpl)
sha256sums=('c13ac540fd0bd566d7bdd404afe8a04ec0cb1e547788995cd4e8b218c1057b8a'
            '1003bbf5fc292d0d63be44562f46506f7b2ca5729770da9d38d3bb2e8a2f36b3')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --sysconfdir=/etc \
    --enable-mp --enable-gimp-console --enable-gimp-remote \
    --enable-python --with-gif-compression=lzw --with-libcurl \
    --without-aa --without-hal --without-gvfs --without-gnomevfs
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' "${pkgdir}"/usr/lib/gimp/2.0/plug-ins/*.py
  install -D -m644 "${srcdir}/linux.gpl" "${pkgdir}/usr/share/gimp/2.0/palettes/Linux.gpl"

  #rm "${pkgdir}/usr/share/man/man1/gimp-console-${pkgver%.*}.1"
  ln -s gimp-console-${pkgver%.*}.1.gz "${pkgdir}/usr/share/man/man1/gimp-console.1.gz"
  ln -sf gimptool-2.0.1.gz "${pkgdir}/usr/share/man/man1/gimptool.1.gz"
  ln -s gimp-${pkgver%.*}.1.gz "${pkgdir}/usr/share/man/man1/gimp.1.gz"

  ln -s gimptool-2.0 "${pkgdir}/usr/bin/gimptool"
  ln -s gimp-${pkgver%.*} ${pkgdir}/usr/bin/gimp
  ln -s gimp-console-${pkgver%.*} ${pkgdir}/usr/bin/gimp-console
}

