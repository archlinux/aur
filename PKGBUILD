# Maintainer:  max.bra <max dot bra dot gtalk at gmail dot com>
# Maintainer:  graysky <graysky AT archlinux DOT us>

pkgname=pi-hole-server
_pkgname=pi-hole
pkgver=3.1
pkgrel=6
_wwwpkgname=AdminLTE
_wwwpkgver=3.1
pkgdesc='The Pi-hole is an advertising-aware DNS/Web server. Arch adaptation for lan wide DNS server.'
arch=('any')
license=('EUPL-1.1')
url="https://github.com/pi-hole/pi-hole"
depends=('dnsmasq' 'bc' 'perl' 'net-tools' 'logrotate' 'pi-hole-ftl')
optdepends=(
'lighttpd: a secure, fast, compliant and very flexible web-server'
'php-cgi: CGI and FCGI SAPI for PHP needed only for lighttpd'
'nginx-mainline: lightweight http server'
'php-fpm: FastCGI process manager for php needed for nginx'
)
conflicts=('pi-hole-standalone')
install=$pkgname.install
backup=('etc/pihole/whitelist.txt' 'etc/pihole/blacklist.txt')

source=(pihole-$pkgver.tar.gz::https://github.com/$_pkgname/$_pkgname/archive/v$pkgver.tar.gz
	admin-$_wwwpkgver.tar.gz::https://github.com/$_pkgname/$_wwwpkgname/archive/v$_wwwpkgver.tar.gz
	configuration
	dnsmasq.main
	dnsmasq.include
	dnsmasq.local
	lighttpd.conf
	nginx.pi-hole.conf
	$_pkgname.tmpfile
	$_pkgname-gravity.service
	$_pkgname-gravity.timer
	$_pkgname-logtruncate.service
	$_pkgname-logtruncate.timer
	whitelist.txt
	blacklist.txt
	mimic_setupVars.conf.sh
	version.patch)

md5sums=('e24ce6a12ee97cd7de2c5ab13af99511'
         '2c0bf61ec96bdb85edeb9fd2cc2f330b'
         '3acf27ca01d931db363634dbfc95a061'
         '3f1aeea43af0b192edb36b9e5484ff87'
         '7ac346581ada71187b7fd18f164bbee9'
         '2d10140f19f54015e6ab2807267e8aaf'
         'a8a64dc2ff89bb87d534c83189447abc'
         'ebe0b0785fcc7b10accff3c1ae793cd2'
         '990b8abd0bfbba23a7ce82c59f2e3d64'
         '047f13d4ac97877f724f87b002aaee63'
         'd42a864f88299998f8233c0bc0dd093d'
         '94d5aa0e8aa3d4170bcea71078a9da25'
         '291d3c95e445fe65caf40c3605efd186'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         '966a61aee3948cdfd92f1eb1a8180f1d'
         '93fe5e50cf3fcb08b24cf29b0cace85b')

prepare() {
  _ssc="/tmp/sedcontrol"

  # setting up and securing pihole wrapper script
  sed -n "/debugFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 1" && return 1 ; fi
  sed -i '/debugFunc() {/,+16d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/updatePiholeFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 2" && return 1 ; fi
  sed -i '/updatePiholeFunc() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/reconfigurePiholeFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 3" && return 1 ; fi
  sed -i '/reconfigurePiholeFunc() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/uninstallFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 4" && return 1 ; fi
  sed -i '/uninstallFunc() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/piholeCheckoutFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 5" && return 1 ; fi
  sed -i '/piholeCheckoutFunc() {/,+20d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/tricorderFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 6" && return 1 ; fi
  sed -i '/tricorderFunc() {/,+29d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/\"\-[d,r,up]/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 7" && return 1 ; fi
  sed -i '/\"\-[d,r,up]/d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/uninstall/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 8" && return 1 ; fi
  sed -i '/uninstall/d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -i "s|^  checkout.*$|\";|w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 9" && return 1 ; fi

  sed -n "/checkout/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 10" && return 1 ; fi
  sed -i '/checkout/d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/tricorder/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 10" && return 1 ; fi
  sed -i '/tricorder/d' "$srcdir"/$_pkgname-$pkgver/pihole

# -----------------

  # setup gravity.sh
  sed -n "/#ensure \/etc\/dnsmasq\.d\//w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setup gravity.sh 1" && return 1 ; fi
  sed -i '/#ensure \/etc\/dnsmasq\.d\//,+5d' "$srcdir"/$_pkgname-$pkgver/gravity.sh
#  sed -n "/#Overwrite /w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
#  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setup gravity.sh 2" && return 1 ; fi
#  sed -i '/#Overwrite /,+1d' "$srcdir"/$_pkgname-$pkgver/gravity.sh
  sed -i "s|/usr/local/bin/pihole|/usr/bin/pihole|w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setup gravity.sh 2" && return 1 ; fi
  sed -i "s|/etc/.pihole|/etc/pihole|w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setup gravity.sh 3" && return 1 ; fi

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
  sed -i "s|/var/log/pihole-FTL.log|/run/log/pihole-ftl/pihole-FTL.log|w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/logrotate
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log and bin location to logrotate 2" && return 1 ; fi
  sed -i "s|/usr/sbin|/usr/bin|w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/piholeLogFlush.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log and bin location to logrotate 3" && return 1 ; fi

# -----------------

  # change FTL port file location to chronometer.sh
  sed -i "s|/var/run/pihole-FTL.port|/run/pihole-ftl/pihole-FTL.port|w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/chronometer.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change FTL port file location to chronometer.sh" && return 1 ; fi

# -----------------

  # no debug for us, right now
  sed -n "/\-\- Generate debug log \-\-/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/header.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: no debug for us, right now 1" && return 1 ; fi
  sed -i '/\-\- Generate debug log \-\-/,+5d' "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/header.php

# -----------------

  # change log location in admin php interface
  sed -i "s|/var/log/pihole.log|/run/log/pihole/pihole.log|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/data.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location in admin php interface 1" && return 1 ; fi
  sed -i "s|/var/log/pihole.log|/run/log/pihole/pihole.log|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/settings.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location in admin php interface 2" && return 1 ; fi

  sed -i "s|/var/run/pihole-FTL.port|/run/pihole-ftl/pihole-FTL.port|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/FTL.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location in admin php interface 3" && return 1 ; fi
  sed -i "s|/var/log/pihole-FTL.log|/run/log/pihole-ftl/pihole-FTL.log|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/tailLog.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location in admin php interface 4" && return 1 ; fi
  sed -i "s|/var/log/pihole.log|/run/log/pihole/pihole.log|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/tailLog.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location in admin php interface 5" && return 1 ; fi

# -----------------

  # since we don't directly install from git...
  sed -n "/\$core_branch =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 1" && return 1 ; fi
  sed -i 's/\$core_branch =.*$/\$core_branch = "master";/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php
  sed -n "/\$web_branch =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 2" && return 1 ; fi
  sed -i 's/\$web_branch =.*$/\$web_branch = "master";/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php

  sed -n "/\$core_current =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 3" && return 1 ; fi
  sed -i 's/\$core_current =.*$/\$core_current = "'"$pkgver"'";/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php
  sed -n "/\$web_current =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 4" && return 1 ; fi
  sed -i 's/\$web_current =.*$/\$web_current = "'"$_wwwpkgver"'";/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php

  sed -n "/\$core_commit =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 5" && return 1 ; fi
  sed -i 's/\$core_commit =.*$/\$core_commit = NULL;/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php
  sed -n "/\$web_commit =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 6" && return 1 ; fi
  sed -i 's/\$web_commit =.*$/\$web_commit = NULL;/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php

  sed -n "/\$piHoleVersion =.*$/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/index.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 7" && return 1 ; fi
  sed -i 's/\$piHoleVersion =.*$/\$piHoleVersion = "'"$pkgver"'";/' "$srcdir"/$_pkgname-$pkgver/advanced/index.php

  sed -i "s|/var/www/html/admin/|/srv/http/pihole/admin/|w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 8" && return 1 ; fi

#  sed -n "/\$(getLocalVersion \"\${PHGITDIR}\")/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh
#  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 9" && return 1 ; fi
#  sed -i "s/\$(getLocalVersion \"\${PHGITDIR}\")/$pkgver/" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh

#  sed -n "/\$(getLocalVersion \"\${WEBGITDIR}\")/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh
#  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 10" && return 1 ; fi
#  sed -i "s/\$(getLocalVersion \"\${WEBGITDIR}\")/$_wwwpkgver/" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh

#  sed -n "/\$(getLocalHash \"\${PHGITDIR}\")/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh
#  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 11" && return 1 ; fi
#  sed -i "s/\$(getLocalHash \"\${PHGITDIR}\")/N.A./" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh

#  sed -n "/\$(getLocalHash \"\${WEBGITDIR}\")/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh
#  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 12" && return 1 ; fi
#  sed -i "s/\$(getLocalHash \"\${WEBGITDIR}\")/N.A./" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh

  cd "$srcdir"/"$_pkgname"-"$pkgver"
  patch -p1 -i "$srcdir"/version.patch
  cd "$srcdir"

  sed -n "/{{corever}}/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 9" && return 1 ; fi
  sed -i "s/{{corever}}/$pkgver/" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh
  sed -n "/{{webver}}/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 10" && return 1 ; fi
  sed -i "s/{{webver}}/$_wwwpkgver/" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh

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
  echo "http ALL=NOPASSWD: /usr/bin/pihole" >> $_pkgname-$pkgver/advanced/pihole.sudo
}

package() {
  cd "$srcdir"
  install -Dm755 $_pkgname-$pkgver/pihole "$pkgdir"/usr/bin/pihole

  install -dm755 "$pkgdir"/opt/pihole
  install -Dm755 $_pkgname-$pkgver/gravity.sh "$pkgdir"/opt/pihole/gravity.sh
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/version.sh "$pkgdir"/opt/pihole/version.sh
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/piholeLogFlush.sh "$pkgdir"/opt/pihole/piholeLogFlush.sh
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/chronometer.sh "$pkgdir"/opt/pihole/chronometer.sh
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/list.sh "$pkgdir"/opt/pihole/list.sh
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/webpage.sh "$pkgdir"/opt/pihole/webpage.sh

  install -Dm755 mimic_setupVars.conf.sh "$pkgdir"/opt/pihole/mimic_setupVars.conf.sh

  install -dm750 "$pkgdir"/etc/sudoers.d
  install -Dm440 $_pkgname-$pkgver/advanced/pihole.sudo "$pkgdir"/etc/sudoers.d/pihole

  install -Dm644 pi-hole.tmpfile "$pkgdir"/usr/lib/tmpfiles.d/pi-hole.conf

  install -Dm644 "$_pkgname-gravity.timer" "$pkgdir/usr/lib/systemd/system/$_pkgname-gravity.timer"
  install -Dm644 "$_pkgname-gravity.service" $pkgdir/usr/lib/systemd/system/$_pkgname-gravity.service
  install -Dm644 "$_pkgname-logtruncate.timer" "$pkgdir/usr/lib/systemd/system/$_pkgname-logtruncate.timer"
  install -Dm644 "$_pkgname-logtruncate.service" $pkgdir/usr/lib/systemd/system/$_pkgname-logtruncate.service
  install -dm755 "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"
  ln -s $_pkgname-gravity.timer "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/$_pkgname-gravity.timer"
  ln -s $_pkgname-logtruncate.timer "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/$_pkgname-logtruncate.timer"

  install -dm755 "$pkgdir"/etc/pihole
  install -dm755 "$pkgdir"/etc/pihole/configs
  install -Dm644 $_pkgname-$pkgver/adlists.default "$pkgdir"/etc/pihole/adlists.default
  install -Dm644 $_pkgname-$pkgver/advanced/logrotate "$pkgdir"/etc/pihole/logrotate
  install -Dm644 whitelist.txt "$pkgdir"/etc/pihole/whitelist.txt
  install -Dm644 blacklist.txt "$pkgdir"/etc/pihole/blacklist.txt

  install -Dm644 configuration "$pkgdir"/usr/share/doc/pihole/configuration

  install -Dm644 dnsmasq.main "$pkgdir"/etc/pihole/configs/dnsmasq.main
  install -Dm644 dnsmasq.include "$pkgdir"/etc/dnsmasq.d/01-pihole.conf
  install -Dm644 dnsmasq.local "$pkgdir"/etc/dnsmasq.d/02-pihole.conf
  install -Dm644 lighttpd.conf "$pkgdir"/etc/pihole/configs/lighttpd.conf
  install -Dm644 nginx.pi-hole.conf "$pkgdir"/etc/pihole/configs/nginx.pi-hole.conf

  install -dm755 "$pkgdir"/srv/http/pihole/admin
  install -Dm644 $_pkgname-$pkgver/advanced/index.php "$pkgdir"/srv/http/pihole/pihole/index.php
  install -Dm644 $_pkgname-$pkgver/advanced/index.js "$pkgdir"/srv/http/pihole/pihole/index.js
  install -Dm644 $_pkgname-$pkgver/advanced/blockingpage.css "$pkgdir"/srv/http/pihole/pihole/blockingpage.css
  cp -dpr --no-preserve=ownership $_wwwpkgname-$_wwwpkgver/* "$pkgdir"/srv/http/pihole/admin/
}

