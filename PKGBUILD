# Maintainer:  max.bra <max dot bra dot gtalk at gmail dot com>
# Maintainer:  graysky <graysky AT archlinux DOT us>

pkgname=pi-hole-server
_pkgname=pi-hole
pkgver=4.1
pkgrel=1
_wwwpkgname=AdminLTE
_wwwpkgver=4.1
pkgdesc='The Pi-hole is an advertising-aware DNS/Web server. Arch adaptation for lan wide DNS server.'
arch=('any')
license=('EUPL-1.1')
url="https://github.com/pi-hole/pi-hole"
depends=('pi-hole-ftl' 'bc' 'perl' 'net-tools' 'iproute2' 'logrotate' 'bind-tools')
optdepends=(
'lighttpd: a secure, fast, compliant and very flexible web-server'
'php-cgi: CGI and FCGI SAPI for PHP needed only for lighttpd'
'nginx-mainline: lightweight http server'
'php-fpm: FastCGI process manager for php needed for nginx'
)
conflicts=('pi-hole-standalone')
install=$pkgname.install
backup=('etc/pihole/whitelist.txt' 'etc/pihole/blacklist.txt' 'etc/pihole/regex.list'
'etc/dnsmasq.d/01-pihole.conf' 'etc/pihole/adlists.list' 'etc/dnsmasq.conf')

source=(pihole-$pkgver.tar.gz::https://github.com/$_pkgname/$_pkgname/archive/v$pkgver.tar.gz
	admin-$_wwwpkgver.tar.gz::https://github.com/$_pkgname/$_wwwpkgname/archive/v$_wwwpkgver.tar.gz
	dnsmasq.include
	lighttpd.pi-hole.conf
	nginx.pi-hole.conf
	$_pkgname.tmpfile
	$_pkgname-gravity.service
	$_pkgname-gravity.timer
	$_pkgname-logtruncate.service
	$_pkgname-logtruncate.timer
	mimic_setupVars.conf.sh
	version.patch
	piholeDebug.sh
  )

md5sums=('d4e3f74a7a49c243c8b49b27923ecff3'
         '176e9bb1bcdbb4cb4e54e859b93d2d0d'
         '4d6b3db77bd0b712fc193aa32ba4eea8'
         '971cc2859672341d77f8deba702fb7f7'
         'b63fcf29c29796023a2677bcf2b369a7'
         '9bc23c314397a0f59978cfe246140cda'
         '047f13d4ac97877f724f87b002aaee63'
         'd42a864f88299998f8233c0bc0dd093d'
         '20c5b0c6b4e23e55b25ab6c28dda709d'
         '291d3c95e445fe65caf40c3605efd186'
         'c227ffa88ddebc34cb715b73640cd845'
         '3c120e67240f6f83f4d803a211fc16aa'
         'd7b69ae51db0e8ac8e27f20a234eed85')

prepare() {
  _ssc="/tmp/sedcontrol"
  
  # the return of service management
  sed -i "s|service \${resolver} \${svcOption}|systemctl \${svcOption} \${resolver}|w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: the return of service management" && return 1 ; fi

  # setting up and securing pihole wrapper script
  #sed -n "/debugFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  #if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 1" && return 1 ; fi
  #sed -i '/debugFunc() {/,+16d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/updatePiholeFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 2" && return 1 ; fi
  sed -i '/updatePiholeFunc() {/,+5d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/reconfigurePiholeFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 3" && return 1 ; fi
  sed -i '/reconfigurePiholeFunc() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/uninstallFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 4" && return 1 ; fi
  sed -i '/uninstallFunc() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/piholeCheckoutFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 5" && return 1 ; fi
  sed -i '/piholeCheckoutFunc() {/,+22d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/tricorderFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 6" && return 1 ; fi
  sed -i '/tricorderFunc() {/,+29d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/\"\-[r,up]/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 7" && return 1 ; fi
  sed -i '/\"\-[r,up]/d' "$srcdir"/$_pkgname-$pkgver/pihole

  #sed -n "/^  \-d/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  #if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 8" && return 1 ; fi
  #sed -i '/^  \-d/,+2d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/^  \-up/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 9" && return 1 ; fi
  sed -i '/^  \-up/d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/^  \-r/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 10" && return 1 ; fi
  sed -i '/^  \-r/d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/uninstall/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 11" && return 1 ; fi
  sed -i '/uninstall/d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -i "s|^  checkout.*$|\";|w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 12" && return 1 ; fi

  sed -n "/checkout/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 13" && return 1 ; fi
  sed -i '/checkout/d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/tricorder/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 14" && return 1 ; fi
  sed -i '/tricorder/d' "$srcdir"/$_pkgname-$pkgver/pihole

# -----------------

  # setup gravity.sh
  sed -i "s|/usr/local/bin/|/usr/bin/|w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setup gravity.sh 1" && return 1 ; fi

# -----------------

  # setting up and securing webpage.sh script
  sed -i "s|/usr/local/bin/|/usr/bin/|w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing webpage.sh script 1" && return 1 ; fi

# -----------------

  # change log location to pihole script
  sed -i "s|/var/log/pihole.log|/run/log/pihole/pihole.log|w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location to pihole script" && return 1 ; fi

# -----------------

  # change log location to piholeLogFlush.sh
  sed -n "/\/var\/log\/pihole.log/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/piholeLogFlush.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location to piholeLogFlush.sh" && return 1 ; fi
  sed -i "s|/var/log/pihole.log|/run/log/pihole/pihole.log|g" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/piholeLogFlush.sh

# -----------------

  # change log and bin location to logrotate
  sed -i "s|/var/log/pihole.log|/run/log/pihole/pihole.log|w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Templates/logrotate
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log and bin location to logrotate 1" && return 1 ; fi
  sed -i "s|/var/log/pihole-FTL.log|/run/log/pihole-ftl/pihole-FTL.log|w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Templates/logrotate
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
  #sed -i "s|/var/log/pihole.log|/run/log/pihole/pihole.log|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/data.php
  #if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location in admin php interface 1" && return 1 ; fi

  sed -i "s|/var/run/pihole-FTL.port|/run/pihole-ftl/pihole-FTL.port|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/FTL.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location in admin php interface 2" && return 1 ; fi
  sed -i "s|/var/log/pihole-FTL.log|/run/log/pihole-ftl/pihole-FTL.log|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/tailLog.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location in admin php interface 3" && return 1 ; fi
  sed -i "s|/var/log/pihole.log|/run/log/pihole/pihole.log|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/tailLog.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change log location in admin php interface 4" && return 1 ; fi

# -----------------

  # since we don't directly install from git...
#  sed -n "/\$core_branch =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php
#  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 1" && return 1 ; fi
#  sed -i 's/\$core_branch =.*$/\$core_branch = "master";/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php
#  sed -n "/\$web_branch =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php
#  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 2" && return 1 ; fi
#  sed -i 's/\$web_branch =.*$/\$web_branch = "master";/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php

  sed -n "/\$core_current =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 3" && return 1 ; fi
  sed -i 's/\$core_current =.*$/\$core_current = "'"$pkgver"'";/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php
  sed -n "/\$web_current =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 4" && return 1 ; fi
  sed -i 's/\$web_current =.*$/\$web_current = "'"$_wwwpkgver"'";/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php
  sed -n "/\$FTL_current =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 5" && return 1 ; fi
  sed -i 's/\$FTL_current =.*$/\$FTL_current = exec("pihole-FTL version");/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php

#  sed -n "/\$core_commit =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php
#  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 6" && return 1 ; fi
#  sed -i 's/\$core_commit =.*$/\$core_commit = NULL;/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php
#  sed -n "/\$web_commit =.*$/w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php
#  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 7" && return 1 ; fi
#  sed -i 's/\$web_commit =.*$/\$web_commit = NULL;/' "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/update_checker.php

  sed -i "s|/var/www/html/admin/|/srv/http/pihole/admin/|w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/version.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: since we don't directly install from git... 8" && return 1 ; fi

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

  # web admin footer update setup
  sed -i "s|https:\/\/github.com\/pi-hole\/pi-hole\/releases|https:\/\/aur.archlinux.org\/packages\/pi-hole-server|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/footer.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: web admin footer update setup 1" && return 1 ; fi
  sed -i "s|https:\/\/github.com\/pi-hole\/AdminLTE\/releases|https:\/\/aur.archlinux.org\/packages\/pi-hole-server|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/footer.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: web admin footer update setup 2" && return 1 ; fi
  sed -i "s|https:\/\/github.com\/pi-hole\/FTL\/releases|https:\/\/aur.archlinux.org\/packages\/pi-hole-server|w $_ssc" "$srcdir"/$_wwwpkgname-$_wwwpkgver/scripts/pi-hole/php/footer.php
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: web admin footer update setup 3" && return 1 ; fi

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
  echo "http ALL=NOPASSWD: /usr/bin/pihole" >> $_pkgname-$pkgver/advanced/Templates/pihole.sudo

  # pi-hole dnsmasq config file include ready
  echo "conf-dir=/etc/dnsmasq.d/,*.conf" >> $_pkgname-$pkgver/advanced/dnsmasq.conf.original

  # adlists.default is gone and adlists.list is populated by install script
  # from basic-install.sh -- function chooseBlocklists()
  cat <<EOF > $_pkgname-$pkgver/adlists.list
https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
https://mirror1.malwaredomains.com/files/justdomains
http://sysctl.org/cameleon/hosts
https://zeustracker.abuse.ch/blocklist.php?download=domainblocklist
https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt
https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt
https://hosts-file.net/ad_servers.txt
EOF
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
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/COL_TABLE "$pkgdir"/opt/pihole/COL_TABLE
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/wildcard_regex_converter.sh "$pkgdir"/opt/pihole/wildcard_regex_converter.sh
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/query.sh "$pkgdir"/opt/pihole/query.sh

  install -Dm755 piholeDebug.sh "$pkgdir"/opt/pihole/piholeDebug.sh
  install -Dm755 mimic_setupVars.conf.sh "$pkgdir"/opt/pihole/mimic_setupVars.conf.sh

  install -dm750 "$pkgdir"/etc/sudoers.d
  install -Dm440 $_pkgname-$pkgver/advanced/Templates/pihole.sudo "$pkgdir"/etc/sudoers.d/pihole
  install -Dm644 $_pkgname-$pkgver/advanced/dnsmasq.conf.original "$pkgdir"/etc/dnsmasq.conf
#  install -Dm644 dnsmasq.main "$pkgdir"/usr/share/pihole/configs/dnsmasq.example.conf
  install -Dm644 dnsmasq.include "$pkgdir"/etc/dnsmasq.d/01-pihole.conf

  install -Dm644 pi-hole.tmpfile "$pkgdir"/usr/lib/tmpfiles.d/pi-hole.conf

  install -Dm644 "$_pkgname-gravity.timer" "$pkgdir/usr/lib/systemd/system/$_pkgname-gravity.timer"
  install -Dm644 "$_pkgname-gravity.service" $pkgdir/usr/lib/systemd/system/$_pkgname-gravity.service
  install -Dm644 "$_pkgname-logtruncate.timer" "$pkgdir/usr/lib/systemd/system/$_pkgname-logtruncate.timer"
  install -Dm644 "$_pkgname-logtruncate.service" $pkgdir/usr/lib/systemd/system/$_pkgname-logtruncate.service
  install -dm755 "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"
  ln -s ../$_pkgname-gravity.timer "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/$_pkgname-gravity.timer"
  ln -s ../$_pkgname-logtruncate.timer "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/$_pkgname-logtruncate.timer"

  install -dm755 "$pkgdir"/etc/pihole
  install -dm755 "$pkgdir"/usr/share/pihole/configs
  install -Dm644 $_pkgname-$pkgver/adlists.list "$pkgdir"/etc/pihole/adlists.list
  install -Dm644 $_pkgname-$pkgver/advanced/Templates/logrotate "$pkgdir"/etc/pihole/logrotate
  install -Dm644 /dev/null "$pkgdir"/etc/pihole/whitelist.txt
  install -Dm644 /dev/null "$pkgdir"/etc/pihole/blacklist.txt
  install -Dm644 /dev/null "$pkgdir"/etc/pihole/regex.list

  install -Dm644 lighttpd.pi-hole.conf "$pkgdir"/usr/share/pihole/configs/lighttpd.example.conf
  install -Dm644 nginx.pi-hole.conf "$pkgdir"/usr/share/pihole/configs/nginx.example.conf

  install -dm755 "$pkgdir"/srv/http/pihole/admin
  install -Dm644 $_pkgname-$pkgver/advanced/index.php "$pkgdir"/srv/http/pihole/pihole/index.php
#  install -Dm644 $_pkgname-$pkgver/advanced/index.js "$pkgdir"/srv/http/pihole/pihole/index.js
  install -Dm644 $_pkgname-$pkgver/advanced/blockingpage.css "$pkgdir"/srv/http/pihole/pihole/blockingpage.css

  cp -dpr --no-preserve=ownership $_wwwpkgname-$_wwwpkgver/* "$pkgdir"/srv/http/pihole/admin/

  install -dm755 "$pkgdir"/usr/share/licenses/pihole
  install -Dm644 ${pkgname%-*}-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/pihole/Pi-hole
  install -Dm644 $_wwwpkgname-$_wwwpkgver/LICENSE "$pkgdir"/usr/share/licenses/pihole/AdminLTE
  install -Dm644 $_wwwpkgname-$_wwwpkgver/style/vendor/SourceSansPro/OFL.txt \
    "$pkgdir"/usr/share/licenses/pihole/SourceSansPro

  rm "$pkgdir"/srv/http/pihole/admin/*.md
  rm "$pkgdir"/srv/http/pihole/admin/LICENSE
  rm "$pkgdir"/srv/http/pihole/admin/style/vendor/LICENSE
  rm "$pkgdir"/srv/http/pihole/admin/scripts/vendor/LICENSE
  rm "$pkgdir"/srv/http/pihole/admin/style/vendor/SourceSansPro/OFL.txt
}
