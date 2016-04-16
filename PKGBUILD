# Maintainer:  max.bra <max dot bra at alice dot it>

pkgname=pi-hole-server
_pkgname=pi-hole
pkgver=2.6.2
pkgrel=5
_wwwpkgname=AdminLTE
_wwwpkgver=1.2
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

md5sums=('f899e540c76224575d15ed7af928703e'
         '6daf833c014dc65812409a3685f90411'
         '791c86996377ceca23d1459ea0fd5cd6'
         'cba1675593bb43c94a35aabe8a210efa'
         'fc7852b5deb952335c0ebbf4ee61cb8c'
         '5fce8b696b1d82050d87a3f8f19c0aea'
         '008d6cb6a8ea389d22cbb969c62b0c80'
         '09a4bb7aef7bbe1a1f4c6c85c1fd48b4'
         'd42a864f88299998f8233c0bc0dd093d'
         '7b9925a4516d91cd4282f181a4b4e473'
         '291d3c95e445fe65caf40c3605efd186'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e')

prepare() {
  _ssc="/tmp/sedcontrol"

  # undebianizing
  sed -i 's|\[\[ \$(dpkg-query -s sudo) \]\]|hash sudo 2\>\/dev\/null|'"w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: undebianizing" && return 1 ; fi

  # modify service management
  sed -i 's|\[\[ \$dnsmasqPid \]\]|systemctl is-active dnsmasq 2\>\&1 \>\/dev\/null|'"w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: modify service management 1" && return 1 ; fi
  sed -i "s|\$SUDO kill -HUP \"\$dnsmasqPid\"|\$SUDO systemctl reload dnsmasq|w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: modify service management 2" && return 1 ; fi
  sed -i "s|\$SUDO service dnsmasq start|\$SUDO systemctl start dnsmasq|w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: modify service management 3" && return 1 ; fi

  # gravity call paths changing
  sed -i "s|/opt/pihole/|/usr/bin/|w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: gravity call paths changing" && return 1 ; fi

  # adlists.default is already there
  sed -i "s/\$SUDO cp \/etc\/.pihole\/adlists.default \/etc\/pihole\/adlists.default//w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: adlists.default is already there" && return 1 ; fi

  # arch useless
  sed -n "/#ensure \/etc\/dnsmasq\.d\//w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: arch useless" && return 1 ; fi
  sed -i '/#ensure \/etc\/dnsmasq\.d\//,+5d' "$srcdir"/$_pkgname-$pkgver/gravity.sh

  # change log location in admin php interface and scripts
  sed -i "s|/var/log/pihole.log|/run/log/pihole/pihole.log|w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/chronometer.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location in admin php interface and scripts" && return 1 ; fi

  # original toilet is in aur, enter figlet
  sed -i "s|toilet -f small -F gay Pi-hole|figlet Pi-hole|w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/chronometer.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: original toilet is in aur, enter figlet" && return 1 ; fi

  # little arch changes to chronometer.sh
  sed -n "/figlet Pi-hole/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/chronometer.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: little arch changes to chronometer.sh 1" && return 1 ; fi
  sed -i "/figlet Pi-hole/a NICDEV=\$\(ip route get 8.8.8.8 | awk '{for\(i=1;i<=NF;i++\)if\(\$\i~/dev/\)print $\(i+1\)}'\)" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/chronometer.sh
  sed -i "s|\$(ifconfig eth0 \||\$(ifconfig \$NICDEV \||w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/chronometer.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: little arch changes to chronometer.sh 2" && return 1 ; fi
  sed -i "s|/inet addr/|/inet /|w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/chronometer.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: little arch changes to chronometer.sh 3" && return 1 ; fi

  # change log location in admin php interface
  sed -i "s|/var/log/pihole.log|/run/log/pihole/pihole.log|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/data.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location in admin php interface" && return 1 ; fi

  # since we don't directly install from git...
  sed -n "/<b>Pi-hole Version <\/b> /w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/footer.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 1" && return 1 ; fi
  sed -i '/<b>Pi-hole Version <\/b> /,+1d' "$srcdir"/$_wwwpkgname-$_wwwpkgver/footer.php
  sed -n "/<div class=\"pull-right hidden-xs\">/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/footer.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 2" && return 1 ; fi
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

