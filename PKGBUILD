pkgname=em8300-git
pkgver=20121113
pkgrel=1
pkgdesc="DXR3 and Hollywood+ driver from uluckas repo"
arch=('i686' 'x86_64')
url="http://dxr3.sourceforge.net/"
license=('GPL2')
depends=('linux<=3.4.6' "em8300-utils-git")
makedepends=('linux-headers')
install=em8300.install
conflicts=('em8300')
provides=('em8300')
source=('linmodule.patch')

#_gitroot=https://github.com/austriancoder/v4l2-em8300.git
_gitroot=https://github.com/uluckas/em8300.git
_gitname=em8300

build() {
  cd "$srcdir"

  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $startdir/src/${_gitname} ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $srcdir/$_gitname-build
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build/modules
  patch -p2 < $srcdir/linmodule.patch
#    sed -e  's:#include <linux/videodev.h://#/include <linux/videodev.h:' -i  *.c
  sed -i Makefile -e 's/.\/update_em8300_version.sh\ \$\@/sh\ .\/update_em8300_version.sh\ \$\@/'
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  chmod 644 $pkgdir/lib/modules/*/em8300/*.ko
}
md5sums=('788049fb54f578900bb99253b37becdb')
