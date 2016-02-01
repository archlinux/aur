# Maintainer:  max.bra <max dot bra at alice dot it>

pkgname=pi-hole-server
_pkgname=pi-hole
pkgver=2.4
pkgrel=3
_wwwpkgname=AdminLTE
_wwwpkgver=1.0.0
pkgdesc='The Pi-hole is an advertising-aware DNS/Web server. Arch adaptation for lan wide DNS server.'
arch=('any')
license=('GPL2')
url="https://github.com/jacobsalmela/pi-hole"
depends=('cron' 'dnsmasq' 'lighttpd' 'php-cgi' 'bc' 'figlet')
conflicts=('pi-hole-server')
install=$pkgname.install

source=(https://github.com/jacobsalmela/$_pkgname/archive/v$pkgver.tar.gz
	https://github.com/pi-hole/AdminLTE/archive/v1.0.0.tar.gz
	configuration
	dnsmasq.include
	dnsmasq.complete
	lighttpd.conf
	pi-hole.tmpfile
	$_pkgname-daily.cron
	$_pkgname-weekly.cron
	whitelist.txt
	blacklist.txt)

md5sums=('b051dc1bd79182262336ce8bc11fb816'
         'a2ec5ea92cce506f0fc61cc0a8f2c527'
         '77e128965dbc7e94a31a908f58a5aa6c'
         'fd607f890103e97e480d814a5dfbee5b'
         '06bb49cf66cc1db8be5e476a54b1e933'
         '29aab2a7cdc82097b719935c01698777'
         '564f47c5cfab0a1b7b010ddbcf8e3b84'
         '8f99cfaae99f1542788dfbd7a39b5603'
         'a2d0530954e8eb19592f686e29c24c45'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e')

prepare() {
  # modify service management
  sed -i 's|^		\$SUDO service dnsmasq start|		$SUDO systemctl start dnsmasq|' "$srcdir"/$_pkgname-$pkgver/gravity.sh

  # change log location in admin php interface and scripts
  sed -i 's|/var/log/pihole.log|/run/log/pihole.log|' "$srcdir"/$_wwwpkgname-$_wwwpkgver/index.php
  sed -i 's|/var/log/pihole.log|/run/log/pihole.log|' "$srcdir"/$_wwwpkgname-$_wwwpkgver/api.php
  sed -i 's|/var/log/pihole.log|/run/log/pihole.log|' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/chronometer.sh

  # original toilet is in aur, enter figlet
  sed -i 's|		toilet -f small -F gay Pi-hole|		figlet Pi-hole|' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/chronometer.sh

  # little arch changes to chronometer.sh
  sed -i "/figlet Pi-hole/a NICDEV=$\(ip route get 8.8.8.8 | awk '{for\(i=1;i<=NF;i++\)if\(\$\i~/dev/\)print $\(i+1\)}'\)" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/chronometer.sh
  sed -i 's|$(ifconfig eth0 \||$(ifconfig $NICDEV \||' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/chronometer.sh
  sed -i 's|/inet addr/|/inet /|' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/chronometer.sh

  # change bin location in admin php interface
  sed -i 's|/usr/local/bin/|/usr/bin/|' "$srcdir"/$_wwwpkgname-$_wwwpkgver/index.php
  sed -i 's|/usr/local/bin/|/usr/bin/|' "$srcdir"/$_wwwpkgname-$_wwwpkgver/api.php

  # since we don't directly install from git...
  sed -i -e '/<b>Pi-hole Version <\/b> /,+1d' "$srcdir"/$_wwwpkgname-$_wwwpkgver/index.php
  sed -i -e '/<div class="pull-right hidden-xs">/a<b>Pi-hole Version </b> '"$pkgver"'\n<b> - Web Interface Version </b>'"$_wwwpkgver"'' "$srcdir"/$_wwwpkgname-$_wwwpkgver/index.php
}

package() {
  cd "$srcdir"
  install -Dm755 ./$_pkgname-$pkgver/gravity.sh "$pkgdir"/usr/bin/gravity.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/chronometer.sh "$pkgdir"/usr/bin/chronometer.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/blacklist.sh "$pkgdir"/usr/bin/blacklist.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/whitelist.sh "$pkgdir"/usr/bin/whitelist.sh || return 1
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
  install -Dm644 ./$_pkgname-$pkgver/advanced/index.html "$pkgdir"/srv/http/pihole/index.html || return 1
  cp -dpr --no-preserve=ownership $_wwwpkgname-$_wwwpkgver/* "$pkgdir"/srv/http/pihole/admin/
}

