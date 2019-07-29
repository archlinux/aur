# Maintainer: MatMoul <matmoul@gmail.com>

pkgbase=octopi-dev
pkgname=('octopi-dev')
pkgver=0.9.0
pkgrel=2
pkgdesc="A powerful Pacman frontend using Qt5 libs"
pkggit=octopi
_gitcommit=31060ae2b2f7c496c95b2262b8219c39b65e45be
_gitsha256='2eac6062b3589700b0d0e37c601f5bff4ad49dc59847be5950777d7e5a09685c'
arch=('i686' 'x86_64')
url="http://octopiproject.wordpress.com"
license=('GPL2')
depends=('qt5-base' 'qt5-declarative' 'pacman' 'alpm_octopi_utils>=1.0.1-1' 'qtermwidget')
makedepends=('qt5-declarative' 'alpm_octopi_utils' 'clang' 'qtermwidget' 'qt5-tools')
optdepends=('octopi-notifier-qt5: Notifier for Octopi using Qt5 libs'
            'octopi-notifier-frameworks: Notifier for Octopi with Knotifications support'
            'gist: for SysInfo report'
            'pacaur: for AUR support'
            'trizen: for AUR support'
            'pikaur: for AUR support'
            'yay: for AUR support'
            'pacmanlogviewer: to view pacman log files')
provides=('octopi' 'octopi-repoeditor' 'octopi-cachecleaner')
conflicts=('octopi-git' 'octopi-kde-git' 'octopi-notifier-noknotify')

source=("octopi-${pkgver}-${pkgrel}.tar.gz::https://github.com/aarnt/octopi/archive/${_gitcommit}.tar.gz")
sha256sums=(${_gitsha256})

prepare() {
  cd "${srcdir}/${pkggit}-${_gitcommit}"
  
  # set version if beta
  sed -i -e "s|0.10.0 (dev)|${pkgver}-${pkgrel} (git-${_gitcommit:0:6})|g" src/strconstants.cpp
}

build() {
  cpucount=$(grep -c processor /proc/cpuinfo 2>/dev/null)
  cpucount=$((${cpucount:-1}))

  cd "${srcdir}/${pkggit}-${_gitcommit}"

  msg "Starting build..."
  qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" octopi.pro -spec linux-clang
  make -j $cpucount

  cd helper
  msg "Building octopi-helper..."
  qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" octopi-helper.pro -spec linux-clang
  make -j $cpucount

  cd ../repoeditor
  msg "Building octopi-repoeditor..."
  qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" octopi-repoeditor.pro -spec linux-clang
  make -j $cpucount

  cd ../cachecleaner
  msg "Building octopi-cachecleaner..."
  qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" octopi-cachecleaner.pro -spec linux-clang
  make -j $cpucount

  cd ../sudo
  msg "Building octopi-sudo..."
  qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" octopi-sudo.pro -spec linux-clang
  make -j $cpucount
}

package() {
  cd "${srcdir}/${pkggit}-${_gitcommit}"

  make INSTALL_ROOT="${pkgdir}" install

  cd helper
  make INSTALL_ROOT="${pkgdir}" install
  
  cd ../repoeditor
  make INSTALL_ROOT="${pkgdir}" install

  cd ../cachecleaner
  make INSTALL_ROOT="${pkgdir}" install

  cd ../sudo
  make INSTALL_ROOT="${pkgdir}" install
}
 
