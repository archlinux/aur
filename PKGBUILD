# $Id$
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=mip6d-umip.org-git
_umipname=mipv6-daemon-umip
pkgver=20100219
pkgrel=1
pkgdesc="UMIP userland with NEPL and MCoA patches for Mobile IPv6/NEMO operation with multihoming"
arch=(i686 x86_64)
url="http://www.umip.org"
license=('GPL' 'custom')
depends=('kernel26-mipl')
makedepends=(indent)
provides=(mip6d)
optdepends=('radvd: to act as a NEMO Mobile Router advertising a MNP on the mobile link')
backup=(etc/mip6d/mip6d.conf etc/conf.d/mip6d.conf)
source=(mip6d.init
        mip6d.confd)
md5sums=('6995ae716fc0f66040ee528c291f08df'
         'efbe23915c7dcf018ce70bcf72d18be7')

_gitroot="http://umip.org/git/umip.git/"
_gitname="umip"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot}
    cd ${_gitname}
  fi


  autoreconf -i 
  ./configure --prefix=/usr --enable-vt
  make CFLAGS=-DNULL=0 || return 1
  make DESTDIR="$pkgdir/" install

  for file in extras/example-*.conf; do
    install -D -m 0644 $file $pkgdir/etc/mip6d/${file/extras\/example/mip6d}
  done
  install -m 0644 $pkgdir/etc/mip6d/mip6d-mn.conf $pkgdir/etc/mip6d/mip6d.conf

  install -D -m 0755 $srcdir/mip6d.init $pkgdir/etc/rc.d/mip6d
  install -D -m 0644 $srcdir/mip6d.confd $pkgdir/etc/conf.d/mip6d.conf

  install -d $pkgdir/usr/share/licenses/${pkgname}
  install -m 0644 COPYING* licenses/*.txt $pkgdir/usr/share/licenses/${pkgname}
}

# vim:set ts=2 sw=2 et:
