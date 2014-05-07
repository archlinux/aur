# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=lldpd-git
pkgver=0.7.8.6
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
         '76d6b0e0d5d0de3718dbca898d0db270'
         '8ae98663bac55afe5d989919d296f28a')

pkgver() {
  cd $pkgname
  git describe --tags --always | sed 's|-|.|g;s|[.]g[a-f0-9]*$||'
}

prepare() {
  cd $pkgname
  sed -e '/LLDPD_CTL_SOCKET/s,/var/run,/run,' -i src/ctl.h
  sed -e '/LLDPD_PID_FILE/s,/var/run,/run,' -i src/daemon/lldpd.h
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
    --with-privsep-chroot=/run/lldpd
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
