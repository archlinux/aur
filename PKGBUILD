_pkgname=texmacs
pkgname=${_pkgname}-qt
pkgver=2.1.1
pkgrel=2
pkgdesc="WYSIWYG free scientific text editor and graphical frontend to various CASes \n
(Giac, GTybalt, Macaulay 2, Maxima, Octave, Pari, Qcl, R and Yacas)"
arch=('x86_64')
url='http://texmacs.org/'
license=('GPL3')
depends=('qt5-base' 'guile1.8' 'libtool' 'perl' 'python')
optdepends=(
  'texlive-core: TeX-fonts'		# highly recommended, but optional: http://www.texmacs.org/tmweb/download/packaging.en.html
  'gawk: conversion of some files'
  'ghostscript: rendering ps files'
  'imagemagick: convert images'
  'aspell: spell checking')
makedepends=('ghostscript' 'cmake' 'cairo' 'imlib2')
provides=("texmacs=${pkgver}")
conflicts=("texmacs")
options=('!emptydirs')
source=("http://www.texmacs.org/Download/ftp/tmftp/source/TeXmacs-$pkgver-src.tar.gz"
        'http://www.texmacs.org/Images/tm_gnu1b.png'
        'texmacs.desktop')
sha256sums=('918ca184aca0cb5335906a6c471a1ae3a80c47ab26b5d1c059f0dfcbd906e830'
            'f11123275494718a3064c9c3ed9638bcc86402536cdcc875a1dd3c0196d08102'
            '0719f63ac6db6fffd979dba77a4ab8f9a8f21bcfef84ed5f425e709eb4bd503e')

build() {
  cd TeXmacs-${pkgver}-src

  [ -d build ] && rm -rv build
  mkdir -p build
  cd build

  msg "### cmake"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGUILECONFIG_EXECUTABLE=/usr/bin/guile-config1.8
  msg "### make"
  make
}

package() {
  cd TeXmacs-${pkgver}-src/build

  msg "### make install"
  make DESTDIR=${pkgdir} install
  sed -i 's|${prefix}|/usr|' "${pkgdir}/usr/bin/fig2ps"
  sed -e 's|\@CONFIG_LIB_PATH\@|LD_LIBRARY_PATH|g' -i "$pkgdir"/usr/bin/texmacs

  cd ..
  _appdir=${pkgdir}/usr/share/applications
  _pngdir=${pkgdir}/usr/share/pixmaps
  _docdir=${pkgdir}/usr/share/doc/${pkgname}
  _licdir=${pkgdir}/usr/share/licenses/${pkgname}
  install -dm 755 ${_appdir} ${_pngdir} ${_docdir} ${_licdir}
  install -Dpm 0644 ${srcdir}/texmacs.desktop ${_appdir}/
  install -Dpm 0644 ${srcdir}/tm_gnu1b.png ${_pngdir}/texmacs.png
  install -Dpm 0644 COMPILE COPYING LICENSE TODO TeXmacs/INSTALL TeXmacs/README TeXmacs/TEX_FONTS ${_docdir}/
  cd ${_licdir} ; ln -s ../../TeXmacs/LICENSE .
}
