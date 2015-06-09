# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Stefan Husmann <stefan.husmann@t-systems.com>
# Contributor: Stéphane Gaudreault <Stephane.Gaudreault@gmail.com>
# Maintainer : Marcos Heredia <chelqo@gmail.com>

pkgname=yacas
pkgver=1.3.6
pkgrel=1
pkgdesc='Yet another computer algebra system'
url='http://yacas.sourceforge.net/yacas.html'
screenshot='https://dl.dropbox.com/s/dy9evnpl13kdo21/yacas-console.png'
license=('GPL')
groups=("mathematics")
arch=('i686' 'x86_64')
depends=('glibc' 'gcc-libs')
optdepends=('gnuplot' 'lynx' 'texmacs')
makedepends=('gcc' 'perl' 'imagemagick')
install=${pkgname}.install
source=("http://yacas.sourceforge.net/backups/${pkgname}-${pkgver}.tar.gz"
        'yacas.desktop'
        'yacas-docs.desktop')
md5sums=('6c5e3b869c1b13d2f4d02d36da964e8d'  # yacas source
         '21d4cf6e7658aa0d7c4a0ed14c13f2e9'  # yacas.desktop
         '50cb74a345f1580a62047d376f6b54e3') # yacas-docs.desktop

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  msg "### makemake"   ; ./makemake
  msg "### configure"  ; ./configure  --prefix=/usr --mandir=/usr/share/man --enable-server
  msg "### make"       ; make
  msg "### make check" ; make check
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  msg "### instalation " ; make DESTDIR=$pkgdir install
  _appdir=${pkgdir}/usr/share/applications
  _pngdir=${pkgdir}/usr/share/pixmaps
  _docdir=${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
  _licdir=${pkgdir}/usr/share/licenses/${pkgname}
  install -dpm755 ${_appdir} ${_pngdir} ${_docdir} ${_licdir}
  install -Dpm644 ${startdir}/yacas.desktop ${_appdir}/
  install -Dpm644 ${startdir}/yacas-docs.desktop ${_appdir}/
  convert -crop 500x500+34+110 docs/yacaslogo.png ${_pngdir}/yacas.png
  install -Dpm644 AUTHORS ChangeLog INSTALL NEWS README TODO ${_docdir}/
  install -Dpm644 COPYING ${_licdir}/
  (cd ${_docdir} ; ln -s ../../yacas/documentation .)
}
