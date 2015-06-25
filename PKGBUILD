# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=iproute-mptcp
pkgver=0.88
pkgrel=1
pkgdesc="IP Routing Utilities, with Multipath TCP support"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://multipath-tcp.org/pmwiki.php/Users/Tools"
depends=('glibc' 'iptables')
provides=('iproute2')
conflicts=('iproute2')
options=('staticlibs' '!makeflags')
backup=('etc/iproute2/ematch_map' 'etc/iproute2/rt_dsfield' 'etc/iproute2/rt_protos' \
	'etc/iproute2/rt_realms' 'etc/iproute2/rt_scopes' 'etc/iproute2/rt_tables')
source=("https://github.com/multipath-tcp/$pkgname/archive/v$pkgver.tar.gz"
  "iproute2-fhs.patch"
  "unwanted-link-help.patch")
sha256sums=('4e5fd7bde263a60c7b6da89030e24a6bcc7564cfab1a90b150ea3c92c5efc263'
            '2a1ff211f1fcc57bf92dd3d19190ba72d094c4a4e82d409ba7f80d857778f0df'
            '3f72492554a5417c13b2b6f6222c158319ce91c0b6c25fd651f49add493323a7')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # set correct fhs structure
  patch -Np1 -i "$srcdir/iproute2-fhs.patch"

  # allow operations on links called "h", "he", "hel", "help"
  patch -Np1 -i "$srcdir/unwanted-link-help.patch"

  # do not treat warnings as errors
  sed -i 's/-Werror//' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # libnetlink isn't installed, install it FS#19385
  install -Dm644 include/libnetlink.h "$pkgdir/usr/include/libnetlink.h"
  install -Dm644 lib/libnetlink.a "$pkgdir/usr/lib/libnetlink.a"

  # usrmove
  cd "$pkgdir"
  mv usr/sbin usr/bin
}
