# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=gimp
pkgname=${_pkgname}-devel
pkgver=2.9.6
pkgrel=1
pkgdesc="GNU Image Manipulation Program (Development version)"
arch=('i686' 'x86_64')
url="http://www.gimp.org/"
license=('GPL' 'LGPL')
depends=('pygtk' 'lcms' 'libxpm' 'libwmf' 'libxmu' 'librsvg' 'libmng' 'dbus-glib'
         'libexif' 'gegl>=0.3.20' 'jasper' 'desktop-file-utils' 'hicolor-icon-theme' 'babl>=0.1.30'
         'openexr' 'libgudev' 'libgexiv2' 'libmypaint>=1.3.0' 'libwebp' 'aalib')
makedepends=('intltool' 'poppler-glib' 'alsa-lib' 'iso-codes' 'curl' 'ghostscript' 'gtk-doc')
optdepends=('gutenprint: for sophisticated printing only as gimp has built-in cups print support'
            'poppler-glib: for pdf support'
            'alsa-lib: for MIDI event controller module'
            'curl: for URI support'
            'ghostscript: for postscript support')
options=('!makeflags')
conflicts=("${_pkgname}")
provides=("${_pkgname}=$pkgver")
source=(https://download.gimp.org/pub/gimp/v${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2 linux.gpl)
sha256sums=('b46f31d822a33ab416dcb15e33e10b5b98430814fa34f5ea4036230e845dfc9f'
            '1003bbf5fc292d0d63be44562f46506f7b2ca5729770da9d38d3bb2e8a2f36b3')

prepare() {
  export PYTHON=/usr/bin/python2
  cd "${srcdir}/${_pkgname}-${pkgver}"
  _mypaintver=$( ls /usr/lib/libmypaint-*.so | grep -o -E '\-[0-9]+(\.[0-9]+)*' | head -1 )
  sed -i "s:\(libmypaint\)\( >= libmypaint_required_version\):\1${_mypaintver}\2:g" configure.ac
  
  autoreconf -vi
  # python2 fixes
  sed -i 's:PYTHON=python$:&2:' plug-ins/pygimp/py-compile
  find ./plug-ins -type f -name *py -exec \
    sed -i 's|#!.*python$|&2|' '{}' \;
}
  
build() {
  export PYTHON=/usr/bin/python2
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-mp \
    --enable-gimp-console \
    --enable-gimp-remote \
    --enable-python \
    --enable-gtk-doc
  make
}

package() {
  export PYTHON=/usr/bin/python2
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/linux.gpl" "${pkgdir}/usr/share/gimp/2.0/palettes/Linux.gpl"

  #rm "${pkgdir}/usr/share/man/man1/gimp-console-${pkgver%.*}.1"
  ln -s gimp-console-${pkgver%.*}.1.gz "${pkgdir}/usr/share/man/man1/gimp-console.1.gz"
  ln -sf gimptool-2.0.1.gz "${pkgdir}/usr/share/man/man1/gimptool.1.gz"
  ln -s gimp-${pkgver%.*}.1.gz "${pkgdir}/usr/share/man/man1/gimp.1.gz"

  ln -s gimptool-2.0 "${pkgdir}/usr/bin/gimptool"
  ln -s gimp-${pkgver%.*} ${pkgdir}/usr/bin/gimp
  ln -s gimp-console-${pkgver%.*} ${pkgdir}/usr/bin/gimp-console
}

