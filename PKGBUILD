#Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
#Contributor: Zephyr
_pkgbasename=oxygen-gtk2-git
pkgname=lib32-${_pkgbasename}
pkgver=20131016
pkgrel=2
pkgdesc="Port of the Oxygen theme to gtk"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/artwork/oxygen-gtk"
license=('LGPL')
depends=('lib32-gtk2' 'oxygen-gtk2-git')
makedepends=('git' 'cmake' 'gcc-multilib')
conflicts=('lib32-oxygen-gtk2')
provides=('lib32-oxygen-gtk2')
source=()
md5sums=()

_gitroot="git://anongit.kde.org/oxygen-gtk"
_gitname="oxygen-gtk"

build() {
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin && cd ..
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  mkdir build
  cd build

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake ../$_gitname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINSTALL_PATH_GTK_ENGINES=/usr/lib32/gtk-2.0/2.10.0/engines \

  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
  rm -rf "${srcdir}/build"

  rm -rf "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/share"

}
