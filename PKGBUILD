# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: jyantis <yantis@yantis.net>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

set -u
pkgbase=poppler
pkgbase+='-git'
pkgname=('poppler' 'poppler-glib' 'poppler-qt5' 'poppler-qt6')
pkgname=("${pkgname[@]/%/-git}")
pkgver=22.04.0.r43.g368465a8
_pkgver="${pkgver%%.r*}"
pkgrel=1
arch=(x86_64)
arch+=('i686' 'aarch64')
license=('GPL')
makedepends=('libjpeg' 'gcc-libs' 'cairo' 'fontconfig' 'openjpeg2' 'gtk3' 'pkgconfig' 'lcms2' 
             'gobject-introspection' 'icu' 'qt5-base' 'qt6-base' 'git' 'nss' 'gtk-doc' 'curl' 'poppler-data'
             'cmake' 'python' 'boost')
options=('!emptydirs')
url="https://poppler.freedesktop.org/"
source=('git://git.freedesktop.org/git/poppler/poppler'
        'git://git.freedesktop.org/git/poppler/test')
md5sums=('SKIP'
         'SKIP')
sha256sums=('SKIP'
            'SKIP')
validpgpkeys=('CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7') # "Albert Astals Cid <aacid@kde.org>"

pkgver() {
  set -u
  cd 'poppler'
  git describe --long | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g' -e 's:^poppler\.::g'
  set +u
}

prepare() {
  set -u
  cd 'poppler'
  mkdir -p build
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
    -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
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
  optdepends=('poppler-data: highly recommended encoding data to display PDF documents with certain encodings and characters')
  provides=('libpoppler.so' 'libpoppler-cpp.so')
  provides+=("poppler=${_pkgver}")
  conflicts=("poppler-qt3<${_pkgver}" "poppler-qt4<${_pkgver}")
  conflicts+=('poppler')

  cd poppler
  cd build
  make DESTDIR="${pkgdir}" install

  # cleanup for splitted build
  rm -vrf "${pkgdir}"/usr/include/poppler/{glib,qt5,qt6}
  rm -vf "${pkgdir}"//usr/lib/libpoppler-{glib,qt5,qt6}.*
  rm -vf "${pkgdir}"/usr/lib/pkgconfig/poppler-{glib,qt5,qt6}.pc
  rm -vrf "${pkgdir}"/usr/{lib,share}/gir*
  rm -vrf "${pkgdir}"/usr/share/gtk-doc
}

package_poppler-glib-git() {
  set -u
  pkgdesc="Poppler glib bindings"
  depends=("poppler=${_pkgver}" 'glib2')
  conflicts=('poppler-glib')
  provides=('libpoppler-glib.so')
  provides+=("poppler-glib=${_pkgver}")

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
  provides=('libpoppler-qt5.so')
  provides+=("poppler-qt5=${_pkgver}")

  cd poppler
  cd build
  make -C qt5 DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m644 poppler-qt5.pc "${pkgdir}/usr/lib/pkgconfig/"
  set +u
}

package_poppler-qt6-git() {
  set -u
  pkgdesc="Poppler Qt6 bindings"
  depends=("poppler=${_pkgver}" 'qt6-base')
  conflicts=('poppler-qt6')
  provides=('libpoppler-qt6.so')
  provides+=("poppler-qt6=${_pkgver}")

  cd poppler
  cd build
  make -C qt6 DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m644 poppler-qt6.pc "${pkgdir}/usr/lib/pkgconfig/"
  set +u
}
set +u
