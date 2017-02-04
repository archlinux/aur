# Maintainer:  max.bra <max dot bra at alice dot it>

pkgname=pi-hole-server
_pkgname=pi-hole
pkgver=2.12.1
pkgrel=2
_wwwpkgname=AdminLTE
_wwwpkgver=2.4
pkgdesc='The Pi-hole is an advertising-aware DNS/Web server. Arch adaptation for lan wide DNS server.'
arch=('any')
license=('GPL2')
url="https://github.com/pi-hole/pi-hole"
depends=('dnsmasq' 'lighttpd' 'php-cgi' 'bc' 'perl' 'net-tools')
conflicts=('pi-hole-standalone')
install=$pkgname.install
backup=('etc/pihole/whitelist.txt' 'etc/pihole/blacklist.txt')

source=(https://github.com/$_pkgname/$_pkgname/archive/v$pkgver.tar.gz
	https://github.com/$_pkgname/$_wwwpkgname/archive/v$_wwwpkgver.tar.gz
	configuration
	dnsmasq.main
	dnsmasq.include
	dnsmasq.local
	lighttpd.conf
	$_pkgname.tmpfile
	$_pkgname-gravity.service
	$_pkgname-gravity.timer
	$_pkgname-logtruncate.service
	$_pkgname-logtruncate.timer
	whitelist.txt
	blacklist.txt
	mimic_setupVars.conf.sh)

md5sums=('fe6c7e1c3ae51f688574c2f3816b9e0f'
         '6c05d58230a115c7facfa506e4611697'
         '3acf27ca01d931db363634dbfc95a061'
         '3f1aeea43af0b192edb36b9e5484ff87'
         'f39fa3e607ff7346e93febfa2d0e565e'
         '2d10140f19f54015e6ab2807267e8aaf'
         '27ee227bc8143addb6e80f194fc97719'
         '990b8abd0bfbba23a7ce82c59f2e3d64'
         '047f13d4ac97877f724f87b002aaee63'
         'd42a864f88299998f8233c0bc0dd093d'
         '94d5aa0e8aa3d4170bcea71078a9da25'
         '291d3c95e445fe65caf40c3605efd186'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         '302102fdaf6f59d232c552ee10c4a229')

prepare() {
  _ssc="/tmp/sedcontrol"

  # setting up and securing pihole wrapper script
  sed -n "/debugFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 1" && return 1 ; fi
  sed -i '/debugFunc() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/updatePiholeFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 2" && return 1 ; fi
  sed -i '/updatePiholeFunc() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/reconfigurePiholeFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 3" && return 1 ; fi
  sed -i '/reconfigurePiholeFunc() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/uninstallFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 5" && return 1 ; fi
  sed -i '/uninstallFunc() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/:::  \-[d,u]/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 6" && return 1 ; fi
  sed -i '/:::  \-[d,u,s]/d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/\"\-[d,u,r]/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 7" && return 1 ; fi
  sed -i '/\"\-[d,u,r,s]/d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/uninstall/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 8" && return 1 ; fi
  sed -i '/uninstall/d' "$srcdir"/$_pkgname-$pkgver/pihole

# -----------------

  # arch useless
  sed -n "/#ensure \/etc\/dnsmasq\.d\//w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: arch useless 1" && return 1 ; fi
  sed -i '/#ensure \/etc\/dnsmasq\.d\//,+5d' "$srcdir"/$_pkgname-$pkgver/gravity.sh
  sed -n "/#Overwrite /w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: arch useless 2" && return 1 ; fi
  sed -i '/#Overwrite /,+1d' "$srcdir"/$_pkgname-$pkgver/gravity.sh

# -----------------

  # change log location to pihole script
  sed -i "s|/var/log/pihole.log|/run/log/pihole/pihole.log|w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location to pihole script" && return 1 ; fi

# -----------------

  # change log location to piholeLogFlush.sh
  sed -i "s|/var/log/pihole.log|/run/log/pihole/pihole.log|w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/piholeLogFlush.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location to piholeLogFlush.sh" && return 1 ; fi

# -----------------

  # change log and bin location to logrotate
  sed -i "s|/var/log/pihole.log|/run/log/pihole/pihole.log|w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/logrotate
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log and bin location to logrotate 1" && return 1 ; fi
  sed -i "s|/usr/sbin|/usr/bin|w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/piholeLogFlush.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log and bin location to logrotate 2" && return 1 ; fi

# -----------------

  # change log location to chronometer.sh
  sed -i "s|/var/log/pihole.log|/run/log/pihole/pihole.log|w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/chronometer.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location to chronometer.sh" && return 1 ; fi

# -----------------

  # change log location in admin php interface
  sed -i "s|/var/log/pihole.log|/run/log/pihole/pihole.log|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/data.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location in admin php interface 1" && return 1 ; fi
  sed -i "s|/var/log/pihole.log|/run/log/pihole/pihole.log|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/settings.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location in admin php interface 2" && return 1 ; fi

# -----------------

  # since we don't directly install from git...
  sed -n "/\$piholeVersion =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/footer.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 1" && return 1 ; fi
  sed -i 's/\$piholeVersion =.*$/\$piholeVersion = "'"$pkgver"'";/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/footer.php
  sed -n "/\$webVersion =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/footer.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 2" && return 1 ; fi
  sed -i 's/\$webVersion =.*$/\$webVersion = "'"$_wwwpkgver"'";/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/footer.php

  sed -n "/\$piholeBranch =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/footer.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 3" && return 1 ; fi
  sed -i 's/\$piholeBranch =.*$/\$piholeBranch = "master";/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/footer.php
  sed -n "/\$webBranch =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/footer.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 4" && return 1 ; fi
  sed -i 's/\$webBranch =.*$/\$webBranch = "master";/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/footer.php

  sed -n "/\$piholeCommit =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/footer.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 3" && return 1 ; fi
  sed -i 's/\$piholeCommit =.*$/\$piholeCommit = NULL;/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/footer.php
  sed -n "/\$webCommit =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/footer.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 4" && return 1 ; fi
  sed -i 's/\$webCommit =.*$/\$webCommit = NULL;/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/footer.php

  sed -n "/piholeVersion=.*$/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 5" && return 1 ; fi
  sed -i 's/piholeVersion=.*$/piholeVersion="'"$pkgver"'";/' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh
  sed -n "/webVersion=.*$/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 6" && return 1 ; fi
  sed -i 's/webVersion=.*$/webVersion="'"$_wwwpkgver"'";/' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh

  sed -n "/\$piHoleVersion =.*$/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/index.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 7" && return 1 ; fi
  sed -i 's/\$piHoleVersion =.*$/\$piHoleVersion = "'"$pkgver"'";/' "$srcdir"/$_pkgname-$pkgver/advanced/index.php

# -----------------

  # sudo pihole full path (php-fpm compatibility)
  sed -i "s|sudo pihole|sudo /usr/bin/pihole|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/api.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: sudo pihole full path (php-fpm compatibility) 1" && return 1 ; fi
  sed -i "s|sudo pihole|sudo /usr/bin/pihole|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/header.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: sudo pihole full path (php-fpm compatibility) 2" && return 1 ; fi
  sed -i "s|sudo pihole|sudo /usr/bin/pihole|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/queryads.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: sudo pihole full path (php-fpm compatibility) 3" && return 1 ; fi
  sed -i "s|sudo pihole|sudo /usr/bin/pihole|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/savesettings.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: sudo pihole full path (php-fpm compatibility) 4" && return 1 ; fi
  sed -i "s|sudo pihole|sudo /usr/bin/pihole|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/sub.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: sudo pihole full path (php-fpm compatibility) 5" && return 1 ; fi
  sed -i "s|sudo pihole|sudo /usr/bin/pihole|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/add.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: sudo pihole full path (php-fpm compatibility) 6" && return 1 ; fi
  sed -i "s|sudo pihole|sudo /usr/bin/pihole|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/gravity.sh.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: sudo pihole full path (php-fpm compatibility) 7" && return 1 ; fi
  sed -i "s|sudo pihole|sudo /usr/bin/pihole|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/loginpage.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: sudo pihole full path (php-fpm compatibility) 8" && return 1 ; fi

# -----------------

  # pi-hole sudoers file is now populated by install script
  echo "http ALL=NOPASSWD: /usr/bin/pihole" >> ./$_pkgname-$pkgver/advanced/pihole.sudo
}

package() {
  cd "$srcdir"
  install -Dm755 ./$_pkgname-$pkgver/pihole "$pkgdir"/usr/bin/pihole || return 1

  install -dm755 "$pkgdir"/opt/pihole
  install -Dm755 ./$_pkgname-$pkgver/gravity.sh "$pkgdir"/opt/pihole/gravity.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/version.sh "$pkgdir"/opt/pihole/version.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/piholeLogFlush.sh "$pkgdir"/opt/pihole/piholeLogFlush.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/chronometer.sh "$pkgdir"/opt/pihole/chronometer.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/list.sh "$pkgdir"/opt/pihole/list.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/webpage.sh "$pkgdir"/opt/pihole/webpage.sh || return 1

  install -Dm755 mimic_setupVars.conf.sh "$pkgdir"/opt/pihole/mimic_setupVars.conf.sh || return 1

  install -dm750 "$pkgdir"/etc/sudoers.d
  install -Dm440 ./$_pkgname-$pkgver/advanced/pihole.sudo "$pkgdir"/etc/sudoers.d/pihole || return 1

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
  install -Dm644 ./$_pkgname-$pkgver/advanced/logrotate "$pkgdir"/etc/pihole/logrotate || return 1
  install -Dm644 whitelist.txt "$pkgdir"/etc/pihole/whitelist.txt || return 1
  install -Dm644 blacklist.txt "$pkgdir"/etc/pihole/blacklist.txt || return 1

  install -Dm644 configuration "$pkgdir"/usr/share/doc/pihole/configuration || return 1

  install -Dm644 dnsmasq.main "$pkgdir"/etc/pihole/configs/dnsmasq.main || return 1
  install -Dm644 dnsmasq.include "$pkgdir"/etc/dnsmasq.d/01-pihole.conf || return 1
  install -Dm644 dnsmasq.local "$pkgdir"/etc/dnsmasq.d/02-pihole.conf || return 1
  install -Dm644 lighttpd.conf "$pkgdir"/etc/pihole/configs/lighttpd.conf || return 1

  install -dm755 "$pkgdir"/srv/http/pihole/admin || return 1
  install -Dm644 ./$_pkgname-$pkgver/advanced/index.php "$pkgdir"/srv/http/pihole/pihole/index.php || return 1
  install -Dm644 ./$_pkgname-$pkgver/advanced/index.js "$pkgdir"/srv/http/pihole/pihole/index.js || return 1
  install -Dm644 ./$_pkgname-$pkgver/advanced/blockingpage.css "$pkgdir"/srv/http/pihole/pihole/blockingpage.css || return 1
  cp -dpr --no-preserve=ownership $_wwwpkgname-$_wwwpkgver/* "$pkgdir"/srv/http/pihole/admin/
}

