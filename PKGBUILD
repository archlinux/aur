# Contributor: Olivier Mehani <shtrom-arch@ssji.net>
# $Id$

pkgname=tspc
pkgver=5.1
pkgrel=1
pkgdesc='Gateway6 client implementation of the Tunnel Setup Protocol from Hexago'
url="http://go6.net/4105/download.asp"
depends=('openssl')
source=('http://go6.net/4105/file.asp?file_id=150' 'debian.patch' 'fix_missing_headers.patch' 'tspc')
md5sums=('5c5205dc58e82454a5d55a3efb4bf786' 'deb1833e122c6ccbc02e04eeec9d200a' 'ea98bbce3ba371e45db7b9535e352363' '2694da554049281765d05104c6f3dfea')
arch=(i686 x86_64)
license=('BSD')

build() {
  cd $startdir/src/tspc-advanced
  patch -p1 < $startdir/src/debian.patch
  cd $startdir/src
  patch -p1 < $startdir/src/fix_missing_headers.patch

  cd $startdir/src/tspc-advanced
  make all target=linux || return 1
  install -D bin/gw6c -m 0755 $startdir/pkg/usr/sbin/tspc

  install -D man/man5/gw6c.conf.5 -m 0644 $startdir/pkg/usr/man/man5/tspc.conf.5
  install -D man/man8/gw6c.8 -m 0644 $startdir/pkg/usr/man/man8/tspc.conf.8
  sed -i "s/gw6c/tspc/g" \
  	$startdir/pkg/usr/man/{man5/tspc.conf.5,/man8/tspc.conf.8}

  install -D template/linux.sh -m 0755 $startdir/pkg/etc/tspc/linux.sh
  install -D bin/gw6c.conf.sample -m 0600 \
  	$startdir/pkg/etc/tspc/tspc.conf
  sed -i -e "s#^gw6_dir=.*#gw6_dir=/usr/sbin\ntsp_dir=/etc/tspc#g" \
  	$startdir/pkg/etc/tspc/tspc.conf
  install -D $startdir/tspc -m 0755 $startdir/pkg/etc/rc.d/tspc
}
