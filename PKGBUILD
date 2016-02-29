# Maintainer:  max.bra <max dot bra at alice dot it>

pkgname=pi-hole-server
_pkgname=pi-hole
pkgver=2.5.3
pkgrel=2
_wwwpkgname=AdminLTE
_wwwpkgver=1.1.3
pkgdesc='The Pi-hole is an advertising-aware DNS/Web server. Arch adaptation for lan wide DNS server.'
arch=('any')
license=('GPL2')
url="https://github.com/jacobsalmela/pi-hole"
depends=('dnsmasq' 'lighttpd' 'php-cgi' 'bc' 'figlet')
conflicts=('pi-hole-standalone')
install=$pkgname.install

source=(https://github.com/$_pkgname/$_pkgname/archive/v$pkgver.tar.gz
	https://github.com/$_pkgname/$_wwwpkgname/archive/v$_wwwpkgver.tar.gz
	configuration
	dnsmasq.include
	dnsmasq.complete
	lighttpd.conf
	$_pkgname.tmpfile
	$_pkgname-gravity.service
	$_pkgname-gravity.timer
	$_pkgname-logtruncate.service
	$_pkgname-logtruncate.timer
	whitelist.txt
	blacklist.txt)

md5sums=('30dbf80661c93668f7215e2c708693dc'
         'bca9867ebc3f93e92a522c4968d8fb56'
         '791c86996377ceca23d1459ea0fd5cd6'
         'fd607f890103e97e480d814a5dfbee5b'
         '06bb49cf66cc1db8be5e476a54b1e933'
         '29aab2a7cdc82097b719935c01698777'
         '564f47c5cfab0a1b7b010ddbcf8e3b84'
         '09a4bb7aef7bbe1a1f4c6c85c1fd48b4'
         'd42a864f88299998f8233c0bc0dd093d'
         '0a4921a2f655c5f178460aed0d6df068'
         '291d3c95e445fe65caf40c3605efd186'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e')

prepare() {
  # modify service management
  sed -i 's|^		\$SUDO service dnsmasq start|		$SUDO systemctl start dnsmasq|' "$srcdir"/$_pkgname-$pkgver/gravity.sh

  # gravity call paths changing
  sed -i 's|/usr/local/bin/|/usr/bin/|' "$srcdir"/$_pkgname-$pkgver/gravity.sh

  # adlists.default is already there
  sed -i '/\$SUDO cp \/etc\/.pihole\/adlists.default \/etc\/pihole\/adlists.default/d' "$srcdir"/$_pkgname-$pkgver/gravity.sh

  # change log location in admin php interface and scripts
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

  # change log location in admin php interface
  sed -i 's|/var/log/pihole.log|/run/log/pihole.log|' "$srcdir"/$_wwwpkgname-$_wwwpkgver/data.php

  # since we don't directly install from git...
  sed -i '/<b>Pi-hole Version <\/b> /,+1d' "$srcdir"/$_wwwpkgname-$_wwwpkgver/footer.php
  sed -i '/<div class="pull-right hidden-xs">/a<b>Pi-hole Version </b> '"$pkgver"'\n<b> - Web Interface Version </b>'"$_wwwpkgver"'' "$srcdir"/$_wwwpkgname-$_wwwpkgver/footer.php
}

package() {
  cd "$srcdir"
  install -Dm755 ./$_pkgname-$pkgver/gravity.sh "$pkgdir"/usr/bin/gravity.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/chronometer.sh "$pkgdir"/usr/bin/chronometer.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/blacklist.sh "$pkgdir"/usr/bin/blacklist.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/whitelist.sh "$pkgdir"/usr/bin/whitelist.sh || return 1
  install -Dm644 pi-hole.tmpfile "$pkgdir"/etc/tmpfiles.d/pi-hole.conf || return 1

  install -Dm644 "$_pkgname-gravity.timer" "$pkgdir/usr/lib/systemd/system/$_pkgname-gravity.timer"
  install -Dm644 "$_pkgname-gravity.service" $pkgdir/usr/lib/systemd/system/$_pkgname-gravity.service
  install -Dm644 "$_pkgname-logtruncate.timer" "$pkgdir/usr/lib/systemd/system/$_pkgname-logtruncate.timer"
  install -Dm644 "$_pkgname-logtruncate.service" $pkgdir/usr/lib/systemd/system/$_pkgname-logtruncate.service
  install -dm755 "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"
  ln -s ../$_pkgname-gravity.timer "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/$_pkgname-gravity.timer"
  ln -s ../$_pkgname-logtruncate.timer "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/$_pkgname-logtruncate.timer"

  install -dm777 "$pkgdir"/etc/pihole
  install -dm755 "$pkgdir"/etc/pihole/configs
  install -Dm644 ./$_pkgname-$pkgver/adlists.default "$pkgdir"/etc/pihole/adlists.default || return 1
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

