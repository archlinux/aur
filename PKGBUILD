# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=datovka-git
pkgver=20140930
pkgrel=1
pkgdesc="GUI application allowing access to a 'Databox' - an electronic communication interface endorsed by the Czech government"
arch=('any')
url="https://labs.nic.cz/page/969/datovka/"
license=('GPL2')
depends=('dslib-git' 'pygtk' 'python2-pyasn1' 'python2-sqlalchemy' 'sudsds' 'hicolor-icon-theme')
makedepends=('python2-distribute' 'git')
optdepends=('python-reportlab')
install=$pkgname.install

_gitroot="git://git.nic.cz/datovka/"
_gitname="datovka"

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
