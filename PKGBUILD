# Maintainer: Vianney le Clément de Saint-Marcq <vleclement AT gmail · com>
# Contributor: Michael Klier <chi@chimeric.de>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
pkgname=upslug2-openwrt
pkgver=41
pkgrel=4
pkgdesc="A tool to flash your NSLU2 (Slug) from a computer on a local network. (With OpenWRT patches)"
url="http://www.nslu2-linux.org/wiki/Main/UpSlug2"
depends=('gcc-libs')
makedepends=('subversion')
arch=('i686' 'x86_64')
license=('custom')
source=("upslug2::svn+http://svn.nslu2-linux.org/svnroot/upslug2/trunk#revision=$pkgver"
        "100-libpcap_fix.patch"
        "110-wrt350nv2_support.patch")
md5sums=('SKIP'
         'd50d808f117361f18bbe0726a73b40e2'
         '80e4028a3c79dd4ac5dde263015d6063')

prepare() {
  cd "$srcdir/upslug2"
  patch -p1 < "$srcdir/100-libpcap_fix.patch"
  patch -p1 < "$srcdir/110-wrt350nv2_support.patch"
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac
}

build() {
  cd "$srcdir/upslug2"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/upslug2"
  make install DESTDIR="$pkgdir"
  install -Dm644 upslug2.8 "$pkgdir/usr/share/man/man8/upslug2.8"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
