# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Stefan Husmann <stefan.husmann@t-systems.com>
# Contributor: Stéphane Gaudreault <Stephane.Gaudreault@gmail.com>
# Maintainer : Marcos Heredia <chelqo@gmail.com>

pkgname=yacas
pkgver=1.4.0
pkgrel=1
pkgdesc='Yet another computer algebra system'
url='http://www.yacas.org/'
screenshot='https://dl.dropbox.com/s/dy9evnpl13kdo21/yacas-console.png'
license=('GPL')
groups=("mathematics")
arch=('i686' 'x86_64')
depends=('glibc' 'gcc-libs')
optdepends=('gnuplot' 'lynx' 'texmacs' 'fbreader: Reading EPUB manual')
makedepends=('gcc' 'perl' 'imagemagick' ) #'python3-sphinx')
install=${pkgname}.install
noextract=('yacas.epub')
source=("https://github.com/grzegorzmazur/yacas/archive/v${pkgver}.tar.gz"
        'https://media.readthedocs.org/epub/yacas/latest/yacas.epub'
        'yacas.desktop'
        'yacas-docs.desktop'
        )
md5sums=('80b86a586d8d56afdd6986686daf0f13'  # yacas source
         'SKIP'                              # Epub manual
         '21d4cf6e7658aa0d7c4a0ed14c13f2e9'  # yacas.desktop
         'fff8c43f7ab3a77c6f6e181bc3e2687f'  # yacas-docs.desktop
         )

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  [ -d build ] && rm -rf build
  mkdir build
  cd build
  msg "### cmake" ; cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  msg "### make"  ; make

#    -DENABLE_OLD_DOCS=yes \
#    -DENABLE_DOCS=ON \
#    -DENABLE_JYACAS=yes \
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  cat cmake_install.cmake | grep -v "share/doc" >cmake_install.cmake.tmp
  mv cmake_install.cmake.tmp cmake_install.cmake
  msg "### instalation " ; make DESTDIR=$pkgdir install
  cd ..
  _appdir=${pkgdir}/usr/share/applications
  _pngdir=${pkgdir}/usr/share/pixmaps
  _docdir=${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
  _licdir=${pkgdir}/usr/share/licenses/${pkgname}
  install -dm755 ${_appdir} ${_pngdir} ${_docdir} ${_licdir}
  install -Dpm644 ${startdir}/yacas.desktop ${_appdir}/
  install -Dpm644 ${startdir}/yacas-docs.desktop ${_appdir}/
  convert -crop 500x500+34+110 docs/yacaslogo.png ${_pngdir}/yacas.png
  install -Dpm644 AUTHORS ChangeLog INSTALL NEWS README* TODO ${_docdir}/
  install -Dpm644 ${srcdir}/yacas.epub ${pkgdir}/usr/share/yacas/
  install -Dpm644 COPYING ${_licdir}/
  (cd ${_docdir} ; ln -s ../../yacas/yacas.epub .)
}
