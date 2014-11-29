# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=osmo-svn
pkgver=777
pkgrel=1
pkgdesc="Development version of a handy personal organizer"
arch=('i686' 'x86_64')
url="http://clayo.org/osmo/"
license=('GPL')
depends=('gtk2' 'libxml2')
optdepends=('libical' 'libgringotts' 'libsyncml' 'libnotify')
provides=('osmo')
conflicts=('osmo')
makedepends=('subversion' 'autoconf')

source=()
md5sums=()

_svntrunk=https://svn.code.sf.net/p/osmo-pim/code/trunk
_svnmod=osmo

prepare() {
  cd "${srcdir}"

  msg "Connecting to $_svntrunk ..."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"

  if [ -d ${_svnmod}-build ]; then
    msg "Deleting old build directory"
    rm -rf ${_svnmod}-build
  fi

  msg "Setting up build environment..."
  cp -r ${_svnmod} ${_svnmod}-build
}

build() {
  cd ${_svnmod}-build

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_svnmod}-build

  make DESTDIR="${pkgdir}" install
}
