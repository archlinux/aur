# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch> # Contributor: Christopher Reimer <c.reimer1993@gmail.com>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>

pkgname=texmacs-svn
_pkgname=texmacs
pkgver=20160420.10174
pkgrel=1
pkgdesc="Free scientific text editor, inspired by TeX and GNU Emacs. WYSIWYG editor and CAS-interface."
arch=('i686' 'x86_64')
url="http://www.texmacs.org/"
license=('GPL')
depends=('perl' 'guile1.8' 'texlive-core' 'python2' 'libxext' 'freetype2' 'shared-mime-info'
         'desktop-file-utils' 'qt4')
# do not remove texlive-core dependency, as it is needed!
optdepends=('transfig: convert images using fig2ps'
            'gawk: conversion of some files'
            'ghostscript: rendering ps files'
            'imagemagick: convert images'
            'aspell: spell checking')
makedepends=('ghostscript')
source=("${_pkgname}::svn://svn.savannah.gnu.org/texmacs/trunk/src")
install=${_pkgname}.install
options=('!emptydirs' '!ccache')
sha1sums=('SKIP')
provides=('texmacs')
conflicts=('texmacs')

pkgver() {
  cd ${srcdir}/${_pkgname}
  svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}

prepare() {
  rm -rf "${srcdir}/${_pkgname}-build"
  svn export "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}-build"

  cd "${srcdir}/${_pkgname}-build"
  sed -i 's/env python/env python2/' \
    plugins/{mathematica/bin/realpath.py,python/bin/tm_python,sage/bin/tm_sage} \
    TeXmacs/misc/inkscape_extension/texmacs_reedit.py
  sed -i 's/"python"/"python2"/' plugins/python/progs/init-python.scm
  sed -i '/^LDPATH/d' src/makefile.in
  #sed -i -e 's/"guile18"/"guile1.8"/g' \
  #       -e 's/guile18-config/guile-config1.8/g' \
  #       configure

 # Don't generate icon-cache and mime-database (namcap tells that they should not be in a package)
  sed -i '/update-mime-database/d' Makefile.in
  sed -i '/gtk-update-icon-cache/d' Makefile.in
  sed -i '\/icons\/gnome 2>\/dev\/null/d' Makefile.in

}

build() {
  cd "${srcdir}/${_pkgname}-build"
  export QMAKE=qmake-qt4
  export MOC=moc-qt4
  export UIC=uic-qt4
  export LDFLAGS="$LDFLAGS -lz"

  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --libexecdir=/usr/lib
  make
}

package() {
  cd "${srcdir}/${_pkgname}-build"
  make DESTDIR=${pkgdir} install

  # fix fig2ps script
  sed -i 's|${prefix}|/usr|' "${pkgdir}/usr/bin/fig2ps"
  # fix FS#37518
  sed -i '/^Path=/d' "${pkgdir}/usr/share/applications/texmacs.desktop"
}

# vim:set ts=2 sw=2 et:
