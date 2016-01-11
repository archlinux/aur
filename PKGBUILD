# Maintainer: Rafal Malachowicz <k5hv@archlinux.info>
# Based on qnapi maintained by: FadeMind <fademind@gmail.com>

_pkgname=qnapi
pkgname=$_pkgname-git
pkgver=0.2.1.r0.g4dafdce
pkgrel=1
pkgdesc="Qt5 client for downloading movie subtitles from NapiProjekt, OpenSubtitles, Napisy24"
arch=('i686' 'x86_64')
url="https://qnapi.github.io/"
license=('GPL2')
depends=('qt5-base' 'libmediainfo')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=('git+https://github.com/QNapi/qnapi')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${_pkgname}"
  git submodule init
  git submodule update
}

build() {
    cd "${srcdir}/${_pkgname}"
    qmake-qt5 ${_pkgname}.pro 
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make INSTALL_ROOT="${pkgdir}/" install
    mkdir -p ${pkgdir}/usr/share/{kde4/services,kservices5}/ServiceMenus/
    mv ${pkgdir}/usr/share/doc/${_pkgname}/${_pkgname}-scan.desktop                ${pkgdir}/usr/share/kde4/services/ServiceMenus/${_pkgname}-scan.desktop 
    mv ${pkgdir}/usr/share/doc/${_pkgname}/${_pkgname}-download.desktop            ${pkgdir}/usr/share/kde4/services/ServiceMenus/${_pkgname}-download.desktop
    cp ${pkgdir}/usr/share/kde4/services/ServiceMenus/${_pkgname}-scan.desktop     ${pkgdir}/usr/share/kservices5/ServiceMenus/${_pkgname}-scan.desktop
    cp ${pkgdir}/usr/share/kde4/services/ServiceMenus/${_pkgname}-download.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/${_pkgname}-download.desktop
}
