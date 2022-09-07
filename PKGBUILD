# Maintainer: Francois Rigaut <frigaut@gmail.com>

pkgname=yorick-git
pkgver=20200916
_pkgmajver=2.2
pkgrel=1
pkgdesc="Interpreted language for data processing"
arch=('i686' 'x86_64')
license=('BSD')
url="http://yorick.sourceforge.net"
groups=('science' 'yorick-all')
depends=('glibc' 'rlwrap')
makedepends=('git')
provides=('yorick')
conflicts=('yorick')
replaces=('yorick')
source=(https://raw.githubusercontent.com/frigaut/frigaut-arch-abs-files/master/yorick-git-xft.patch)
md5sums=('ada3b2618196bb908f23175f79970b48')

_gitroot="https://github.com/LLNL/yorick.git"
_gitname="yorick"

build() {
  cd ${srcdir}
  msg "Connecting to git repo..."
  if [ -d ${srcdir}/$_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
  else
      git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting script install..."

  git clone $_gitname $_gitname-build
  cd ${srcdir}/$_gitname-build

  # XFT patch. 2010nov02 version. Fixed some bugs.
  # patch -p1 < ../yorick-cvs-xft-2012sep11.patch
  patch -p1 < ../yorick-git-xft.patch

  make prefix=/usr ysite || return 1

  make config
# 2010sep17: removed next 4 lines (see above for xft patch)
  echo 'COPT_DEFAULT=-O2' >> Make.cfg
  echo 'Y_CFLAGS=-DHAVE_XFT' >> Make.cfg
  echo 'XINC=-I/usr/include/freetype2' >> Make.cfg
  echo 'XLIB=-lXft' >> Make.cfg
  echo 'X11LIB=$(XLIB) -lX11 -lfontconfig' >> Make.cfg

  make

  # build wrapper to start rlwrap yorick
  echo "#!/bin/sh" > yorick_wrapper
  echo "exec rlwrap -s 2000 -c /usr/lib/yorick/${_pkgmajver}/bin/yorick \$*" >> yorick_wrapper
}

package() {
  cd ${srcdir}/$_gitname-build
  make INSTALL_ROOT=${pkgdir} install || return 1
  install -DTm755 ./yorick_wrapper ${pkgdir}/usr/bin/yorick
}
