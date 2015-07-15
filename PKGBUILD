# Maintainer: Fabien Devaux <fdev31 at gmail dot com >
pkgname=python-supplement-git
pkgver=20120119
pkgrel=2
pkgdesc="Python code completion library"
arch=('i686' 'x86_64')
url="http://github.com/baverman/supplement"
license=('MIT')
depends=('python')
makedepends=('python-distribute')

_gitroot="git://github.com/baverman/supplement.git"
_gitname="supplement"

build() {
  cd $srcdir

  msg "Connecting to GIT server..."
  if [[ -d ${_gitname} ]]; then
    (cd ${_gitname} && git pull origin)
  else
    git clone -b py3 --depth=1 ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${_gitname}-build
  cp -r ${_gitname} ${_gitname}-build

  cd ${srcdir}/${_gitname}-build

  python setup.py build
}

package() {
  cd ${srcdir}/${_gitname}-build
  python setup.py install --root=$startdir/pkg

  install -D -m664 LICENSE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -rf ${_gitname}-build
}

# vim:set ts=2 sw=2 et:
