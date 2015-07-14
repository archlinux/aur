# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=apertium-dbus-svn
pkgver=25849
pkgrel=1
pkgdesc="D-Bus service for apertium"
arch=('i686' 'x86_64')
url="http://wiki.apertium.org/wiki/D-Bus_service_for_Apertium"
license=('GPL2')
depends=('dbus-python' 'apertium')
makedepends=('automake' 'autoconf')
conflicts=('apertium-dbus')
provides=('apertium-dbus')
source=()
md5sums=()

_svntrunk=https://apertium.svn.sourceforge.net/svnroot/apertium/trunk/apertium-dbus
_svnmod=apertium-dbus

build() {
  cd "$srcdir"

  if [ "$(ls -A $_svnmod 2> /dev/null)" ]; then
    (cd $_svnmod && svn update -r $pkgver) || return 1
  else
    svn co ${_svntrunk} ${_svnmod} -r ${pkgver} || return 1
  fi

  msg "SVN checkout done or server timeout"

  cd ${srcdir}/${_svnmod}
  
  sh autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
