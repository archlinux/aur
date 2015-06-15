# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: iosonofabio Fabio Zanini <fabio.zanini@fastmail.fm>
# Contributor: Javier ‘Phrodo_00‘ Aravena <phrodo.00@gmail.com>
# Submitter: Carlos Eduardo Moreira dos Santos (cemsbr) <cems at domain cemshost.com.br>

pkgname=bzr-gtk-bzr
_pkgname=bzr-gtk
pkgver=r796
pkgrel=1
pkgdesc="Plugin for Bazaar that aims to provide GTK+ interfaces to most Bazaar operations. It downloads source from launchpad bazaar repository, using the last commit."
arch=('any')
url="http://bazaar-vcs.org/bzr-gtk"
license=('GPL')
depends=('pygtk' 'bzr' 'pycairo' 'libglade'
         'desktop-file-utils' 'gtk-update-icon-cache')
#makedepends=('bzr' 'bzr-stats')
makedepends=('bzr') # bzr-stats currently not used due to workaround
provides=('bzr-gtk')
conflicts=('bzr-gtk')
install=${_pkgname}.install
source=("$_pkgname::bzr+http://bazaar.launchpad.net/~$_pkgname/$_pkgname/gtk3/"
        'no_credits.patch')
sha256sums=('SKIP'
            'de6273817a433d3c2e64ed0f8339c7a3cdc60fec60772a6d57b4c14f94cb2cdf')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  # Replace python with python2
  for file in $(find ./ -name '*.py' -print); do
      sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
      sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
  patch -p0 < ../no_credits.patch
}

build() {
  cd "$srcdir/$_pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --skip-build --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
