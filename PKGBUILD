# Maintainer: Colin Shea <colin@evaryont.me>
pkgname=fwsnort
pkgver=1.6.3
pkgrel=3
pkgdesc="application layer IDS/IPS by translating snort rules into iptables"
arch=('any')
url="http://www.cipherdyne.org/fwsnort/"
license=('GPL')
# net-tools: sorry, but fwsnort needs ifconfig. Doesn't support iproute yet
depends=('perl' 'perl-netaddr-ip' 'perl-iptables-parse' 'iptables' 'net-tools')
makedepends=('wget')
source=(http://www.cipherdyne.org/$pkgname/download/$pkgname-$pkgver.tar.bz2
        'install_pl.patch')
md5sums=('3e7501e4587a3e33615b604935c75e4e'
         'd7925e3f869ec8decb0e8336801350d6')
options=(emptydirs)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # fix up the installer for our purposes:
  # - removes the root check
  # - includes sbin as another place to check for binares
  # - fixes various paths for utilities & the man page
  patch -p1 -i $srcdir/install_pl.patch

  # -S skips installing the perl modules, which we did with packages
  # and --install-test-dir sets the INSTALL_ROOT to src/../test/fwsnort-test. An
  # easy way to collect all the files into 1
  ./install.pl -S --install-test-dir
}

package() {
  cp -r $srcdir/fwsnort-$pkgver/test/fwsnort-install/* -t $pkgdir
  # delete references to $pkgdir from fwsnort; they were made by the installer
  # as part of installing to the test dir
  cp -f $srcdir/fwsnort-$pkgver/fwsnort.conf $pkgdir/etc/fwsnort/fwsnort.conf

  # avoid a 'warning: directory permissions differ on etc/' line from pacman
  chmod 755 $pkgdir/etc
}

# vim:set ts=2 sw=2 et:
