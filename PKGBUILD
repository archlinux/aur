# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=youbot_driver-git
pkgver=20150530
pkgrel=1
pkgdesc="Drivers for the KUKA youBot robot"
arch=('i686' 'x86_64')
url="http://www.youbot-store.com/"
license=('LGPL' 'BSD')
depends=('boost-libs')
makedepends=('git' 'cmake' 'boost')
provides=('youbot-driver')
conflicts=('youbot-driver')

_gitroot="https://github.com/svenschneider/youbot_driver.git"
_gitname="youbot_driver"
_gitbranch="ethercat_injection"

prepare() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone -b ${_gitbranch} ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
}

build() {
  cd "${srcdir}/${_gitname}-build/"

  sed "s/ADD_LIBRARY(soem/ADD_LIBRARY(soem SHARED/g" -i src/soem/CMakeLists.txt
  sed "s/add_library(YouBotDriver/add_library(YouBotDriver SHARED/g" -i CMakeLists.txt
	
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/${_gitname}-build/"
	
  make DESTDIR="${pkgdir}" install
}

