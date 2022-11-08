# Maintainer: MatMoul <matmoul@gmail.com>

_pkggit=octopi
_gitcommit=0a47127c711c20f9f8f4c42298a25992dbbf98b9
_gitsha256='41cf58d9fd12143e34b75798cc65ad467aed69257c8e04a7b9cbee77ae01d133'

pkgbase=octopi-notifier-frameworks
pkgname=('octopi-notifier-frameworks')
pkgver=0.14.0
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
