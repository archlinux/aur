# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: codestation <codestation404@gmail.com>

pkgbase=qcma-git
pkgname=('qcma-git'
         'qcma-kdenotifier-git'
         'qcma-appindicator-git')
pkgver=v0.3.12.0.g498ebb1
pkgrel=1
pkgdesc="Content Manager Assistant for the PS Vita. (GIT version)"
arch=('i686' 'x86_64')
url='https://github.com/codestation/qcma'
license=('GPL')
makedepends=('git'
             'qt5-tools'
             'qt5-base'
             'libvitamtp'
             'ffmpeg'
             'libnotify'
             'knotifications'
             'libappindicator-gtk2'
             )
source=('git+https://github.com/codestation/qcma.git')
sha1sums=('SKIP')

pkgver() {
  cd qcma
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  lrelease-qt5 "${srcdir}/qcma/common/resources/translations/"*.ts
  qmake-qt5 "${srcdir}/qcma/qcma.pro" PREFIX=/usr CONFIG+="ENABLE_KDENOTIFIER ENABLE_KNOTIFICATIONS ENABLE_APPINDICATOR"
  make
}

package_qcma-git() {
  pkgdesc="Content Manager Assistant for the PS Vita. (GIT Version)"
  depends=('ffmpeg'
           'qt5-base'
           'libnotify'
           'libvitamtp'
           'hicolor-icon-theme'
           )
  conflicts=('qcma')
  provides=('qcma')

  make -C build/common INSTALL_ROOT="${pkgdir}" install
  make -C build/cli INSTALL_ROOT="${pkgdir}" install
  make -C build/gui INSTALL_ROOT="${pkgdir}" install
}

package_qcma-kdenotifier-git() {
  pkgdesc="Content Manager Assistant for the PS Vita. (KDE notifier) (GIT Version)"
  depends=('qcma-git'
           'knotifications'
           )
  conflicts=('qcma-kdenotifier')
  provides=('qcma-kdenotifier')

  make -C build/kdenotifier INSTALL_ROOT="${pkgdir}" install
}

package_qcma-appindicator-git() {
  pkgdesc="Content Manager Assistant for the PS Vita. (appindicator) (GIT Version)"
  depends=('qcma-git'
           'libappindicator-gtk2'
           )
  conflicts=('qcma-appindicator')
  provides=('qcma-appindicator')

  make -C build/appindicator INSTALL_ROOT="${pkgdir}" install
}
