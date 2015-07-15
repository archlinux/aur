# Maintainer: Andrés Rodríguez - mixedCase <andres.rodriguez __at__ lithersoft.com>

pkgname=python2-buildozer-git
pkgver=20150303
pkgrel=1
pkgdesc="Generic Python packager for Android / iOS and Desktop"
url="https://github.com/kivy/buildozer"
arch=('any')
license=('MIT')
install=''
source=()
depends=('python2' 'python2-pexpect' 'python2-markupsafe')
optdepends=()
conflicts=()
provides=''
makedepends=('cmake' 'libusb>=1.0')

_gitname="buildozer"
_gitroot="https://github.com/kivy/${_gitname}.git"
 
 
build() {
  cd $srcdir
  msg "Connecting to GIT (${_gitroot}) ..."
 
  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin
    msg "The local files of ${_gitname} were updated."
  else
    git clone $_gitroot $_gitname
  fi  
 
  msg "GIT checkout done or server timeout"
 
  cd $srcdir/${_gitname}/
  msg 'Fixing Cython version...'
  find . -type f -print0 | xargs -0 sed -i 's#Cython#Cython2#g'
  find . -type f -print0 | xargs -0 sed -i 's#cython#cython2#g'

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
  python2 setup.py build
}
 
package() {
    cd $srcdir/${_gitname}
    python2 setup.py install -f --root="$pkgdir"
}
