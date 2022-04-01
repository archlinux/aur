# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch> # Contributor: Christopher Reimer <c.reimer1993@gmail.com>

pkgname=texmacs
pkgver=2.1.1
pkgrel=1
pkgdesc="Free scientific text editor, inspired by TeX and GNU Emacs. WYSIWYG editor TeX-fonts and CAS-interface (Giac, GTybalt, Macaulay 2, Maxima, Octave, Pari, Qcl, R and Yacas) in one."
arch=('x86_64')
url="http://www.texmacs.org/"
license=('GPL')
depends=('perl' 'guile1.8' 'texlive-core' 'python' 'libxext' 'freetype2' 'qt5-svg')
# do not remove texlive-core dependency, as it is needed!
optdepends=('transfig: convert images using fig2ps'
            'gawk: conversion of some files'
	    'ghostscript: rendering ps files'
            'imagemagick: convert images'
            'aspell: spell checking')
makedepends=('ghostscript' 'cmake')
source=(http://www.texmacs.org/Download/ftp/tmftp/source/TeXmacs-${pkgver}-src.tar.gz)
options=('!emptydirs')
sha256sums=('918ca184aca0cb5335906a6c471a1ae3a80c47ab26b5d1c059f0dfcbd906e830')

build() {
  cd TeXmacs-${pkgver}-src
  
  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGUILECONFIG_EXECUTABLE=/usr/bin/guile-config1.8
  make
}

package() {
  cd TeXmacs-${pkgver}-src/build
  make DESTDIR="${pkgdir}" install

 # fix fig2ps script
 sed -i 's|${prefix}|/usr|' "${pkgdir}/usr/bin/fig2ps"
 # fix launch script
 sed -e 's|\@CONFIG_LIB_PATH\@|LD_LIBRARY_PATH|g' -i "$pkgdir"/usr/bin/texmacs
}
