# Maintainer: lukaszimmermann <luk.zim91 at gmail dot com>
# Contributor: saxonbeta <saxonbeta at gmail dot com>
pkgname=openms
_pkgname=OpenMS
pkgver=2.3.0
_pkgver=2.3
pkgrel=1
pkgdesc="C++ library and tools for LC/MS data management and analyses"
arch=('i686' 'x86_64')
url="http://www.openms.de"
license=('BSD')
depends=('boost' 'qt4' 'qtwebkit' 'xerces-c' 'bzip2' 'eigen' 'glpk' 'zlib')
makedepends=('autoconf' 'automake' 'binutils' 'cmake' 'fakeroot' 'gcc' 'make' 'patch')
source=("https://download.sourceforge.net/project/open-ms/${_pkgname}/${_pkgname}-${_pkgver}/${_pkgname}-${pkgver}-src.tar.gz"
        OpenMS-TOPPView.desktop OpenMS-TOPPAS.desktop)
sha256sums=('6ddc56811e1bcb67f28b8c55781229bbe10cc8250b59e76ba1f2a3b52e142ba5'
            '06819f1899b6122d513e67f2427c0c07bab522f859a79b6c7dd56e7d627d0d23'
            '866f5c99e9516af943e06f3407bad6abbb24167f90e351e4727edb2c5cf058cf')
build() {
  cd "${srcdir}/"
  rm -rf ${_pkgname}-${pkgver}-build
  mkdir  ${_pkgname}-${pkgver}-build
  rm -rf contrib-build
  mkdir contrib-build
  cd contrib-build
  cmake -DBUILD_TYPE=SEQAN     $(realpath -P ../${_pkgname}-${pkgver}/contrib)
  cmake -DBUILD_TYPE=LIBSVM    $(realpath -P ../${_pkgname}-${pkgver}/contrib)
  cmake -DBUILD_TYPE=COINOR    $(realpath -P ../${_pkgname}-${pkgver}/contrib)
  cmake -DBUILD_TYPE=KISSFFT   $(realpath -P ../${_pkgname}-${pkgver}/contrib)
  cmake -DBUILD_TYPE=WILDMAGIC $(realpath -P ../${_pkgname}-${pkgver}/contrib)
  cd ../${_pkgname}-${pkgver}-build
  cmake -DCMAKE_BUILD_TYPE=Release -DOPENMS_CONTRIB_LIBS=$(realpath -P ../contrib-build) -DCMAKE_INSTALL_PREFIX=$(realpath -P ${pkgdir}/usr)  $(realpath -P ../${_pkgname}-${pkgver})
  make OpenMS TOPP UTILS GUI
}
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-build"
  make DESTDIR=${pkgdir}/usr install
  install -D -m644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 ${srcdir}/OpenMS-TOPPView.desktop ${pkgdir}/usr/share/applications/OpenMS-TOPPView.desktop
  install -D -m644 ${srcdir}/OpenMS-TOPPAS.desktop ${pkgdir}/usr/share/applications/OpenMS-TOPPAS.desktop
}
