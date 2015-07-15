# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (at) gmail.com>
# Contributor: alexwizard

pkgname=libkdeedu-git
_realname=libkdeedu
pkgver=20110405
pkgrel=1
pkgdesc="Libraries used by KDE Education applications"
arch=('i686' 'x86_64')
url="http://edu.kde.org/"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4' 'git' 'docbook-xsl')
provides=(${_realname})
conflicts=(${_realname})
md5sums=()

_gitroot="git://anongit.kde.org/${_realname}"
_gitname=${_realname}
 
build() {
  cd ${srcdir}

  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/build
  git clone ${srcdir}/${_gitname} ${srcdir}/build
  cd ${srcdir}/build
 
  cmake . -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
