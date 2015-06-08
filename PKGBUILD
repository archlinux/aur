# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>
# Contributor: Cvetoslav Ludmiloff <ludmiloff@gmail.com>

pkgname=smokeqt-git
pkgver=20150630
pkgrel=1
pkgdesc="Language independent library for Qt bindings"
url="http://kde.org/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('qimageblitz' 'qscintilla' 'smokegen-git')
makedepends=('cmake' 'automoc4' 'git')
conflicts=('kdebindings-smokeqt')

_gitroot="git://anongit.kde.org/smokeqt"
_gitname="smokeqt"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server"
  
  if [ -d $_gitname ]; then
     cd $_gitname && git pull origin
     msg "The local files are updated."
  else
     git clone $_gitroot $_gitname
     cd "${_gitname}"
  fi
  
  if [ ! -d build ]; then 
    mkdir build
  fi
  
  cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_Qwt5=OFF
    
  numprocs=`cat /proc/cpuinfo | grep processor | wc -l`
  make -j `expr ${numprocs} + 1`
}

package() {
  cd "${_gitname}"/build
  pwd
  make DESTDIR="${pkgdir}" install
}
