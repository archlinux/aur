# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Judd <jvinet@zeroflux.org>

pkgname=xinetd
pkgver=2.3.15.4
pkgrel=1
pkgdesc="A secure replacement for inetd"
arch=('x86_64')
url="https://github.com/openSUSE/xinetd"
license=('custom')
depends=('libtirpc')
optdepends=('perl: for xconv.pl script')
backup=('etc/xinetd.conf' 'etc/xinetd.d/servers' 'etc/xinetd.d/services')
source=("https://github.com/openSUSE/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
        xinetd.conf
        servers
        services
        xinetd.service)
sha256sums=('2baa581010bc70361abdfa37f121e92aeb9c5ce67f9a71913cebd69359cc9654'
            '389a043503b287a1d096444b7da90c5187388a886687129c125135090bc2c86e'
            '707a89ec32822f6d146b6ed3d43a38fee909b33d973f6ab7e9742ca8bc9f55f6'
            '7f709257b08cb19f0a7066d1de6996bfe7c8c510546d11106512a19a76ccf540'
            'fa9ffd5ecf71e2dbd6e8cf57eb040ff6ea349420707a7f3c7850974774f7a18d')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --without-libwrap
  CFLAGS+=' -I/usr/include/tirpc' LDFLAGS+=' -ltirpc' make
}

package() {
  cd $pkgname-$pkgver
  make prefix="$pkgdir/usr" sbindir="$pkgdir/usr/bin" sysconfdir="$pkgdir/etc" install
  
  install -Dm644 "$srcdir"/xinetd.conf "$pkgdir"/etc/xinetd.conf
  install -Dm644 "$srcdir"/servers "$pkgdir"/etc/xinetd.d/servers
  install -Dm644 "$srcdir"/services "$pkgdir"/etc/xinetd.d/services

  # install systemd files
  install -Dm644 "$srcdir"/xinetd.service "$pkgdir"/usr/lib/systemd/system/xinetd.service
  # install license
  install -Dm644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/COPYRIGHT
}
