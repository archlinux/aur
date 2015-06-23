# $Id: PKGBUILD 6743 2009-12-21 12:17:19Z ibiru $
# Contributor: Yarema aka Knedlyk <yupadmin@gmail.com>

pkgname=em8300-utils-git
pkgver=20111213
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="DXR3 and Hollywood+ driver (testing)"
url="http://dxr3.sourceforge.net/"
license=('GPL2')
makedepends=('gtk2')
optdepends=('gtk2: to use dxr3view, dhc or autocal'
            'perl: to use em8300 scripts')
conflicts=('em8300-utils')
provides=('em8300-utils')
source=()
md5sums=()
#_gitroot=https://github.com/austriancoder/em8300.git
_gitroot=https://github.com/uluckas/em8300.git
_gitname=em8300-utils

build() {
  cd "$srcdir"

  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $srcdir/$_gitname-build
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build 

  ./bootstrap
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1

  install -m 644 -D modules/em8300-udev.rules "${pkgdir}/lib/udev/rules.d/em8300.rules" || return 1
}
