# $Id$
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=mip6d-mcoa
_umipname=mipv6-daemon-umip
pkgver=0.4
_neplrel=20090624
_mcoarel=20090624
pkgrel=1
pkgdesc="UMIP userland with NEPL and MCoA patches for Mobile IPv6/NEMO operation with multihoming"
arch=(i686 x86_64)
url="http://www.nautilus6.org/doc/nepl-howto/nepl-howto.html"
license=('GPL' 'custom')
depends=('kernel26-mipl')
makedepends=(indent)
provides=(mip6d)
optdepends=('radvd: to act as a NEMO Mobile Router advertising a MNP on the mobile link')
backup=(etc/mip6d/mip6d.conf etc/conf.d/mip6d.conf)
source=(ftp://ftp.linux-ipv6.org/pub/usagi/patch/mipv6/umip-${pkgver}/daemon/tarball/${_umipname}-${pkgver}.tar.gz
        http://www.nautilus6.org/doc/nepl-howto/umip-nepl/${_umipname}-${pkgver}-nepl-${_neplrel}.patch
        http://www.nautilus6.org/doc/nepl-howto/umip-nepl/${_umipname}-${pkgver}-nepl-mcoa-${_mcoarel}.patch
        mip6d.init
        mip6d.confd)
md5sums=('a8ebeb4f41ceed71037d0f5596ccc11d'
         '501861f2d537377dc0f52f7a3e1b7314'
         'd387155494f5224b780c41c0e1acd588'
         '6995ae716fc0f66040ee528c291f08df'
         'efbe23915c7dcf018ce70bcf72d18be7')

build() {
  cd "$srcdir/${_umipname}-${pkgver}"

  patch -p 1 < $srcdir/${_umipname}-${pkgver}-nepl-${_neplrel}.patch
  patch -p 1 < $srcdir/${_umipname}-${pkgver}-nepl-mcoa-${_neplrel}.patch
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
