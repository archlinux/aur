_pkgname=texmacs
pkgname=${_pkgname}-qt
pkgver=1.99.12
pkgrel=1
pkgdesc="WYSIWYG free scientific text editor and graphical frontend to various CASes \n
(Giac, GTybalt, Macaulay 2, Maxima, Octave, Pari, Qcl, R and Yacas)"
arch=('x86_64')
url='http://texmacs.org/'
license=('GPL3')
depends=('qt5-base' 'guile1.8' 'libtool' 'perl' 'python2')
optdepends=(
  'texlive-core: TeX-fonts'		# highly recommended, but optional: http://www.texmacs.org/tmweb/download/packaging.en.html
  'gawk: conversion of some files'
  'ghostscript: rendering ps files'
  'imagemagick: convert images'
  'aspell: spell checking')
makedepends=('ghostscript' 'cmake' 'cairo' 'imlib2')
options=('!emptydirs')
source=("http://www.texmacs.org/Download/ftp/tmftp/source/TeXmacs-$pkgver-src.tar.gz"
        'http://www.texmacs.org/Images/tm_gnu1b.png'
        'texmacs.desktop')
md5sums=('9c8169ff79afefc606564e530ec12ec9'
         '48c15c09000cc38728d847c3a8ffabc0'
         'a1856736b4defd6f3a46cf608b108ef1')

prepare() {
  cd ${srcdir}/TeXmacs-${pkgver}-src

  msg "### patch"
  find -name '*.py' | xargs sed -i 's/env python/env python2/'
  sed -i 's/"python"/"python2"/' plugins/python/progs/init-python.scm
}

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
