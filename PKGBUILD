# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=osmo-svn
pkgver=777
pkgrel=1
pkgdesc="Development version of a handy personal organizer."
arch=('i686' 'x86_64')
url="http://clayo.org/osmo/"
license=('GPL')
depends=('gtk2>=2.10' 'libxml2')
optdepends=('libical' 'libgringotts>=1.2.1' 'libsyncml' 'libnotify')
provides=('osmo')
conflicts=('osmo')
makedepends=('subversion' 'autoconf')

source=()
md5sums=()

_svntrunk=https://osmo-pim.svn.sourceforge.net/svnroot/osmo-pim/trunk
_svnmod=osmo

build() {
  cd ${srcdir}

  msg "Connecting to $_svntrunk ..."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver) || return 1
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod || return 1
  fi
  msg "SVN checkout done or server timeout"

  if [ -d ${_svnmod}-build ]; then
    msg "Deleting old build directory"
    rm -rf ${_svnmod}-build
  fi

  msg "Setting up build environment..."
  cp -r ${_svnmod} ${_svnmod}-build || return 1
  cd ${_svnmod}-build || return 1

  msg "Starting build"

  ./autogen.sh
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
