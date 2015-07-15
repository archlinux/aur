# Maintainer: Fabien Devaux <fdev31 at gmail dot com >
pkgname=python2-uxie-git
pkgver=20111112
pkgrel=1
pkgdesc="PyGtk UX lib"
arch=('i686' 'x86_64')
url="http://github.com/baverman/uxie"
license=('MIT')
depends=('python2' 'pygtk>=2.10' 'pygtksourceview2>=2.10' 'python2-distribute')
makedepends=('python2')

_gitroot="git://github.com/baverman/uxie.git"
_gitname="uxie"

build() {
  cd $srcdir

  msg "Connecting to GIT server..."
  if [[ -d ${_gitname} ]]; then
    (cd ${_gitname} && git pull origin)
  else
    git clone --depth=1 ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${_gitname}-build
  cp -r ${_gitname} ${_gitname}-build

  cd ${srcdir}/${_gitname}-build

  python2 setup.py build
}

package() {
  cd ${srcdir}/${_gitname}-build
  python2 setup.py install --root=$startdir/pkg

  install -D -m664 LICENSE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -rf ${_gitname}-build
}

# vim:set ts=2 sw=2 et:
