# Maintainer: MatMoul <matmoul@gmail.com>

pkgbase=octopi-dev
pkgname='octopi-dev'
pkgver=0.9.0
pkgrel=6
pkgdesc="A powerful Pacman frontend using Qt5 libs"
arch=('i686' 'x86_64')
url="http://octopiproject.wordpress.com"
license=('GPL2')
depends=('alpm_octopi_utils>=1.0.1-1' 'qtermwidget' 'sudo')
makedepends=('clang' 'qt5-tools')
optdepends=('octopi-notifier-qt5: Notifier for Octopi using Qt5 libs'
            'octopi-notifier-frameworks: Notifier for Octopi with Knotifications support'
            'pacaur: for AUR support'
            'pikaur: for AUR support'
            'trizen: for AUR support'
            'yay: for AUR support'
            'gist: for SysInfo report'
            'pacmanlogviewer: to view pacman log files')
provides=('octopi' 'octopi-repoeditor' 'octopi-cachecleaner')
conflicts=('octopi')
#conflicts=('octopi-git' 'octopi-kde-git' 'octopi-notifier-noknotify')

_pkggit=octopi
_gitcommit=7c5e3f9f27529f8a372b17611eeec18cf788c8d7

source=("octopi-${pkgver}-${pkgrel}.tar.gz::https://github.com/aarnt/octopi/archive/${_gitcommit}.tar.gz")
sha256sums=('88e3488dcf9035cc754bd4cad34aab8ba68b60f9a19552c63da01738149b472a')

_subdirs=(helper repoeditor cachecleaner sudo)

prepare() {
  cd "${srcdir}/${_pkggit}-${_gitcommit}"
  
  # set version for beta
  sed -i -e "s|0.10.0 (dev)|${pkgver}-${pkgrel} (git-${_gitcommit:0:6})|g" src/strconstants.cpp
}

build() {
  cd "${srcdir}/${_pkggit}-${_gitcommit}"

  echo "Starting build..."
  qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" octopi.pro -spec linux-clang
  make

  for _subdir in ${_subdirs[@]}; do
    pushd $_subdir
    echo "Building octopi-$_subdir..."
    qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" "octopi-$_subdir.pro" -spec linux-clang
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
