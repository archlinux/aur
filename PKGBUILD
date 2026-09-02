_pkgname=texmacs
pkgname=${_pkgname}-qt
pkgver=2.1.5
pkgrel=1
pkgdesc="WYSIWYG free scientific text editor and graphical frontend to various CASes \n
(Giac, GTybalt, Macaulay 2, Maxima, Octave, Pari, Qcl, R and Yacas)"
arch=('x86_64')
url='http://texmacs.org/'
license=('GPL3')
depends=('qt5-svg' 'freetype2' 'libxext' 'guile1.8' 'libtool' 'perl' 'python')
optdepends=(
  'texlive-core: TeX-fonts'		# highly recommended, but optional: http://www.texmacs.org/tmweb/download/packaging.en.html
  'fig2dev: convert images using fig2ps'
  'gawk: conversion of some files'
  'ghostscript: rendering ps files'
  'imagemagick: convert images'
  'aspell: spell checking')
makedepends=('ghostscript' 'cmake' 'cairo' 'imlib2')
provides=("texmacs=${pkgver}" 'fig2ps')
conflicts=("texmacs" 'fig2ps')
options=('!emptydirs')
source=("http://www.texmacs.org/Download/ftp/tmftp/source/TeXmacs-$pkgver-src.tar.gz"
        'http://www.texmacs.org/Images/tm_gnu1b.png'
        'texmacs.desktop')
sha256sums=('b3a127bdba8e79010b239291415cbe3431333521e24477a814b586e1b4027360'
            'f11123275494718a3064c9c3ed9638bcc86402536cdcc875a1dd3c0196d08102'
            '0719f63ac6db6fffd979dba77a4ab8f9a8f21bcfef84ed5f425e709eb4bd503e')

build() {
  msg "### config"
  cmake .. \
    -S TeXmacs-${pkgver}.15315 \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGUILECONFIG_EXECUTABLE=/usr/bin/guile-config1.8 \
    -Wno-dev
  msg "### build"
  cmake --build build
}

package() {
  msg "### install"
  DESTDIR="${pkgdir}" cmake --build build --target install

  sed -i 's|${prefix}|/usr|' "${pkgdir}/usr/bin/fig2ps"
  sed -e 's|\@CONFIG_LIB_PATH\@|LD_LIBRARY_PATH|g' -i "$pkgdir"/usr/bin/texmacs

  cd TeXmacs-${pkgver}.15315
  _appdir=${pkgdir}/usr/share/applications
  _pngdir=${pkgdir}/usr/share/pixmaps
  _docdir=${pkgdir}/usr/share/doc/${pkgname}
  _licdir=${pkgdir}/usr/share/licenses/${pkgname}
  install -dm 755 ${_appdir} ${_pngdir} ${_docdir} ${_licdir}
  install -Dpm 0644 ${srcdir}/texmacs.desktop ${_appdir}/
  install -Dpm 0644 ${srcdir}/tm_gnu1b.png ${_pngdir}/texmacs.png
  install -Dpm 0644 COMPILE COPYING LICENSE README.md TODO TeXmacs/INSTALL TeXmacs/README TeXmacs/TEX_FONTS ${_docdir}/
  cd ${_licdir} ; ln -s ../../TeXmacs/LICENSE .
}
