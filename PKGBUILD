# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Kessia 'even' Pinheiro <kessiapinheiro at gmail.com>

pkgname=specto-bzr
pkgver=176
pkgrel=1
pkgdesc="A desktop application that will watch configurable events"
arch=('any')
url="http://code.launchpad.net/specto"
license=('GPL2')
depends=('python2-notify' 'gnome-python-extras' 'dbus-python' 'pygtk' 'gnome-icon-theme')
makedepends=('bzr' 'librsvg' 'intltool')
conflicts=('specto' 'specto-svn')
provides=('specto')
source=()

_bzrbranch=https://code.launchpad.net/~specto/specto/main
_bzrmod=specto

prepare() {
  cd "${srcdir}"

  msg "Connecting to the server...."

  if [ ! -d ./$_bzrmod ]; then
    bzr co $_bzrbranch $_bzrmod -r ${pkgver}
  else
    bzr up $_bzrmod
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d ./$_bzrmod-build ] && rm -fr ./$_bzrmod-build
  cp -r ./$_bzrmod ./$_bzrmod-build
}

build() {
  cd "${srcdir}"/$_bzrmod-build

  python2 setup.py build
}

package() {
  cd "${srcdir}"/$_bzrmod-build

  python2 setup.py install --prefix=/usr --root="${pkgdir}"
}
