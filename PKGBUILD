# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: codestation <codestation404@gmail.com>

pkgbase=qcma-git
pkgname=('qcma-git' 'qcma-kdenotifier-git')
pkgver=v0.3.9.5.g7ed5bac
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
             )
source=('git+https://github.com/codestation/qcma.git')
sha1sums=('SKIP')

pkgver() {
  cd qcma
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build-qcma
  mkdir -p build-qcma-kdenotifier
}

build() {
  pushd build-qcma &> /dev/null
  lrelease-qt5 ../qcma/resources/translations/*.ts
  qmake-qt5 ../qcma/qcma.pro PREFIX=/usr
  make
  popd &> /dev/null
  pushd build-qcma-kdenotifier &> /dev/null
  lrelease-qt5 ../qcma/resources/translations/*.ts
  qmake-qt5 ../qcma/qcma_kdenotifier.pro PREFIX="/usr" CONFIG+=ENABLE_KNOTIFICATIONS
  popd &> /dev/null
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
  install=qcma-git.install

  make -C build-qcma INSTALL_ROOT="${pkgdir}" install
}

package_qcma-kdenotifier-git() {
  pkgdesc="Content Manager Assistant for the PS Vita. (KDE notifier) (GIT Version)"
  depends=('qcma-git'
           'knotifications'
           )
  conflicts=('qcma-kdenotifier')
  provides=('qcma-kdenotifier')

  make -C build-qcma-kdenotifier INSTALL_ROOT="${pkgdir}" install
}