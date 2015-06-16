# Maintainer: Nikos Skalkoto <skalkoto_at_gmail.com>

pkgname=pyparted-git
pkgver=$(date -u +%Y%m%d%H%M)
pkgrel=1
pkgdesc="Python bindings for libparted"
arch=('any')
url="https://github.com/rhinstaller/pyparted"
license=('GPL2')
depends=('python2' 'parted')
conflicts=('pyparted')
provides=('pyparted')
makedepends=('git')

_gitroot="https://github.com/rhinstaller/pyparted.git"
_gitname="pyparted"

build() {
  cd "${srcdir}"
  msg "Connecting to githug.com server...."

  if [ -d "${srcdir}"/${_gitname} ] ; then
    cd ${_gitname}
    git pull origin
    msg "The local files are updated..."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done."

  if [ -d "${srcdir}"/${_gitname}-build ]; then
     msg "Cleaning the previous build directory..." 
     rm -rf "${srcdir}"/${_gitname}-build
  fi

  git clone "${srcdir}"/${_gitname} "${srcdir}"/${_gitname}-build
  cd "${srcdir}"/${_gitname}-build
  python2 setup.py build
}

package() {
  cd "${srcdir}"/${_gitname}-build
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
}
