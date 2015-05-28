# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux at free.fr>                                                                                                     # Contributor: kfgz <kfgz at interia pl>
# Contributor: Kaspar Bumke <kaspar dot bumke at gmail dot com>
# Contributor: maleadt <tim dot besard at gmail dot com>

pkgname="turbovnc"
pkgdesc="An optimized version of TightVNC"
pkgver=1.2.3
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.turbovnc.org/"
license=('GPL')
makedepends=('libjpeg-turbo' 'cmake' 'rsync')
depends=('libxaw' 'libxt' 'libxcursor')
sha256sums=('44d19ea293a72d097733251d70adfe020da245cc84ff121e4232e0cd30a1a368'
            'ccadf1fc708fad601e6113464d6c533a629f6dc9116f6071347cd0b465c1f48b')
conflicts=('turbovnc-bin' 'tigervnc' 'tigervnc-svn' 'tightvnc')
replaces=('turbovnc-bin')
source=(${pkgname}-${pkgver}.tar.gz::http://sourceforge.net/projects/${pkgname}/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download
        vncserver.service)

build() {
  mkdir "${srcdir}"/${pkgname}-${pkgver}/build
  cd "${srcdir}"/${pkgname}-${pkgver}/build
  cmake -G "Unix Makefiles" -DTJPEG_LIBRARY=/usr/lib/libturbojpeg.so -DCMAKE_INSTALL_PREFIX=/usr -DTVNC_DOCDIR=/usr/share/doc/${pkgname} ../
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}/build
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/usr/README.txt "${pkgdir}"/usr/share/doc/turbovnc/README.txt
  install -dm755 "${pkgdir}"/etc
  mv "${pkgdir}"/usr/etc "${pkgdir}"/
  rm -r "${pkgdir}"/etc/init.d
  install -D -m644 "${srcdir}"/vncserver.service "${pkgdir}"/usr/lib/systemd/system/vncserver.service
}
