# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: jyantis <yantis@yantis.net>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

set -u
pkgbase='poppler-git'
pkgname=('poppler-git' 'poppler-glib-git' 'poppler-qt5-git')
pkgver=0.69.0.r65.ga6f88881
pkgrel=1
arch=(i686 x86_64)
license=('GPL')
makedepends=('libjpeg' 'gcc-libs' 'cairo' 'fontconfig' 'openjpeg2' 'gtk3' 'pkgconfig' 'lcms2' 
             'gobject-introspection' 'icu' 'qt5-base' 'git' 'nss' 'gtk-doc' 'curl' 'poppler-data'
             'cmake' 'python') 
makedepends+=('openjpeg2')
options=('!emptydirs')
url="https://poppler.freedesktop.org/"
source=('git://git.freedesktop.org/git/poppler/poppler'
        'git://git.freedesktop.org/git/poppler/test')
sha256sums=('SKIP'
            'SKIP')

_pkgver="${pkgver%%.r*}"

pkgver() {
  set -u
  cd 'poppler'
  git describe --long | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g' -e 's:^poppler\.::g'
  set +u
}

prepare() {
  set -u
  cd 'poppler'
  mkdir build
  set +u
}

build() {
  set -u
  cd poppler
  cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_XPDF_HEADERS=ON \
    -DENABLE_GTK_DOC=ON
  make
  set +u
}

check() {
  set -u
  cd poppler
  cd build
  LANG=en_US.UTF8 make test
  set +u
}

package_poppler-git() {
  set -u
  pkgdesc="PDF rendering library based on xpdf 3.0"
  depends=('libjpeg' 'gcc-libs' 'cairo' 'fontconfig' 'openjpeg2' 'lcms2' 'nss' 'curl')
  optdepends=('poppler-data: encoding data to display PDF documents containing CJK characters')
  conflicts=("poppler-qt3<${_pkgver}" "poppler-qt4<${_pkgver}" 'poppler')
  provides=("poppler=${_pkgver}")

  cd poppler
  cd build
  make DESTDIR="${pkgdir}" install

  # cleanup for splitted build
  rm -vrf "${pkgdir}"/usr/include/poppler/{glib,qt5}
  rm -vf "${pkgdir}"//usr/lib/libpoppler-{glib,qt5}.*
  rm -vf "${pkgdir}"/usr/lib/pkgconfig/poppler-{glib,qt5}.pc
  rm -vrf "${pkgdir}"/usr/{lib,share}/gir*
  rm -vrf "${pkgdir}"/usr/share/gtk-doc
}

package_poppler-glib-git() {
  set -u
  pkgdesc="Poppler glib bindings"
  depends=("poppler=${_pkgver}" 'glib2')
  conflicts=('poppler-glib')
  provides=("poppler-glib=${_pkgver}")

  cd poppler
  cd build

  make -C glib DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m644 poppler-glib.pc "${pkgdir}/usr/lib/pkgconfig/"
  rm -vf "${pkgdir}"/usr/lib/libpoppler.*
  rm -vf "${pkgdir}/usr/bin/poppler-glib-demo"
  set +u
}

package_poppler-qt5-git() {
  set -u
  pkgdesc="Poppler Qt5 bindings"
  depends=("poppler=${_pkgver}" 'qt5-base')
  conflicts=('poppler-qt5')
  provides=("poppler-qt5=${_pkgver}")

  cd poppler
  cd build
  make -C qt5 DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m644 poppler-qt5.pc "${pkgdir}/usr/lib/pkgconfig/"
  set +u
}
set +u
