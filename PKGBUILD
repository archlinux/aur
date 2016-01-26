# Contributor: Thiago Coutinho <root at thiagoc . net>
pkgname=xtables-addons
pkgver=2.10
pkgrel=1
pkgdesc="Successor to patch-o-matic(-ng). Additional extensions for iptables, ip6tables, etc. CHAOS, TARPIT, TEE, DELUDE and other targets; condition, geoip, ipp2p and other matches. Includes ipset package."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://xtables-addons.sourceforge.net/"
depends=('iptables>=1.4.5' 'glibc' 'linux>=3.7')
makedepends=('linux-api-headers' 'linux-headers')
conflicts=(ipset)
replaces=(ipset)
provides=(ipset)
install='xtables-addons.install'
source=(http://sourceforge.net/projects/${pkgname}/files/Xtables-addons/$pkgname-$pkgver.tar.xz)
md5sums=('727bf0dd4a3d9c65724267bd0d5d80b0')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure \
      --prefix=/usr \
      --libexecdir=/usr/lib/iptables \
      --sysconfdir=/etc \
      --with-xtlibdir=/usr/lib/iptables \
      --mandir=/usr/share/man
  make
}

package () {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  mv $pkgdir/lib/* $pkgdir/usr/lib/
  mv $pkgdir/usr/lib/modules/$(uname -r)/extra $pkgdir/usr/lib/modules/$(uname -r)/$(readlink /usr/lib/modules/$(uname -r)/extramodules)
  rmdir $pkgdir/lib
  mv $pkgdir/usr/sbin $pkgdir/usr/bin
  chmod a-x $pkgdir/usr/lib/iptables/*.so
}
