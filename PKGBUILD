# Maintainer: Michael Düll <mail@akurei.me> PGP-Key: C0DEA350

pkgname=python2-potr-git
pkgver=20140219
pkgrel=1
pkgdesc="A pure python implementation of the OTR encryption protocol. GIT version."
arch=(any)
url="http://python-otr.pentabarf.de/"
license=('LGPL')
depends=('python2' 'python2-crypto')
makedepends=('git')
provides=('python-potr')
conflicts=('python-potr' 'python-potr-git')
replaces=('python-potr-git')

_gitroot=git://github.com/afflux/pure-python-otr.git
_gitname=pure-python-otr

PYTHON=`which python2`


prepare() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin 
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  set_python2
}

package() {
  cd "$srcdir/$_gitname-build"
  $PYTHON setup.py install --root=$pkgdir/
}

# To use python2 instead of default python v3.
set_python2() {
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' "${file}"
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' "${file}"
  done
}

# vim:set ts=2 sw=2 et:
