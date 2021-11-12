# Maintainer: MatMoul <matmoul@gmail.com>

_pkggit=octopi
_gitcommit=6fd963066f255e877e4a88dc2f68012e54ef8c38
_gitsha256='a8439d2cf662dea581d95a209dde66bd21cd00b2429a4cd46cbe0eb5434259a6'

pkgbase=octopi-notifier-frameworks
pkgname=('octopi-notifier-frameworks')
pkgver=0.12.0
pkgrel=2
pkgdesc="Notifier for Octopi with Knotifications support"
arch=('i686' 'x86_64')
url="https://tintaescura.com/projects/octopi/"
license=('GPL2')
depends=('octopi' 'knotifications')
makedepends=('qt5-tools')
provides=('octopi-notifier')
conflicts=('octopi-notifier-qt5')
source=("octopi-${pkgver}-${pkgrel}.tar.gz::https://github.com/aarnt/octopi/archive/${_gitcommit}.tar.gz")
sha256sums=(${_gitsha256})

prepare() {
  cd "${srcdir}/${_pkggit}-${_gitcommit}"
  
  # set Knotifications
  sed -e "s|DEFINES += ALPM_BACKEND #KSTATUS|DEFINES += ALPM_BACKEND KSTATUS|" -i notifier/octopi-notifier.pro
}

build() {
  cd "${srcdir}/${_pkggit}-${_gitcommit}"
  
  msg "Building octopi-notifier..."
  cd notifier
  qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" octopi-notifier.pro
  make
}

package() {
  cd "${srcdir}/${_pkggit}-${_gitcommit}"
  
  cd notifier
  make INSTALL_ROOT="${pkgdir}" install
}
