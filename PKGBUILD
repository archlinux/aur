# Maintainer: MatMoul <matmoul@gmail.com>

_pkggit=octopi
_gitcommit=fd1b3516f40119a3e88de85c4f4fa977c179fdaf
pkgbase=octopi-dev
pkgname='octopi-dev'
pkgver=0.11.0
pkgrel=1
pkgdesc="A powerful Pacman frontend using Qt5 libs"
arch=('i686' 'x86_64')
url="https://tintaescura.com/projects/octopi/"
license=('GPL2')
depends=('alpm_octopi_utils-dev' 'pkgfile' 'qtermwidget' 'sudo')
makedepends=('qt5-tools')
optdepends=('octopi-notifier-qt5: Notifier for Octopi using Qt5 libs'
            'octopi-notifier-frameworks: Notifier for Octopi with Knotifications support'
            'pacaur: for AUR support'
            'pikaur: for AUR support'
            'trizen: for AUR support'
            'yay: for AUR support'
            'pacmanlogviewer: to view pacman log files')
provides=('octopi' 'octopi-repoeditor' 'octopi-cachecleaner')
conflicts=('octopi')
source=("octopi-${pkgver}-${pkgrel}.tar.gz::https://github.com/aarnt/octopi/archive/${_gitcommit}.tar.gz")
sha256sums=('SKIP')

_subdirs=(helper repoeditor cachecleaner sudo)

prepare() {
  cd "${srcdir}/${_pkggit}-${_gitcommit}"
  cp resources/images/octopi_green.png resources/images/octopi.png
}

build() {
  cd "${srcdir}/${_pkggit}-${_gitcommit}"

  echo "Starting build..."
  qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" octopi.pro
  make

  for _subdir in ${_subdirs[@]}; do
    pushd ${_subdir}
    echo "Building octopi-$_subdir..."
    qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" "octopi-$_subdir.pro"
    make
    popd
  done
}

package() {
  cd "${srcdir}/${_pkggit}-${_gitcommit}"
  
  make INSTALL_ROOT="${pkgdir}" install
  
  for _subdir in ${_subdirs[@]}; do
    pushd $_subdir
    make INSTALL_ROOT="${pkgdir}" install
    popd
  done
}
