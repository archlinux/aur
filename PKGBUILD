# Maintainer: Lubosz Sarnecki <lubosz at gmail>

pkgname=arx-git
pkgver=20111108
pkgrel=1
pkgdesc='Cross-platform port of Arx Fatalis.'
arch=('i686' 'x86_64')
url='https://github.com/arx/ArxLibertatis'
license=('GPL3')
depends=('sdl' 'devil' 'openal' 'zlib' 'boost' 'glew' 'mesa' 'libgl')
makedepends=('git' 'cmake')
provides=('arx')
conflicts=('arx')
source=()
install=arx.install
md5sums=()

_gitroot="git://github.com/arx/ArxLibertatis.git"
_gitname="ArxLibertatis"

build() {
  cd ${srcdir}/

  msg "Connecting to github...."
  if [[ -d ${srcdir}/${_gitname} ]] ; then
    cd ${_gitname}
    git pull origin
    msg "The local files are updated..."
  else
    git clone ${_gitroot}
  fi

  msg "git clone done."
  
  if [[ -d ${srcdir}/${_gitname}-build ]]; then
    msg "Cleaning the previous build directory..." 
    rm -rf ${srcdir}/${_gitname}-build
  fi

  git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build

  cd ${srcdir}/${_gitname}-build
  
  msg "Starting cmake for: ${pkgname}"
  cmake . \
		-DCMAKE_INSTALL_PREFIX=/usr
   
   make || return 1
}

package() {
  cd ${srcdir}/${_gitname}-build
  make DESTDIR=$pkgdir install || return 1
}

