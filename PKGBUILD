pkgname=texmacs-qt
pkgver=1.99.7
pkgrel=1
pkgdesc="WYSIWYG Qt5 editor and graphical frontend to various CASes"
arch=('x86_64')
url='http://texmacs.org/'
license=('GPL3')
depends=('qt5-base' 'guile1.8' 'icu' 'libsystemd' 'libtool' 'perl' 'python2')
makedepends=('ghostscript' 'cmake')
optdepends=(
  'texlive-core: TeX-fonts'	# Yes, optional: http://www.texmacs.org/tmweb/download/packaging.en.html
  'transfig: convert images using fig2ps'
  'gawk: conversion of some files'
  'ghostscript: rendering ps files'
  'imagemagick: convert images'
  'aspell: spell checking')
provides=('texmacs')
conflicts=('texmacs')
options=('!emptydirs')
source=("http://www.texmacs.org/Download/ftp/tmftp/source/TeXmacs-$pkgver-src.tar.gz"
        'texmacs-fix-linking.patch'
        'http://www.texmacs.org/Images/tm_gnu1b.png'
        'texmacs.desktop')
md5sums=('39e6502cdb959b4bf6faea4764608809'
         'bc683a7c6b961bcf6a41bdb5f35e488f'
         '48c15c09000cc38728d847c3a8ffabc0'
         '9b8210c9b1414919da07d101f878f2c9')

prepare() {
  msg "### patch"
  cd ${srcdir}/TeXmacs-${pkgver}-src

  sed -i 's/env python/env python2/' \
    plugins/{mathematica/bin/realpath.py,python/bin/tm_python,sage/bin/tm_sage} \
    TeXmacs/misc/inkscape_extension/texmacs_reedit.py
  sed -i 's/"python"/"python2"/' plugins/python/progs/init-python.scm

  patch -p1 -i ../texmacs-fix-linking.patch
}

build() {
  cd TeXmacs-${pkgver}-src

  [ -d build ] && rm -rv build
  mkdir -p build
  cd build

  msg "### configure"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGUILECONFIG_EXECUTABLE=/usr/bin/guile-config1.8
  msg "### make"
  make
}

package() {
  cd TeXmacs-${pkgver}-src/build

  msg "### install"
  make DESTDIR=${pkgdir} install
  sed -i 's|${prefix}|/usr|' "${pkgdir}/usr/bin/fig2ps"
  sed -e 's|\@CONFIG_LIB_PATH\@|LD_LIBRARY_PATH|g' -i "$pkgdir"/usr/bin/texmacs

  cd ..
  _appdir=${pkgdir}/usr/share/applications
  _pngdir=${pkgdir}/usr/share/pixmaps
  _docdir=${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
  _licdir=${pkgdir}/usr/share/licenses/${pkgname}
  install -dm 755 ${_appdir} ${_pngdir} ${_docdir} ${_licdir}
  install -Dpm 0644 ${startdir}/texmacs.desktop ${_appdir}/
  install -Dpm 0644 ${startdir}/tm_gnu1b.png ${_pngdir}/texmacs.png
  install -Dpm 0644 COMPILE COPYING LICENSE TODO TeXmacs/INSTALL TeXmacs/README TeXmacs/TEX_FONTS ${_docdir}/
  cd ${_licdir} ; ln -s ../../TeXmacs/LICENSE .
}
