# Maintainer:
# Contributor: Judd <jvinet@zeroflux.org>

pkgname=xinetd
pkgver=2.3.14
pkgrel=6
pkgdesc="a secure replacement for inetd"
arch=('i686' 'x86_64')
url="http://www.xinetd.org/"
license=('custom')
depends=('tcp_wrappers')
optdepends=('perl: for xconv.pl script')
backup=('etc/xinetd.conf' 'etc/xinetd.d/servers' 'etc/xinetd.d/services')
source=(http://www.xinetd.org/xinetd-$pkgver.tar.gz
        xinetd.conf
        xinetd
        servers
        services)
md5sums=('567382d7972613090215c6c54f9b82d9'
         'f109f699a07bc8cfb5791060f5e87f9e'
         'ea37a2794f202e6b953d9b6956dad16a'
         '21f47b4aa20921cfaddddd9f9a407f81'
         '9fa2061dc7dd738c8424251deb86f81e')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i "s#${prefix}/man#${prefix}/share/man#" configure
  ./configure --prefix=/usr --with-libwrap
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr install
  
  install -Dm755 $srcdir/xinetd $pkgdir/etc/rc.d/xinetd
  install -Dm644 $srcdir/xinetd.conf $pkgdir/etc/xinetd.conf
  install -Dm644 $srcdir/servers $pkgdir/etc/xinetd.d/servers
  install -Dm644 $srcdir/services $pkgdir/etc/xinetd.d/services

  # install license
  install -Dm644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}
