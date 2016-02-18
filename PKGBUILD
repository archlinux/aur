# $Id: PKGBUILD 140478 2015-09-17 20:51:53Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributors:
#   Andrei Antoukh - niwi@niwi.be - http://www.niwi.be
#   henning mueller <henning@orgizm.net>

pkgname=glusterfs34
_pkgname=glusterfs
pkgver=3.4.7
pkgrel=2
pkgdesc='Is a cluster file-system capable of scaling to several peta-bytes. Version 3.4'
arch=(i686 x86_64)
url='http://www.gluster.org/'
license=(GPL2 LGPL3)
install=glusterfs.install
depends=(fuse python2 libxml2 libaio liburcu)
makedepends=(flex bison)
optdepends=('rpcbind: NFS'
	    'glib2: qemu-block')
conflicts=(glusterfs)
#source=($pkgname-$pkgver.tar.gz::https://github.com/gluster/glusterfs/archive/v$pkgver.tar.gz)
source=(https://download.gluster.org/pub/gluster/glusterfs/${pkgver%.?}/$pkgver/glusterfs-$pkgver.tar.gz)
md5sums=('a4d59a87107c87b1cebf0dad2c07b274')

prepare() {
  cd $srcdir/$_pkgname-$pkgver
  find -type f -name '*.py' -exec sed -i \
    -e 's:env\ python:env\ python2:' \
    -e 's:/usr/bin/python:/usr/bin/python2:' {} \;
}

build() {
  cd $srcdir/$_pkgname-$pkgver
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --with-mountutildir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --mandir=/usr/share/man \
    --libexecdir=/usr/lib/$_pkgname \
    --with-systemddir=/usr/lib/systemd/system \
    PYTHON=python2 LEXLIB=
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver

  make -j1 DESTDIR=$pkgdir install

  mkdir -p $pkgdir/usr/lib/tmpfiles.d
  echo "d /var/run/glusterfs 0755 root root -" >$pkgdir/usr/lib/tmpfiles.d/glusterfs.conf

  chmod -x "$pkgdir/usr/lib/systemd/system/glusterd.service"

  install -D -m 644 \
    $srcdir/$_pkgname-$pkgver/{INSTALL,COPYING*} \
    $pkgdir/usr/share/doc/glusterfs/

  cp -rf \
    $srcdir/$_pkgname-$pkgver/doc/* \
    $pkgdir/usr/share/doc/glusterfs/
  rm -rf $pkgdir/var/run
}

# vim:set ts=2 sw=2 et:
