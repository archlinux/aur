# Maintainer: Greg White <sgwhite-at-kupulau-dot-com>

pkgname=yakuake-copy-paste-git
pkgver=20140827.1
pkgrel=1
pkgdesc="A KDE konsole application with the look and feel of that in the Quake engine - GIT version (patched to use Alt+V for paste/Alt+K to clear scrollback)"
arch=('i686' 'x86_64')
url="http://yakuake.kde.org"
license=('GPL')
depends=('kdebase-konsole')
makedepends=('cmake' 'automoc4' 'git')
install="${pkgname}.install"
provides=('yakuake')
conflicts=('yakuake')

_gitroot="git://anongit.kde.org/yakuake.git"
_gitname="yakuake"

source=('copy_paste.patch')
md5sums=('63ab645ca81a8c2913db0cf9eaab7d5d')


build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname}/.git ] ; then
    cd ${_gitname}

    # Change remote url to anongit
    if [ -z $( git branch -v | grep anongit ) ] ; then
        git remote set-url origin ${_gitroot}
    fi
    
    git fetch --all
    git reset --hard origin/master  
    #git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}
  patch -p1 --verbose -i $srcdir/copy_paste.patch 
  mkdir -p build
  cd build
  cmake ../${_gitname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
