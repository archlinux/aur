# Submitter: Carlos Eduardo Moreira dos Santos (cemsbr) <cems at domain cemshost.com.br>
# Contributor: Javier ‘Phrodo_00‘ Aravena <phrodo.00@gmail.com>
# Mantainer: iosonofabio Fabio Zanini <fabio.zanini@fastmail.fm>

pkgname=bzr-gtk-bzr
pkgver=20110404
pkgrel=1
pkgdesc="Plugin for Bazaar that aims to provide GTK+ interfaces to most Bazaar operations. It downloads source from launchpad bazaar repository, using the last commit."
arch=('i686' 'x86_64')
url="http://bazaar-vcs.org/bzr-gtk"
license=('GPL')
depends=('pygtk' 'bzr' 'pycairo' 'libglade' 'bzr-stats')
provides=('bzr-gtk')
conflicts=('bzr-gtk')

_bzrname="bzr-gtk"

build() {
  cd "${srcdir}"

  msg "Connecting to bazaar server..."

  # Download last commit
  if [ -d ${_bzrname} ] ; then
    rm -rf ${_bzrname}
  fi
  bzr checkout --lightweight "lp:${_bzrname}"

  msg "bazaar checkout done or server timeout"

  cd "${_bzrname}"

  # Replace python with python2
  for file in $(find ./ -name '*.py' -print); do
      sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
      sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  msg "Ready to install..."

  # Install
  python2 setup.py install --prefix'=/usr' --root="${startdir}/pkg"
}
