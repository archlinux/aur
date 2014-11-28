# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=dslib-git
pkgver=20140930
pkgrel=1
pkgdesc="Free Python library for accessing Datove schranky"
arch=('any')
url="https://labs.nic.cz/page/969/datovka/"
license=('LGPL')
depends=('python2-pyopenssl')
makedepends=('python2-setuptools' 'git')

_gitroot="git://git.nic.cz/dslib/"
_gitname="dslib"

package() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}"/$_gitname-build
  git clone "${srcdir}"/$_gitname "${srcdir}"/$_gitname-build
  cd "${srcdir}"/$_gitname-build

#Python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  python2 setup.py install --root="${pkgdir}"
}
