# Maintainer: Jeffrey Feng <galago1992@gmail.com>

pkgbase=poppler-lcd
pkgname=('poppler-lcd' 'poppler-glib-lcd' 'poppler-qt5-lcd' 'poppler-qt6-lcd')
pkgver=21.10.0
pkgrel=1
arch=(x86_64)
license=('GPL')
makedepends=('libjpeg' 'gcc-libs' 'cairo' 'fontconfig' 'openjpeg2' 'gtk3' 'pkgconfig' 'lcms2' 
             'gobject-introspection' 'icu' 'qt5-base' 'qt6-base' 'git' 'nss' 'gtk-doc' 'curl' 'poppler-data'
             'cmake' 'python' 'boost') 
options=('!emptydirs')
url="https://github.com/jonathanffon/poppler-lcd-patch"
_commit=e72e61af5098882f16cfc0bbe187ba497d6ccaa1
source=("https://poppler.freedesktop.org/poppler-${pkgver}.tar.xz"
        "git+https://github.com/jonathanffon/poppler-lcd-patch#commit=${_commit}")
sha256sums=('964b5b16290fbec3fae57c2a5bcdea49bb0736bd750c3a3711c47995c9efc394'
            'SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd poppler-${pkgver}
  for patch in `ls ../poppler-lcd-patch/*.patch`; do
    patch -p1<$patch
  done
  cd ../build
  cmake ../poppler-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
    -DENABLE_GTK_DOC=ON
  make
}

package_poppler-lcd() {
  pkgdesc="PDF rendering library based on xpdf 3.0 with subpixel patch on LCD display"
  depends=('libjpeg' 'gcc-libs' 'cairo' 'fontconfig' 'openjpeg2' 'lcms2' 'nss' 'curl')
  optdepends=('poppler-data: encoding data to display PDF documents containing CJK characters')
  provides=('libpoppler.so' 'libpoppler-cpp.so' "poppler=${pkgver}")
  conflicts=('poppler' "poppler-qt3<${pkgver}" "poppler-qt4<${pkgver}")

  cd build
  make DESTDIR="${pkgdir}" install

  # cleanup for splitted build
  rm -vrf "${pkgdir}"/usr/include/poppler/{glib,qt5,qt6}
  rm -vf "${pkgdir}"//usr/lib/libpoppler-{glib,qt5,qt6}.*
  rm -vf "${pkgdir}"/usr/lib/pkgconfig/poppler-{glib,qt5,qt6}.pc
  rm -vrf "${pkgdir}"/usr/{lib,share}/gir*
  rm -vrf "${pkgdir}"/usr/share/gtk-doc
}

package_poppler-glib-lcd() {
  pkgdesc="Poppler glib bindings with subpixel patch on LCD display"
  depends=("poppler-lcd=${pkgver}" 'glib2')
  conflicts=('poppler-glib')
  provides=('libpoppler-glib.so' 'poppler-glib')

  cd build

  make -C glib DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m644 poppler-glib.pc "${pkgdir}/usr/lib/pkgconfig/"
  rm -vf "${pkgdir}"/usr/lib/libpoppler.*
  rm -vf "${pkgdir}/usr/bin/poppler-glib-demo"
}

package_poppler-qt5-lcd() {
  pkgdesc="Poppler Qt5 bindings with subpixel patch on LCD display"
  depends=("poppler-lcd=${pkgver}" 'qt5-base')
  conflicts=('poppler-qt5')
  provides=('libpoppler-qt5.so' 'poppler-qt5')

  cd build
  make -C qt5 DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m644 poppler-qt5.pc "${pkgdir}/usr/lib/pkgconfig/"
}

package_poppler-qt6-lcd() {
  pkgdesc="Poppler Qt6 bindings with subpixel patch on LCD display"
  depends=("poppler-lcd=${pkgver}" 'qt6-base')
  conflicts=('poppler-qt6')
  provides=('libpoppler-qt6.so' 'poppler-qt6')

  cd build
  make -C qt6 DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
}
