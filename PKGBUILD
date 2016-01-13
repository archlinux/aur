# Maintainer:  max.bra <max dot bra at alice dot it>

pkgname=pi-hole-server
_pkgname=pi-hole
pkgver=2.2
pkgrel=1
pkgdesc='The Pi-hole is an advertising-aware DNS/Web server. Arch adaptation for lan wide DNS server.'
arch=('any')
license=('GPL2')
url="https://github.com/jacobsalmela/pi-hole"
depends=('cron' 'dnsmasq' 'lighttpd' 'php-cgi')
conflicts=('pi-hole-server')
install=$pkgname.install

source=(https://github.com/jacobsalmela/$_pkgname/archive/v$pkgver.tar.gz
	https://github.com/jacobsalmela/AdminLTE/archive/master.zip
	https://raw.githubusercontent.com/jacobsalmela/pi-hole/master/advanced/index.html
	configuration
	dnsmasq.include
	dnsmasq.complete
	lighttpd.conf
	pi-hole.tmpfile
	$_pkgname-daily.cron
	$_pkgname-weekly.cron
	whitelist.txt
	blacklist.txt)

md5sums=('8387d55bc37b661827ad614701157b19'
         '807c8cd98cfba066dac9b16ff0e08c8e'
         '58d5c6d200e4bdf990e04d7dbfc3cf57'
         'c01b982f3ef13c5fe140cc242a3b627b'
         'fd607f890103e97e480d814a5dfbee5b'
         '06bb49cf66cc1db8be5e476a54b1e933'
         '4f5f6076d358c1375525e6ab481dfb7d'
         '564f47c5cfab0a1b7b010ddbcf8e3b84'
         '8f99cfaae99f1542788dfbd7a39b5603'
         'a2d0530954e8eb19592f686e29c24c45'
         '534de24fb56acfd3b451cf4b1b382218'
         '534de24fb56acfd3b451cf4b1b382218')

prepare() {
  # modify service management
  sed -i 's|^		sudo service dnsmasq start|		systemctl start dnsmasq|' "$srcdir"/$_pkgname-$pkgver/gravity.sh

  # change log location in admin php interface
  sed -i 's|/var/log/pihole.log|/run/log/pihole.log|' "$srcdir"/AdminLTE-master/index.php
  sed -i 's|/var/log/pihole.log|/run/log/pihole.log|' "$srcdir"/AdminLTE-master/api.php
}

package() {
  cd "$srcdir"
  install -Dm755 ./$_pkgname-$pkgver/gravity.sh "$pkgdir"/usr/bin/gravity.sh || return 1
  install -Dm755 $_pkgname-daily.cron "$pkgdir"/etc/cron.daily/$_pkgname-daily || return 1
  install -Dm755 $_pkgname-weekly.cron "$pkgdir"/etc/cron.weekly/$_pkgname-weekly || return 1
  install -Dm644 pi-hole.tmpfile "$pkgdir"/etc/tmpfiles.d/pi-hole.conf || return 1

  install -dm777 "$pkgdir"/etc/pihole
  install -dm755 "$pkgdir"/etc/pihole/configs
  install -Dm644 whitelist.txt "$pkgdir"/etc/pihole/whitelist.txt || return 1
  install -Dm644 blacklist.txt "$pkgdir"/etc/pihole/blacklist.txt || return 1
  install -Dm644 dnsmasq.complete "$pkgdir"/etc/pihole/configs/dnsmasq.complete || return 1
  install -Dm644 dnsmasq.include "$pkgdir"/etc/pihole/configs/dnsmasq.include || return 1
  install -Dm644 lighttpd.conf "$pkgdir"/etc/pihole/configs/lighttpd.conf || return 1
  install -Dm644 configuration "$pkgdir"/usr/share/doc/pihole/configuration || return 1

  install -dm755 "$pkgdir"/srv/http/pihole/admin || return 1
  install -Dm644 index.html "$pkgdir"/srv/http/pihole/index.html || return 1
  cp -dpr --no-preserve=ownership AdminLTE-master/* "$pkgdir"/srv/http/pihole/admin/
}

