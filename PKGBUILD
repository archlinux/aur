# Maintainer: Adria Arrufat <swiftscythe(at)gmail(dot)com>

pkgname=creox-git
pkgver=20110709
pkgrel=1
pkgdesc="A real-time sound processor. You can plug your electric guitar or any other musical instrument directly to the PC's sound card and start experimenting with various sound effects."
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php?content=142906"
license=('GPL3')
depends=('kdelibs' 'jack')
makedepends=('git' 'cmake>=2.8.0' 'automoc4')
provides=('creox')
conflicts=('creox')
#options=(!strip)

_gitroot="https://github.com/laudrup/Creox4.git"
_gitname="Creox4"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server..."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
  else
    git clone --depth 1 ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf ${srcdir}/${_gitname}-build
  cp -r ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/${_gitname}-build
  make DESTDIR=${pkgdir} install
}
