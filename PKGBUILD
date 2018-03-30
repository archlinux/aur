# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch> # Contributor: Christopher Reimer <c.reimer1993@gmail.com>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>

pkgname=texmacs-svn
_pkgname=texmacs
pkgver=20180323.11047
pkgrel=1
pkgdesc="Free scientific text editor, inspired by TeX and GNU Emacs. WYSIWYG editor and CAS-interface."
arch=('x86_64')
url="http://www.texmacs.org/"
license=('GPL')
depends=('perl' 'guile1.8' 'texlive-core' 'python2' 'libxext' 'freetype2' 'qt5-base' 'libiconv')
# do not remove texlive-core dependency, as it is needed!
optdepends=('transfig: convert images using fig2ps'
            'gawk: conversion of some files'
            'ghostscript: rendering ps files'
            'imagemagick: convert images'
            'aspell: spell checking')
makedepends=('ghostscript' 'cmake')
source=("${_pkgname}::svn://svn.savannah.gnu.org/texmacs/trunk/src"
        "0001-Sage-plugin-fix-which-not-found.patch"
        )
sha1sums=('SKIP'
          '8a6e4f423a56a870136c1b2357b0e6cbd46e6d51')
options=('!emptydirs' '!ccache')
provides=('texmacs')
conflicts=('texmacs')

pkgver() {
  cd ${_pkgname}
  LANG=en svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}

prepare() {
  rm -rf ${_pkgname}-build
  svn export ${_pkgname} ${_pkgname}-build

  cd ${_pkgname}-build

  patch -Np1 -i ../0001-Sage-plugin-fix-which-not-found.patch

  sed -i 's/env python/env python2/' \
    plugins/{mathematica/bin/realpath.py,python/bin/tm_python,sage/bin/tm_sage} \
    TeXmacs/misc/inkscape_extension/texmacs_reedit.py
  sed -i 's/"python"/"python2"/' plugins/python/progs/init-python.scm
  sed -e 's/-Wno-deprecated-register//' -i src/CMakeLists.txt # Remove wrong flag on Linux
}

build() {
  cd ${_pkgname}-build

  mkdir -p build
  cd build

  cmake .. \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGUILECONFIG_EXECUTABLE=/usr/bin/guile-config1.8
  make -j$(nproc)
}

package() {
  cd ${_pkgname}-build/build
  make DESTDIR=${pkgdir} install

  # fix fig2ps script
  sed -i 's|${prefix}|/usr|' "${pkgdir}/usr/bin/fig2ps"
  # fix FS#37518
  sed -i '/^Path=/d' "${pkgdir}/usr/share/applications/texmacs.desktop"
}

# vim:set ts=2 sw=2 et:
