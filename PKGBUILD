# Maintainer:  jyantis <yantis@yantis.net>

# I basically ripped 90% of this from the official poppler PKGBUILD
# So all the credit goes to Jan de Groot <jgc@archlinux.org>
# Unless of course there is some epic fail then that is all me =)

# Development takes place on git in what will be the 0.29 release series.

pkgbase=poppler-git
pkgname=('poppler-git' 'poppler-glib-git' 'poppler-qt4-git' 'poppler-qt5-git')
pkgver=0.33.0.r4409.11f117c
pkgrel=2
arch=(i686 x86_64)
license=('GPL')
makedepends=('git'  'libjpeg' 'gcc-libs' 'cairo' 'fontconfig' 'openjpeg' 'gtk2' 'qt4' 'pkgconfig' 'lcms2' 'gobject-introspection' 'icu' 'qt5-base')
options=('!emptydirs')
url="http://poppler.freedesktop.org/"
source=('git://git.freedesktop.org/git/poppler/poppler'
        'git://git.freedesktop.org/git/poppler/test')
sha256sums=('SKIP' 'SKIP')
_standdardversion=$(echo $pkgver | cut -c -6)
pkgver() {
  cd poppler

  _majorversion=$(grep -F "m4_define([poppler_version_major]" configure.ac | awk 'BEGIN {FS = "["} {print $3}' | sed -r 's/(\[|\])//g' | sed -r 's/(\(|\))//g')
  _minorversion=$(grep -F "m4_define([poppler_version_minor]" configure.ac | awk 'BEGIN {FS = "["} {print $3}' | sed -r 's/(\[|\])//g' | sed -r 's/(\(|\))//g')
  _microversion=$(grep -F "m4_define([poppler_version_micro]" configure.ac | awk 'BEGIN {FS = "["} {print $3}' | sed -r 's/(\[|\])//g' | sed -r 's/(\(|\))//g')

  printf "%s." "$_majorversion"
  printf "%s." "$_minorversion"
  printf "%s." "$_microversion"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  ln -sf test-${_testtag} test

  cd poppler
  git submodule init
  git config submodule.test.url poppler/test
  git submodule update test
}

build() {
  cd poppler
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --enable-cairo-output \
      --enable-xpdf-headers \
      --enable-libjpeg --enable-zlib \
      --enable-poppler-qt4 \
      --enable-poppler-qt5 \
      --enable-poppler-glib
  make
}

check() {
  cd poppler
  LANG=en_US.UTF8 make check
}

package_poppler-git() {
  pkgdesc="PDF rendering library based on xpdf 3.0"
  depends=('libjpeg' 'gcc-libs' 'cairo' 'fontconfig' 'openjpeg' 'lcms2')
  optdepends=('poppler-data: encoding data to display PDF documents containing CJK characters')
  conflicts=("poppler-qt3<${_standdardversion}" 'poppler')
  provides=("poppler=${_standdardversion}" 'poppler')

  cd poppler
  sed -e 's/^glib_subdir =.*/glib_subdir =/' \
      -e 's/^qt4_subdir =.*/qt4_subdir =/' \
      -e 's/^qt5_subdir =.*/qt5_subdir =/' -i Makefile
  make DESTDIR="${pkgdir}" install

  rm -f "${pkgdir}"/usr/lib/pkgconfig/poppler-{glib,qt4,qt5}.pc
}

package_poppler-glib-git() {
  pkgdesc="Poppler glib bindings"
  depends=('poppler-git' 'glib2')
  conflicts=('poppler-glib')
  provides=( 'poppler-glib')

  cd poppler
  make -C poppler DESTDIR="${pkgdir}" install-libLTLIBRARIES
  make -C glib DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m644 poppler-glib.pc "${pkgdir}/usr/lib/pkgconfig/"
  rm -f "${pkgdir}"/usr/lib/libpoppler.*
  rm -f "${pkgdir}/usr/bin/poppler-glib-demo"
}

package_poppler-qt4-git() {
  pkgdesc="Poppler Qt4 bindings"
  provides=("poppler-qt=${_standdardversion}")
  replaces=('poppler-qt' 'poppler-qt4' )
  conflicts=('poppler-qt'  'poppler-qt4' )
  depends=('poppler-git' 'qt4')

  cd poppler
  make -C poppler DESTDIR="${pkgdir}" install-libLTLIBRARIES
  make -C qt4 DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m644 poppler-qt4.pc "${pkgdir}/usr/lib/pkgconfig/"
  rm -f "${pkgdir}"/usr/lib/libpoppler.*
}

package_poppler-qt5-git() {
  pkgdesc="Poppler Qt5 bindings"
  depends=('poppler-git' 'qt5-base')
  conflicts=('poppler-qt5')
  provides=('poppler-qt5')

  cd poppler
  make -C poppler DESTDIR="${pkgdir}" install-libLTLIBRARIES
  make -C qt5 DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m644 poppler-qt5.pc "${pkgdir}/usr/lib/pkgconfig/"
  rm -f "${pkgdir}"/usr/lib/libpoppler.*
}
