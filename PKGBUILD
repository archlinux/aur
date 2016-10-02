# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Stefan Husmann <stefan.husmann@t-systems.com>
# Contributor: Stéphane Gaudreault <Stephane.Gaudreault@gmail.com>
# Maintainer : Marcos Heredia <chelqo@gmail.com>

pkgname=yacas
pkgver=1.5.0
pkgrel=1
pkgdesc='Yet another computer algebra system'
url='http://www.yacas.org/'
screenshot='https://dl.dropbox.com/s/dy9evnpl13kdo21/yacas-console.png'
license=('GPL2')
groups=("mathematics")
arch=('i686' 'x86_64')
depends=('glibc' 'gcc-libs')
optdepends=('gnuplot' 'lynx' 'texmacs' 'fbreader: Reading EPUB manual')
makedepends=('gcc' 'perl' 'imagemagick' 'python-sphinx')
install=${pkgname}.install
noextract=('yacas.epub')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/grzegorzmazur/yacas/archive/v${pkgver}.tar.gz"
        'https://media.readthedocs.org/epub/yacas/latest/yacas.epub'
        'yacas.desktop'
        'yacas-docs.desktop'
        )
md5sums=('0745ff1f7d7c4520b40054deb16801f9'  # yacas source
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
    -DENABLE_DOCS=ON \
    -DCMAKE_BUILD_TYPE=Release
  msg "### make"  ; make

#    -DENABLE_JYACAS=yes \
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  msg "### instalation " ; make DESTDIR=$pkgdir install
  rm -rf ${pkgdir}/usr/share/doc/${pkgname}
  cd ..
  _appdir=${pkgdir}/usr/share/applications
  _pngdir=${pkgdir}/usr/share/pixmaps
  _docdir=${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
  _licdir=${pkgdir}/usr/share/licenses/${pkgname}
  install -dm755 ${_appdir} ${_pngdir} ${_docdir} ${_licdir}
  install -Dpm644 ${startdir}/yacas.desktop ${_appdir}/
  install -Dpm644 ${startdir}/yacas-docs.desktop ${_appdir}/
  convert -crop 500x500+34+110 docs/yacaslogo.png ${_pngdir}/yacas.png
  install -Dpm644 AUTHORS INSTALL NEWS README* TODO build/changelog.gz packaging/deb/copyright ${_docdir}/
  install -Dpm644 ${srcdir}/yacas.epub ${pkgdir}/usr/share/yacas/
  install -Dpm644 COPYING ${_licdir}/
  (cd ${_docdir} ; ln -s ../../yacas/yacas.epub .)
}
