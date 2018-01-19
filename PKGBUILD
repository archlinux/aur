# $Id$
# Maintainer: Yichao Zhou <broken.zhou@gmail.com>

_pkgbase=poppler
pkgbase=poppler-lcdfilter
pkgname=('poppler-lcdfilter' 'poppler-glib-lcdfilter')
pkgver=0.43.0
pkgrel=3
arch=(i686 x86_64)
license=('GPL')
makedepends=('libjpeg' 'gcc-libs' 'cairo' 'fontconfig' 'openjpeg' 'gtk2' 'qt4' 'pkgconfig' 'lcms2' 'gobject-introspection' 'icu' 'qt5-base' 'git' 'python2')
options=('!emptydirs')
url="http://poppler.freedesktop.org/"
source=(http://poppler.freedesktop.org/${_pkgbase}-${pkgver}.tar.xz
        poppler-subpixel.patch)
sha256sums=('SKIP'
         'SKIP')

build() {
  cd ${_pkgbase}-${pkgver}
  patch -Np1 -i ../poppler-subpixel.patch
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --enable-cairo-output \
      --enable-xpdf-headers \
      --enable-libjpeg --enable-zlib \
      --disable-poppler-qt4 \
      --disable-poppler-qt5 \
      --enable-poppler-glib \
      --enable-libopenjpeg=openjpeg2

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool

  make
}

package_poppler-lcdfilter() {
  pkgdesc="PDF rendering library based on xpdf 3.0"
  depends=('libjpeg' 'gcc-libs' 'cairo' 'fontconfig' 'openjpeg2' 'lcms2')
  optdepends=('poppler-data: encoding data to display PDF documents containing CJK characters')
  conflicts=("poppler-qt3<${pkgver}" "poppler")
  provides=("poppler=$pkgver")

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  sed -e 's/^glib_subdir =.*/glib_subdir =/' \
      -e 's/^qt4_subdir =.*/qt4_subdir =/' \
      -e 's/^qt5_subdir =.*/qt5_subdir =/' -i Makefile
  make DESTDIR="${pkgdir}" install
  ln -sr "${pkgdir}"/usr/lib/libpoppler.so.60 "${pkgdir}"/usr/lib/libpoppler.so.63

  rm -f "${pkgdir}"/usr/lib/pkgconfig/poppler-{glib,qt4,qt5}.pc
}

package_poppler-glib-lcdfilter() {
  pkgdesc="Poppler glib bindings"
  depends=("poppler-lcdfilter=${pkgver}" 'glib2')
  conflicts=("poppler-glib")
  provides=("poppler-glib=$pkgver")

  cd "${_pkgbase}-${pkgver}"
  make -C poppler DESTDIR="${pkgdir}" install-libLTLIBRARIES
  make -C glib DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m644 poppler-glib.pc "${pkgdir}/usr/lib/pkgconfig/"
  rm -f "${pkgdir}"/usr/lib/libpoppler.*
  rm -f "${pkgdir}/usr/bin/poppler-glib-demo"
}
