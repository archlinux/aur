# Maintainer:  max.bra <max dot bra at alice dot it>

pkgname=pi-hole-server
_pkgname=pi-hole
pkgver=2.9.4
pkgrel=2
_wwwpkgname=AdminLTE
_wwwpkgver=1.4.3.1
pkgdesc='The Pi-hole is an advertising-aware DNS/Web server. Arch adaptation for lan wide DNS server.'
arch=('any')
license=('GPL2')
url="https://github.com/pi-hole/pi-hole"
depends=('dnsmasq' 'lighttpd' 'php-cgi' 'bc' 'perl')
conflicts=('pi-hole-standalone')
install=$pkgname.install
backup=('etc/pihole/whitelist.txt' 'etc/pihole/blacklist.txt')

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
	blacklist.txt
	mimic_setupVars.conf.sh)

md5sums=('07d21b50616cab39726262f86a98cd8b'
         'c8d580fdcda4a95942641e4c9aa725e2'
         '5daed172a416a29aa87cfb66fd3288ed'
         'cba1675593bb43c94a35aabe8a210efa'
         'fc7852b5deb952335c0ebbf4ee61cb8c'
         '4d1d85e3572ef20dd5562e36414f1451'
         '990b8abd0bfbba23a7ce82c59f2e3d64'
         '047f13d4ac97877f724f87b002aaee63'
         'd42a864f88299998f8233c0bc0dd093d'
         '94d5aa0e8aa3d4170bcea71078a9da25'
         '291d3c95e445fe65caf40c3605efd186'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         '42a7805dc1d1e824673b9b93ac4b0308')

prepare() {
  _ssc="/tmp/sedcontrol"

  # sudoers setup
  sed -i "s/www-data/http/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/pihole.sudo
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: sudoers setup 1" && return 1 ; fi
  sed -i "s|/usr/local/bin|/usr/bin|w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/pihole.sudo
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: sudoers setup 2" && return 1 ; fi

# -----------------

  # setting up and securing pihole wrapper script
  sed -n "/debugFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 1" && return 1 ; fi
  sed -i '/debugFunc() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/updatePiholeFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 2" && return 1 ; fi
  sed -i '/updatePiholeFunc() {/,+67d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/setupLCDFunction() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 3" && return 1 ; fi
  sed -i '/setupLCDFunction() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/uninstallFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 4" && return 1 ; fi
  sed -i '/uninstallFunc() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/reconfigurePiholeFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 5" && return 1 ; fi
  sed -i '/reconfigurePiholeFunc() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/:::  \-[d,u,s]/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 6" && return 1 ; fi
  sed -i '/:::  \-[d,u,s]/d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/\"\-[d,u,r,s]/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 7" && return 1 ; fi
  sed -i '/\"\-[d,u,r,s]/d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/uninstall/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 8" && return 1 ; fi
  sed -i '/uninstall/d' "$srcdir"/$_pkgname-$pkgver/pihole

# -----------------

  # adlists.default is already there
  sed -i "s/cp \/etc\/.pihole\/adlists.default \/etc\/pihole\/adlists.default//w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: adlists.default is already there" && return 1 ; fi

# -----------------

  # arch useless
  sed -n "/#ensure \/etc\/dnsmasq\.d\//w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: arch useless 1" && return 1 ; fi
  sed -i '/#ensure \/etc\/dnsmasq\.d\//,+5d' "$srcdir"/$_pkgname-$pkgver/gravity.sh
  # cosmetics
  sed -i '325 a echo " done!"' "$srcdir"/$_pkgname-$pkgver/gravity.sh  

# -----------------

  # change log location to piholeLogFlush.sh
  sed -i "s|/var/log/pihole.log|/run/log/pihole/pihole.log|w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/piholeLogFlush.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location to piholeLogFlush.sh" && return 1 ; fi

# -----------------

  # change log location to chronometer.sh
  sed -i "s|/var/log/pihole.log|/run/log/pihole/pihole.log|w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/chronometer.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location to chronometer.sh" && return 1 ; fi

# -----------------

  # little arch changes to chronometer.sh
  sed -i "s|.*ifconfig eth0.*|NICDEV=\$\(ip route get 8.8.8.8 \| awk '{for\(i=1;i<=NF;i++\)if\(\$\i~/dev/\)print $\(i+1\)}'\)\n&|w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/chronometer.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: little arch changes to chronometer.sh 1" && return 1 ; fi
  sed -i "s|\$(ifconfig eth0 \||\$(ifconfig \$NICDEV \||w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/chronometer.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: little arch changes to chronometer.sh 2" && return 1 ; fi
  sed -i "s|/inet addr/|/inet /|w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/chronometer.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: little arch changes to chronometer.sh 3" && return 1 ; fi

# -----------------

  # change log location in admin php interface
  sed -i "s|/var/log/pihole.log|/run/log/pihole/pihole.log|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/data.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location in admin php interface" && return 1 ; fi

# -----------------

  # since we don't directly install from git...
  sed -n "/\$piholeVersion =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/footer.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 1" && return 1 ; fi
  sed -i 's/\$piholeVersion =.*$/\$piholeVersion = "'"$pkgver"'";/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/footer.php
  sed -n "/\$webVersion =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/footer.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 2" && return 1 ; fi
  sed -i 's/\$webVersion =.*$/\$webVersion = "'"$_wwwpkgver"'";/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/footer.php

  sed -n "/piholeVersion=.*$/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 3" && return 1 ; fi
  sed -i 's/piholeVersion=.*$/piholeVersion="'"$pkgver"'";/' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh
  sed -n "/webVersion=.*$/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 4" && return 1 ; fi
  sed -i 's/webVersion=.*$/webVersion="'"$_wwwpkgver"'";/' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh

}

package() {
  cd "$srcdir"
  install -Dm755 ./$_pkgname-$pkgver/pihole "$pkgdir"/usr/bin/pihole || return 1

  install -dm755 "$pkgdir"/opt/pihole
  install -Dm755 ./$_pkgname-$pkgver/gravity.sh "$pkgdir"/opt/pihole/gravity.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/version.sh "$pkgdir"/opt/pihole/version.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/piholeLogFlush.sh "$pkgdir"/opt/pihole/piholeLogFlush.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/chronometer.sh "$pkgdir"/opt/pihole/chronometer.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/blacklist.sh "$pkgdir"/opt/pihole/blacklist.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/whitelist.sh "$pkgdir"/opt/pihole/whitelist.sh || return 1

  install -Dm755 mimic_setupVars.conf.sh "$pkgdir"/opt/pihole/mimic_setupVars.conf.sh || return 1

  install -dm750 "$pkgdir"/etc/sudoers.d
  install -Dm644 ./$_pkgname-$pkgver/advanced/pihole.sudo "$pkgdir"/etc/sudoers.d/pihole || return 1

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
  install -Dm644 ./$_pkgname-$pkgver/advanced/index.js "$pkgdir"/srv/http/pihole/index.js || return 1
  cp -dpr --no-preserve=ownership $_wwwpkgname-$_wwwpkgver/* "$pkgdir"/srv/http/pihole/admin/
}

