# Maintainer: kicka <robertocalabrese75@gmail.com>
# Contributor: cahr_g <cahr.gr@gmail.com>

pkgname=covergloobus-bzr
pkgver=381
pkgrel=1
pkgdesc="a standalone application to see what is playing in the your favourite music player"
arch=('i686' 'x86_64')
url="https://launchpad.net/covergloobus"
license=('GPL3')
depends=('dbus-python' 'pygtk' 'pyxdg' 'sysvinit-tools')
makedepends=('bzr' 'intltool' 'gettext')
options=()
install=${pkgname}.install
source=()
md5sums=()
conflicts=('covergloobus')

_bzrtrunk=lp:covergloobus
_bzrmod=covergloobus

build() {

  msg "Connecting to the server...."
  cd ${srcdir}
  if [ -d "${srcdir}/${_bzrmod}" ] ; then
    cd ${_bzrmod} && bzr pull
    msg "The local files are updated."
  else
    bzr branch ${_bzrtrunk}
    cd ${_bzrmod}
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  # python2 fix
  for file in $(find . -name Makefile -print) src/scripts/covergloobus.in src/scripts/covergloobus-config.in; do
      sed -i 's_python _python2 _' $file
  done

  export PYTHON=python2
  ./autogen.sh --prefix=/usr
  ./configure --prefix=/usr --sysconfdir=/etc
  make

}

package() {
  cd ${srcdir}/${_bzrmod}

  make PREFIX=/usr DESTDIR=${pkgdir} install
}
