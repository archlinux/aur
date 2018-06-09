# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Judd <jvinet@zeroflux.org>

pkgname=xinetd
pkgver=2.3.15
pkgrel=5
pkgdesc="A secure replacement for inetd"
arch=('x86_64')
url="http://www.xinetd.org/"
license=('custom')
depends=('libtirpc')
optdepends=('perl: for xconv.pl script')
backup=('etc/xinetd.conf' 'etc/xinetd.d/servers' 'etc/xinetd.d/services')
source=("https://sources.archlinux.org/other/packages/$pkgname/$pkgname-$pkgver.tar.gz"
        xinetd.conf
        servers
        services
        xinetd.service
        fix-CVE-2013-4342.patch)
md5sums=('77358478fd58efa6366accae99b8b04c'
         'f109f699a07bc8cfb5791060f5e87f9e'
         '21f47b4aa20921cfaddddd9f9a407f81'
         '9fa2061dc7dd738c8424251deb86f81e'
         '38be35b6e7146dc59902e243d9063b4c'
         'b14615c73753ceffbcc96d5e08f3c18d')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  sed -i "s#${prefix}/man#${prefix}/share/man#" configure
  # fix #37310
  # https://bugzilla.redhat.com/show_bug.cgi?id=1006100#c
  patch -Np1 -i $srcdir/fix-CVE-2013-4342.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin --without-libwrap
  CFLAGS+=' -I/usr/include/tirpc' LDFLAGS+=' -ltirpc' make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr DAEMONDIR=$pkgdir/usr/bin install
  
  install -Dm644 $srcdir/xinetd.conf $pkgdir/etc/xinetd.conf
  install -Dm644 $srcdir/servers $pkgdir/etc/xinetd.d/servers
  install -Dm644 $srcdir/services $pkgdir/etc/xinetd.d/services

  # install systemd files
  install -Dm644 $srcdir/xinetd.service $pkgdir/usr/lib/systemd/system/xinetd.service
  # install license
  install -Dm644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}
