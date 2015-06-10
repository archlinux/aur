# Contributor: ianux <ianux@free.fr>
pkgname=animata-svn
pkgver=63
pkgrel=1
pkgdesc="an open source real-time animation software"
arch=('i686' 'x86_64')
url="http://animata.kibu.hu/"
license=('GPL')
depends=('fltk' 'mesa')
makedepends=('scons')
provides=('animata')
conflicts=('animata')
install=${pkgname}.install
source=('animata.desktop')
sha256sums=('0e12f6321f95080209b95223d9471aea37e20e8b78430ff95eba47a86a3e593a')

_svntrunk=http://animata.googlecode.com/svn/trunk/
_svnmod=animata

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -a ${srcdir}/${_svnmod} ${srcdir}/${_svnmod}-build
  cd ${srcdir}/${_svnmod}-build

  scons PREFIX=/usr
}
package() {
  cd ${srcdir}/${_svnmod}-build

  install -D -m755 ${srcdir}/${_svnmod}-build/build/animata ${pkgdir}/usr/bin/animata
  install -d ${pkgdir}/usr/share/animata
  cp -r ${srcdir}/${_svnmod}-build/examples ${pkgdir}/usr/share/animata
  install -D -m644 ${srcdir}/${_svnmod}-build/data/animata_icon.png ${pkgdir}/usr/share/pixmaps/animata.png
  install -D -m644 ${startdir}/animata.desktop ${pkgdir}/usr/share/applications/animata.desktop

  rm -rf ${srcdir}/${_svnmod}-build
}
