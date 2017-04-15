# Maintainer: Rafal Malachowicz <k5hv@archlinux.info>
# Based on qnapi PKGBUILD maintained by: FadeMind <fademind@gmail.com>

_pkgname=qnapi
pkgname=$_pkgname-git
pkgver=0.2.3snapshot.r0.g243281e
pkgrel=1
pkgdesc="Qt5 client for downloading movie subtitles from NapiProjekt, OpenSubtitles, Napisy24"
arch=('i686' 'x86_64' 'armv7h')
url="https://qnapi.github.io/"
license=('GPL2')
depends=('qt5-base' 'libmediainfo' 'p7zip')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=('git+https://github.com/QNapi/qnapi.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  # pre 0.2.3 has been tagged as "snapshot". We'll change it to 0.2.3snapshot
  git describe --long --tags | sed 's/snapshot/0.2.3&/' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${_pkgname}"
  git submodule init
  git submodule update
}

build() {
  cd "${srcdir}/${_pkgname}"
  qmake-qt5 QMAKE_DEFAULT_INCDIRS="" ${_pkgname}.pro 
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make -j2 INSTALL_ROOT="${pkgdir}/" install
  mkdir -p ${pkgdir}/usr/share/{kde4/services,kservices5}/ServiceMenus/
  mv ${pkgdir}/usr/share/doc/${_pkgname}/${_pkgname}-scan.desktop                ${pkgdir}/usr/share/kde4/services/ServiceMenus/${_pkgname}-scan.desktop 
  mv ${pkgdir}/usr/share/doc/${_pkgname}/${_pkgname}-download.desktop            ${pkgdir}/usr/share/kde4/services/ServiceMenus/${_pkgname}-download.desktop
  cp ${pkgdir}/usr/share/kde4/services/ServiceMenus/${_pkgname}-scan.desktop     ${pkgdir}/usr/share/kservices5/ServiceMenus/${_pkgname}-scan.desktop
  cp ${pkgdir}/usr/share/kde4/services/ServiceMenus/${_pkgname}-download.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/${_pkgname}-download.desktop
}
