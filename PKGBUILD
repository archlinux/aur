# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=lldpd-git
pkgver=0.7.8.5
pkgrel=2
pkgdesc="LLDP daemon for GNU/Linux implementing both reception and sending"
arch=('i686' 'x86_64')
url="https://vincentbernat.github.com/lldpd/"
license=('custom:"ISC"')
depends=('libxml2' 'net-snmp' 'libevent' 'libbsd' 'jansson' 'libseccomp')
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
         'c224d5930aafc6de53b55b97cdc67a40'
         '0b06475bc2048aa29fb1d8c660446f87'
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
    --with-seccomp \
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
