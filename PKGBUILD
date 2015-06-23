# $Id: PKGBUILD 12108 2010-02-27 14:47:28Z ibiru $
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>

pkgname=em8300-hg
pkgver=727
pkgrel=3
pkgdesc="DXR3 and Hollywood+ driver from cgmeiner repo"
arch=('i686' 'x86_64')
url="http://dxr3.sourceforge.net/"
license=('GPL2')
depends=('linux' "em8300-utils-hg=$pkgver")
makedepends=('linux-headers')
install=em8300.install
conflicts=('em8300')
provides=('em8300')
source=('mutex.patch')

_hgroot=http://hg.assembla.com/
_hgrepo=em8300-cgmeiner

build() {
    cd $srcdir

    if [ -d ${_hgrepo} ]; then
        cd ${startdir}/src/${_hgrepo}
        hg pull -u
    else
	hg clone ${_hgroot}${_hgrepo} || return 1
# same but fixing changeset:
#	hg clone ${_hgroot}${_hgrepo} -r $pkgver || return     
    fi

    msg "Mercurial clone done or server timeout"
    msg "Starting make..."

    rm -rf $srcdir/$_hgrepo-build
    cp -rf $srcdir/$_hgrepo $srcdir/$_hgrepo-build
    cd $srcdir/$_hgrepo-build/modules
    sed -e  's:#include <linux/videodev.h://#/include <linux/videodev.h:' -i  *.c
    patch -p2 < $srcdir/mutex.patch
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  chmod 644 $pkgdir/lib/modules/*/em8300/*.ko
}
md5sums=('9ab5168b2bfbd4da783e62e4e4280672')
