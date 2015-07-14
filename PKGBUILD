# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=apertium-tolk-svn
pkgver=25848
pkgrel=1
pkgdesc="apertium-tolk is a program that translates as you type, using Apertium"
arch=('i686' 'x86_64')
url="http://wiki.apertium.org/wiki/Apertium-tolk"
license=('GPL2')
depends=('apertium-dbus' 'python>=2.4')
makedepends=('automake' 'autoconf' 'intltool')
conflicts=('apertium-tolk')
source=()
md5sums=()

_svntrunk=https://apertium.svn.sourceforge.net/svnroot/apertium/trunk/apertium-tolk
_svnmod=apertium-tolk

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
