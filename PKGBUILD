# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch> # Contributor: Christopher Reimer <c.reimer1993@gmail.com>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>

pkgname=texmacs-svn
_pkgname=texmacs
pkgver=20160607.10447
pkgrel=1
pkgdesc="Free scientific text editor, inspired by TeX and GNU Emacs. WYSIWYG editor and CAS-interface."
arch=('i686' 'x86_64')
url="http://www.texmacs.org/"
license=('GPL')
depends=('perl' 'guile1.8' 'texlive-core' 'python2' 'libxext' 'freetype2' 'shared-mime-info'
         'desktop-file-utils' 'qt4' 'libiconv')
# do not remove texlive-core dependency, as it is needed!
optdepends=('transfig: convert images using fig2ps'
            'gawk: conversion of some files'
            'ghostscript: rendering ps files'
            'imagemagick: convert images'
            'aspell: spell checking')
makedepends=('ghostscript')
source=("${_pkgname}::svn://svn.savannah.gnu.org/texmacs/trunk/src"
        "0001-R-plugin-fix-preprocessor.patch"
        "0002-Fix-macro-name-for-guile.patch"
        "0003-Fix-mktemp-too-few-X-s-in-template-texmacs.patch"
        )
sha1sums=('SKIP'
          '6fdcd7f01fc6ab3725b43ae96f673e87e4559600'
          '2c548e064a7ffd767a81feeb05bbfb87c1948db1'
          '32d2890347d498f02c2ab7ee74021ab62b099436')
options=('!emptydirs' '!ccache')
provides=('texmacs')
conflicts=('texmacs')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}

prepare() {
  rm -rf "${srcdir}/${_pkgname}-build"
  svn export "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}-build"

  cd "${srcdir}/${_pkgname}-build"

  patch -Np1 -i ../0001-R-plugin-fix-preprocessor.patch
  patch -Np1 -i ../0002-Fix-macro-name-for-guile.patch
  patch -Np1 -i ../0003-Fix-mktemp-too-few-X-s-in-template-texmacs.patch

  sed -i 's/env python/env python2/' \
    plugins/{mathematica/bin/realpath.py,python/bin/tm_python,sage/bin/tm_sage} \
    TeXmacs/misc/inkscape_extension/texmacs_reedit.py
  sed -i 's/"python"/"python2"/' plugins/python/progs/init-python.scm
  sed -i '/^LDPATH/d' src/makefile.in

  sed -e 's/GUILE_BIN="$GUILE_LIB"/GUILE_BIN="$GUILE_LIB$GUILE_VERSION"/g' \
      -e 's/guile18-config/guile-config1.8/g' \
      -i misc/m4/guile.m4
  mv configure.in configure.ac
  autoreconf

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

  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --libexecdir=/usr/lib \
              LIBS="-ldl"
  make -j8
}

package() {
  cd "${srcdir}/${_pkgname}-build"
  make DESTDIR=${pkgdir} install

  # fix fig2ps script
  sed -i 's|${prefix}|/usr|' "${pkgdir}/usr/bin/fig2ps"
  # fix FS#37518
  sed -i '/^Path=/d' "${pkgdir}/usr/share/applications/texmacs.desktop"

  # fix sage plugin
  sed -i 's|`which tm_sage`|/usr/lib/TeXmacs/bin/tm_sage|' "${pkgdir}/usr/share/TeXmacs/plugins/sage/progs/init-sage.scm"
}

# vim:set ts=2 sw=2 et:
