# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=lldpd-git
pkgver=0.7.13.11
pkgrel=1
pkgdesc="LLDP daemon for GNU/Linux implementing both reception and sending"
arch=('i686' 'x86_64')
url="http://vincentbernat.github.io/lldpd/"
license=('custom:"ISC"')
depends=('libxml2' 'net-snmp' 'libevent' 'libbsd' 'jansson')
makedepends=('git')
provides=('lldpd')
conflicts=('lldpd')
options=('!libtool')
install=lldpd.install
backup=('etc/lldpd.conf')
source=("$pkgname::git+https://github.com/vincentbernat/lldpd.git"
	'lldpd.service'
	'lldpd.install'
	'LICENSE')
md5sums=('SKIP'
         '73eaa8101f84e787138aee3927455c36'
         '18d76cccdbbfed66c9c39232dd5f81ae'
         '8ae98663bac55afe5d989919d296f28a')

pkgver() {
  cd $pkgname
  git describe --tags --always | sed 's|-|.|g;s|[.]g[a-f0-9]*$||'
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --with-snmp \
    --with-xml \
    --with-json \
    --with-privsep-user=lldpd \
    --with-privsep-group=lldpd \
    --with-privsep-chroot=/run/lldpd \
    --with-lldpd-ctl-socket=/run/lldpd.socket \
    --with-lldpd-pid-file=/run/lldpd.pid
  make
  echo "" >>lldpd.conf
  echo "# Place configuration files in this directory: see lldpcli(8)" >README.conf
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 lldpd.conf "$pkgdir/etc/lldpd.conf"
  install -Dm644 README.conf "$pkgdir/etc/lldpd.d/README"
  install -Dm644 ../lldpd.service "$pkgdir/usr/lib/systemd/system/lldpd.service"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
